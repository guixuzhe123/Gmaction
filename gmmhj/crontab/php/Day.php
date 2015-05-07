<?php
date_default_timezone_set('Asia/Shanghai');//'Asia/Shanghai' 亚洲/上海
include 'mysql_class.php';

$config = array(
    'DB_HOST' => '192.168.68.238', // 服务器地址
    'DB_PORT' => 3306,
    'DB_NAME' => 'gm', // 数据库名
    'DB_USER' => 'gm', // 用户名
    'DB_PWD' => 'gqihh4zkp0_kgug', // 密码
);
$public_log_config = array(
    'DB_HOST' => '192.168.68.1', // 服务器地址
    'DB_PORT' => 3306,
    'DB_NAME' => 'public_log', // 数据库名
    'DB_USER' => 'selecter', // 用户名
    'DB_PWD' => '111111', // 密码
);
//-------------gameserver--------------

//Db_class($dbhost, $dbuser, $dbpw, $dbname, $pconnect = 0)
$db_gm = new DB_class($config['DB_HOST'].":".$config['DB_PORT'],$config['DB_USER'],$config['DB_PWD'],$config['DB_NAME']);

$sql = "select * from gm_serverinfo";
$games = $db_gm->get_all($sql);

$db_paylog = new DB_class($public_log_config['DB_HOST'].":".$public_log_config['DB_PORT'],$public_log_config['DB_USER'],$public_log_config['DB_PWD'],$public_log_config['DB_NAME']);


$games_link = array();
if(!empty($games)) {
    $date = date("Y-m-d", time() - 86400);
    foreach ($games as $game) {
        //每日数据 (注册账户和角色)
        $sql = "select * from gm_hour_reg where `date` = '$date' and sid = ".$game['autoid'];
        $data = $db_gm->get_one($sql);
        if(!empty($data)) {
            $account_num = 0;
            $role_num = 0;
            for($i = 0; $i < 24; $i++) {
                $account_num += $data['h'.$i];
                $role_num += $data['role_h'.$i];
            }
            
            $sql = "select * from gm_day_data where `date` = '$date' and sid = ".$game['autoid'];
            $re = $db_gm->get_one($sql);
            if(empty($re)) {
                $sql = "insert into gm_day_data set `date` = '$date', sid = ".$game['autoid'];
                $sql .= sprintf(", accout_num=%d, role_num=%d", $account_num, $role_num);
                $db_gm->query($sql);
            }else {
                $sql = 'update gm_day_data set ';
                $sql .= sprintf(" accout_num=%d, role_num=%d", $account_num, $role_num);
                $sql .= " where `date` = '$date' and sid = ".$game['autoid'];
                $db_gm->query($sql);
            }
        }
        
        //充值
        
        
        
        if(isset($games_link['gm'][$game['autoid']])) {
            $dbgm = $games_link['gm'][$game['autoid']];
        }else{
            $con = get_mysql_config($game['gs_connection']);
            $dbgm = new DB_class($con['DB_HOST'].":".$con['DB_PORT'],$con['DB_USER'],$con['DB_PWD'],$con['DB_NAME']);
            $games_link['gm'][$game['autoid']] = $dbgm;
        }
        
        if(isset($games_link['oa'][$game['autoid']])) {
            $dboa = $games_link['oa'][$game['autoid']];
        }else{
            $con = get_mysql_config($game['oa_connection']);
            $dboa = new DB_class($con['DB_HOST'].":".$con['DB_PORT'],$con['DB_USER'],$con['DB_PWD'],$con['DB_NAME']);
            $games_link['oa'][$game['autoid']] = $dboa;
        }
        
        $start_date = $date;
        $end_date = date('Y-m-d', strtotime($date) + 86400);
        //每日活跃
        $sql = "select count(distinct characterid) as act_num from login where time >= '$start_date' and time < '$end_date'";
        $data = $dboa->get_one($sql);
        $sql = sprintf("update gm_day_data set act_num=%d", $data['act_num']);
        $sql .= " where `date` = '$date' and sid = ".$game['autoid'];
        $db_gm->query($sql);
        
        //充值
        $sql = "select count(distinct characterid) as pay_num, count(autoid) as pay_cishu, sum(rmb) as total_pay from chargeemoney where time >= '$start_date' and time < '$end_date' and serverid = ".$game['id'];
		$data = $db_paylog->get_one($sql);
        $sql = sprintf("update gm_day_data set charge_role_num=%d, charge_total=%d, charge_num=%d" ,$data['pay_num'],$data['total_pay'],$data['pay_cishu']);
        $sql .= " where `date` = '$date' and sid = ".$game['autoid'];
        $db_gm->query($sql);
		
        //留存
        $sql = "select distinct characterid from login where time >= '$start_date' and time < '$end_date'";
        $datas = $dboa->get_all($sql);
        if(!empty($datas)) {
            $characters = '';
            foreach($datas as $re) {
                $characters .= $re['characterid'].',';
            }
            $characters = substr($characters, 0, strlen($characters)-1);
            $sql = "select count(characterid) as num, substr(create_character_time,1,10) create_date from `character` where characterid in ($characters) group by create_date";
            $datas = $dbgm->get_all($sql);
            epr($datas);
            foreach($datas as $data) {
                $daynum = (strtotime($end_date) - strtotime($data['create_date']))/86400;
                if(in_array($daynum,array(1,2,3,4,5,7,14,21,30))){
                    $sql = "select * from gm_keep where `date` = '".$data['create_date']."' and sid = ".$game['autoid'];
                    $re = $db_gm->get_one($sql);
                    if(empty($re)) {
                        $sql = "insert into gm_keep set `date` = '".$data['create_date']."', sid = ".$game['autoid'];
                        $sql .= sprintf(", day%d=%d",$daynum, $data['num']);
                        epr($sql);
                        $db_gm->query($sql);
                    }else {
                        $sql = 'update gm_keep set ';
                        $sql .= sprintf("day%d=%d",$daynum,$data['num']);
                        $sql .= " where `date` = '".$data['create_date']."' and sid = ".$game['autoid'];
                        epr($sql);
                        $db_gm->query($sql);
                    }
                }
            }
        }
    }
}

