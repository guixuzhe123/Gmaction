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
#$sql = "select * from gm_serverinfo";
#$games = $db_paylog->get_all($sql);

$games_link = array();
if(!empty($games)) {
    $start_time = date('Y-m-d H', time() - 3600 * 12);
    $end_time = date('Y-m-d H');
    
    $start_hour  = date('Y-m-d H', time() - 3600 * 3);
    $end_hour  = date('Y-m-d H', time() - 3600 * 2);
    $savehour = date('H', time() - 3600 * 2);
    foreach ($games as $game) {
        
        if(!empty($game['gs_connection'])) {
            if(isset($games_link['gm'][$game['autoid']])) {
                $db = $games_link['gm'][$game['autoid']];
            }else{
                $con = get_mysql_config($game['gs_connection']);
                epr($con);
                $db = new DB_class($con['DB_HOST'].":".$con['DB_PORT'],$con['DB_USER'],$con['DB_PWD'],$con['DB_NAME']);
                $games_link['gm'][$game['autoid']] = $db;
            }
            
            //每小时注册
            $sql = "select count(account) as hour_num, substr(create_account_time,1,13) as hour from account where create_account_time between '$start_time' and '$end_time' group by hour";
            $datas = $db->get_all($sql);
            if(!empty($datas)) {
                foreach($datas as $data) {
                    $tmp = explode(' ', $data['hour']);
                    $sql = "select * from gm_hour_reg where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                    $re = $db_gm->get_one($sql);
                    if(empty($re)) {
                        $sql = "insert into gm_hour_reg set `date` = '$tmp[0]', sid = ".$game['autoid'];
                        $sql .= sprintf(", h%d=%d",$tmp[1],$data['hour_num']);
                        $db_gm->query($sql);
                    }else {
                        $sql = 'update gm_hour_reg set ';
                        $sql .= sprintf(" h%d=%d",$tmp[1],$data['hour_num']);
                        $sql .= " where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                        $db_gm->query($sql);
                    }
                }
            }
    
            //每小时注册角色
            $sql = "select count(characterid) as hour_num, substr(create_character_time,1,13) as hour from `character` where create_character_time between'$start_time' and '$end_time' group by hour";
            $datas = $db->get_all($sql);
            if(!empty($datas)) {
                foreach($datas as $data) {
                    $tmp = explode(' ', $data['hour']);
                    $sql = "select * from gm_hour_reg where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                    $re = $db_gm->get_one($sql);
                    if(empty($re)) {
                        $sql = "insert into gm_hour_reg set `date` = '$tmp[0]', sid = ".$game['autoid'];
                        $sql .= sprintf(", role_h%d=%d",$tmp[1],$data['hour_num']);
                        $db_gm->query($sql);
                    }else {
                        $sql = 'update gm_hour_reg set ';
                        $sql .= sprintf(" role_h%d=%d",$tmp[1],$data['hour_num']);
                        $sql .= " where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                        $db_gm->query($sql);
                    }
                }
            }
        }
        if(!empty($game['oa_connection'])) {
            if(isset($games_link['oa'][$game['autoid']])) {
                $dboa = $games_link['oa'][$game['autoid']];
            }else{
                $con = get_mysql_config($game['oa_connection']);
                $dboa = new DB_class($con['DB_HOST'].":".$con['DB_PORT'],$con['DB_USER'],$con['DB_PWD'],$con['DB_NAME']);
                $games_link['oa'][$game['autoid']] = $dboa;
            }
            for($i = 0; $i < 5; $i++){
                $start_hour  = date('Y-m-d H', time() - 7200 - $i * 3600);
                $end_hour  = date('Y-m-d H', time() - 3600 - $i * 3600);
                $savehour = date('H', time() - 3600 - $i * 3600);

                //每小时在线 查询最大的
                
				$sql = "select max(onlinenum) as online_num from statistics_status where time >= '$start_hour' and time < '$end_hour'";
                $data = $dboa->get_one($sql);
                $tmp = explode(' ', $end_hour);
                $sql = "select * from gm_online where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                $re = $db_gm->get_one($sql);
                if(empty($re)) {
                    $sql = "insert into gm_online set `date` = '$tmp[0]', sid = ".$game['autoid'];
                    $sql .= sprintf(", h%d=%d",$savehour,$data['online_num']);
                    $db_gm->query($sql);
                }else {
                    $sql = 'update gm_online set ';
                    $sql .= sprintf("h%d=%d",$savehour,$data['online_num']);
                    $sql .= " where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                    $db_gm->query($sql);
                }
            }
            
            //每小时充值
            $start_hour  = date('Y-m-d H', time() - 7200);
            $end_hour  = date('Y-m-d H', time() - 3600);
            $savehour = date('H', time() - 3600);

            //每小时充值
            $sql = "select sum(rmb) as total_num, substr(time,1,13) as hour from `chargeemoney` where time between '$start_hour' and '$end_hour' and serverid = ".$game['id'];
            $data = $db_paylog->get_one($sql);
            if(!empty($data['total_num'])) {
                $tmp = explode(' ', $end_hour);
                $sql = "select * from gm_hour_pay where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                $re = $db_gm->get_one($sql);
                if(empty($re)) {
                    $sql = "insert into gm_hour_pay set `date` = '$tmp[0]', sid = ".$game['autoid'];
                    $sql .= sprintf(", h%d=%d",$savehour,$data['total_num']);
                    $db_gm->query($sql);
                }else {
                    $sql = 'update gm_hour_pay set ';
                    $sql .= sprintf("h%d=%d",$savehour,$data['total_num']);
                    $sql .= " where `date` = '$tmp[0]' and sid = ".$game['autoid'];
                    $db_gm->query($sql);
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