//mysql://root:iTAhETKMIBk32sn@10.10.52.93:3306/gameserver#utf8
//mysql://root:3595,.@#*238@192.168.68.238:3306/oaserver_1#utf8
function get_mysql_config($str) {
    $config = array();
    $str = substr($str,8);
    $pos = strrpos($str,'@');
    $tmp = array();
    $tmp[0] = substr($str, 0, $pos);
    $tmp[1] = substr($str, $pos+1);
    //$tmp = explode('@', $str);
    $tmpdb = explode(':', $tmp[0]);
    $tmp1 = explode('/', $tmp[1]);
    $tmpip = explode(':', $tmp1[0]);
    $tmpname = explode('#', $tmp1[1]);
    
    $config['DB_USER'] = $tmpdb[0];
    $config['DB_PWD'] = $tmpdb[1];
    $config['DB_HOST'] = $tmpip[0];
    $config['DB_PORT'] = $tmpip[1];
    $config['DB_NAME'] = $tmpname[0];
    return $config;
}



////--------------oa----------------------
////活跃角色
//$sql = "select count(distinct characterid) as act_num from login where time between '2014-12-05' and '2014-12-06'";
//
////活跃账户
//$sql = "select count(distinct account) as act_num from login where time between '2014-12-05' and '2014-12-06'";
//
////每小时在线
//$sql = "select count(distinct characterid) as online_num from loginout where left(time,13) <= '2014-12-05 21' or (left(from_unixtime(UNIX_TIMESTAMP(time) + onlinetime),13) >= '2014-12-05 20' and left(from_unixtime(UNIX_TIMESTAMP(time) + onlinetime),13) < '2014-12-05 21')"

//留存
?>
