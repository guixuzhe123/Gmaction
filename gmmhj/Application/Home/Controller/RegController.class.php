<?php

namespace Home\Controller;

use Think\Controller;

/**
 * 账户，角色相关 
 */
class RegController extends BaseController {

    /**
     * 留存
     */
    public function data_keep() {
        $input = I('post.');
        if(1){
            if(empty($input)){
                $start_date = date('Y-m-d',strtotime('-1 day'));
                $end_date = date('Y-m-d');
            }else{
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
                $autoid = I('post.autoid');
            }

            //---where
            $where = array();
            if (!empty($autoid)) {
                $where['sid'] = $autoid;
            }
            if(!empty($start_date) && !empty($end_date)){
                $where['date'] = array('between',array($start_date,$end_date." 23:59:59"));
            }
                        
            //--query
            $day_data = D('Keep');
            $rs = $day_data->where($where)->order('sid,date desc')->select();
            foreach($rs as &$r) {
                $r['sid'] = $this->getsid($r['sid']) . '服';
                $r['day2'] = sprintf("%.2f",$r['day2']/$r['day1'] * 100)."%";
                $r['day3'] = sprintf("%.2f",$r['day3']/$r['day1'] * 100)."%";
                $r['day4'] = sprintf("%.2f",$r['day4']/$r['day1'] * 100)."%";
                $r['day5'] = sprintf("%.2f",$r['day5']/$r['day1'] * 100)."%";
                $r['day7'] = sprintf("%.2f",$r['day7']/$r['day1'] * 100)."%";
                $r['day14'] = sprintf("%.2f",$r['day14']/$r['day1'] * 100)."%";
                $r['day21'] = sprintf("%.2f",$r['day21']/$r['day1'] * 100)."%";
                $r['day30'] = sprintf("%.2f",$r['day30']/$r['day1'] * 100)."%";
            }
            
            //assign
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
            $this->assign('rs', $rs);
        }

        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }
    
    /**
     * 日期账户：对勾选服务器的注册人数进行统计，需要起始时间控件（精确到日），查询所选时间段内的注册人数。
     */
    public function day_data() {
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $start_date = date('Y-m-d',strtotime('-1 day'));
                $end_date = date('Y-m-d');
            }else{
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
                $autoid = I('post.autoid');
            }

            //---where
            $where = array();
            if (!empty($autoid)) {
                $where['sid'] = $autoid;
            }
            if(!empty($start_date) && !empty($end_date)){
                $where['date'] = array('between',array($start_date,$end_date." 23:59:59"));
            }
                        
            //--query
            $day_data = D('Day_data');
            $rs = $day_data->where($where)->order('sid')->select();
            $total_accout_num = 0;
			$total_role_num = 0;
			$total_charge_total = 0;
			$total_charge_num = 0;
			foreach ($rs as &$r) {
                //转化率
                $r['charge_total'] = $r['charge_total'];
                $r['charge_rate'] = sprintf("%0.2f%%", $r['charge_role_num'] / $r['act_num'] * 100);
                $r['arpu'] = sprintf("%0.2f", $r['charge_total'] / $r['charge_role_num']);
				$r['sid'] = $this->getsid($r['sid']);
				
				$total_accout_num += $r['accout_num'];
				$total_role_num += $r['role_num'];
				$total_charge_total += $r['charge_total'];
				$total_charge_num += $r['charge_num'];	
            }
			
			//总情况
			//充值角色
			$serverid = $this->getsid($autoid);
			$where = array('serverid'=>$serverid);
			if(!empty($start_date) && !empty($end_date)){
                $where['time'] = array('between',array($start_date,$end_date." 23:59:59"));
            }
			$day_data = new \Home\Model\PublicchargeModel();
			$charge_data = $day_data->field("count(distinct characterid) as total_charge_role_num")->where($where)->find();
			//活跃角色
            $login_model =  new \Home\Model\OALoginModel($autoid);
			$where = array();
			if(!empty($start_date) && !empty($end_date)){
                $where['time'] = array('between',array($start_date,$end_date." 23:59:59"));
            }
            $login_data = $login_model->field("count(distinct characterid) as act_num")->where($where)->find();
			
			$rs[] = array(
				'date' => '',
				'accout_num' => $total_accout_num,
				'role_num' => $total_role_num,
				'charge_total' => $total_charge_total,
				'charge_num' => $total_charge_num,
				'act_num' => $login_data['act_num'],
				'charge_role_num' => $charge_data['total_charge_role_num'],
				'charge_rate' => sprintf("%0.2f%%", $charge_data['total_charge_role_num'] / $login_data['act_num'] * 100),
                'arpu' => sprintf("%0.2f", $total_charge_total / $charge_data['total_charge_role_num']),
				'sid' => $serverid,
			);
            
            //assign
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
            $this->assign('rs', $rs);
        }

        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }

    /**
     * 每小时注册人数
     */
    public function hour_data() {
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $date = date('Y-m-d');
            }else{
                $date = I('post.date');
            }
            $sid = $input['autoid'];

            $where = array();
            if (!empty($sid)) {
                $where['sid'] = $sid;
            }
            if (!empty($date)) {
                $where['date'] = $date;
            }
            
            $hour_data = D('Hour_reg');
            $rs = $hour_data->where($where)->order('sid,date desc')->select();
            foreach ($rs as &$r) {
                $r['sid'] = $this->getsid($r['sid']) . '服';
            }
            $this->assign('date', $date);
            $this->assign('rs', $rs);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $input['autoid']));
        $this->display();
    }
    
    /**
     * 每小时注册人数
     */
    public function hour_pay() {
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $date = date('Y-m-d');
            }else{
                $date = I('post.date');
            }
            $sid = $input['autoid'];

            $where = array();
            if (!empty($sid)) {
                $where['sid'] = $sid;
            }
            if (!empty($date)) {
                $where['date'] = $date;
            }
            
            $hour_data = D('Hour_pay');
            $rs = $hour_data->where($where)->order('sid,date desc')->select();
            foreach($rs as &$arr){
                $arr['sum'] = $arr['h0'] + $arr['h1'] + $arr['h2'] + $arr['h3'] + $arr['h4'] + $arr['h5'] + $arr['h6'] + $arr['h7'] + $arr['h8'] + $arr['h9'] + $arr['h10'] + $arr['h11'] + $arr['h12'] + $arr['h13'] + $arr['h14'] + $arr['h15'] + $arr['h16'] + $arr['h17'] + $arr['h18'] + $arr['h19'] + $arr['h20'] + $arr['h21'] + $arr['h22'] + $arr['h23'];
                $arr['sid'] = $this->getsid($arr['sid']) . '服';
            }

            $this->assign('date', $date);
            $this->assign('rs', $rs);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $input['autoid']));
        $this->display();
    }

    /**
     * ip查询
     * 对勾选服务器的固定IP的登录情况进行查询。需要显示所选日期该IP下登录的 账号，角色名，区服，时间（每次登录单独统计）                                            
     */
    public function ip_query() {
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
                $autoid = 25;
            }else{
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
                $autoid = I('post.autoid');
            }
            $ip = I('post.ip');
            $account = I('post.account');

            //---where
            if(empty($autoid)){
                $this->error('请选择区服');
            }
            $where = array();
            if(!empty($start_date) && !empty($end_date)){
                $where['time'] = array('between',array($start_date,$end_date." 23:59:59"));
            }

            if(!empty($ip)){
                $where['ip'] = $ip;   
                $this->assign('ip',$ip);
            }
            if(!empty($account)){
                $where['account'] = $account;
                $this->assign('account',$account);
            }
            
            //--query
            $day_data =  new \Home\Model\OALoginModel($autoid);
            $rs = $day_data->where($where)->order('characterid asc')->select();
            
            //assign
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
            $this->assign('ip', $ip);
            $this->assign('rs', $rs);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }
	
	/**
     * 全服注册创角查询
     */
	 public function allserver(){
		$input = I('post.');
		$serverinfo = D('Serverinfo');
		if(!empty($input)){
			$autoid = $input['autoid'];
			$start_date = I('post.start_date');
			$end_date = I('post.end_date');
			if($autoid == 0){
				if(!empty($start_date) && !empty($end_date)){
					$servers = $serverinfo->select();
					foreach($servers as $i => $server){
						$rs[$i]['server'] = $server['id'] . '服';
						$account = new \Home\Model\GSAccountModel($server['autoid']);
						$character = new \Home\Model\GSCharacterModel($server['autoid']);
						$today = strtotime("today");
						$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE create_account_time>='$start_date' AND create_account_time<'" . $end_date . " 23:59:59'");
						$rs[$i]['allaccount'] = $temp[0]['tempa'];
						$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE create_character_time>='$start_date' AND create_character_time<'" . $end_date . " 23:59:59'");
						$rs[$i]['allcharacter'] = $temp[0]['tempa'];
						$rs[$i]['alllost'] = floor((($rs[$i]['allaccount'] - $rs[$i]['allcharacter']) / $rs[$i]['allaccount']) * 10000) / 100 . "%";
						$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE UNIX_TIMESTAMP(create_account_time)>=$today");
						$rs[$i]['nowaccount'] = $temp[0]['tempa'];
						$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE UNIX_TIMESTAMP(create_character_time)>=$today");
						$rs[$i]['nowcharacter'] = $temp[0]['tempa'];
						$rs[$i]['nowlost'] = floor((($rs[$i]['nowaccount'] - $rs[$i]['nowcharacter']) / $rs[$i]['nowaccount']) * 10000) / 100 . "%";
					}
					$this->assign('start_date',$start_date);
					$this->assign('end_date',$end_date);
				}else{
					$this->error('请输入正确的查询条件!');
				}
			}else{
				if(!empty($start_date) && !empty($end_date)){
					$server = $serverinfo->where(array('autoid' => $autoid))->find();
					$rs[0]['server'] = $server['id'] . '服';
					$account = new \Home\Model\GSAccountModel($server['autoid']);
					$character = new \Home\Model\GSCharacterModel($server['autoid']);
					$today = strtotime("today");
					$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE create_account_time>=$start_date AND create_account_time<'" . $end_date . " 23:59:59'");
					$rs[0]['allaccount'] = $temp[0]['tempa'];
					$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE create_character_time>=$start_date AND create_character_time<'" . $end_date . " 23:59:59'");
					//echo $account->getLastSql();exit;
					$rs[0]['allcharacter'] = $temp[0]['tempa'];
					$rs[0]['alllost'] = floor((($rs[0]['allaccount'] - $rs[0]['allcharacter']) / $rs[0]['allaccount']) * 10000) / 100 . "%";
					$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE UNIX_TIMESTAMP(create_account_time)>=$today");
					$rs[0]['nowaccount'] = $temp[0]['tempa'];
					$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE UNIX_TIMESTAMP(create_character_time)>=$today");
					$rs[0]['nowcharacter'] = $temp[0]['tempa'];
					$rs[0]['nowlost'] = floor((($rs[0]['nowaccount'] - $rs[0]['nowcharacter']) / $rs[0]['nowaccount']) * 10000) / 100 . "%";
					$this->assign('start_date',$start_date);
					$this->assign('end_date',$end_date);
				}else{
					$server = $serverinfo->where(array('autoid' => $autoid))->find();
					$rs[0]['server'] = $server['id'] . '服';
					$account = new \Home\Model\GSAccountModel($server['autoid']);
					$character = new \Home\Model\GSCharacterModel($server['autoid']);
					$today = strtotime("today");
					$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE UNIX_TIMESTAMP(create_account_time)<$today");
					$rs[0]['allaccount'] = $temp[0]['tempa'];
					$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE UNIX_TIMESTAMP(create_character_time)<$today");
					$rs[0]['allcharacter'] = $temp[0]['tempa'];
					$rs[0]['alllost'] = floor((($rs[0]['allaccount'] - $rs[0]['allcharacter']) / $rs[0]['allaccount']) * 10000) / 100 . "%";
					$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE UNIX_TIMESTAMP(create_account_time)>=$today");
					$rs[0]['nowaccount'] = $temp[0]['tempa'];
					$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE UNIX_TIMESTAMP(create_character_time)>=$today");
					$rs[0]['nowcharacter'] = $temp[0]['tempa'];
					$rs[0]['nowlost'] = floor((($rs[0]['nowaccount'] - $rs[0]['nowcharacter']) / $rs[0]['nowaccount']) * 10000) / 100 . "%";
				}
			}
		}else{
			$servers = $serverinfo->where('id < 41')->select();
            //print_r($servers);exit;
			foreach($servers as $i => $server){
				$rs[$i]['server'] = $server['id'] . '服';
				$account = new \Home\Model\GSAccountModel($server['autoid']);
				$character = new \Home\Model\GSCharacterModel($server['autoid']);
				$today = strtotime("today");
				$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE UNIX_TIMESTAMP(create_account_time)<$today");
				$rs[$i]['allaccount'] = $temp[0]['tempa'];
				$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE UNIX_TIMESTAMP(create_character_time)<$today");
				$rs[$i]['allcharacter'] = $temp[0]['tempa'];
				$rs[$i]['alllost'] = floor((($rs[$i]['allaccount'] - $rs[$i]['allcharacter']) / $rs[$i]['allaccount']) * 10000) / 100 . "%";
				$temp = $account->query("SELECT COUNT(account) AS tempa FROM `account` WHERE UNIX_TIMESTAMP(create_account_time)>=$today");
				$rs[$i]['nowaccount'] = $temp[0]['tempa'];
				$temp = $character->query("SELECT COUNT(characterid) AS tempa FROM `character` WHERE UNIX_TIMESTAMP(create_character_time)>=$today");
				$rs[$i]['nowcharacter'] = $temp[0]['tempa'];
				$rs[$i]['nowlost'] = floor((($rs[$i]['nowaccount'] - $rs[$i]['nowcharacter']) / $rs[$i]['nowaccount']) * 10000) / 100 . "%";
			}
		}
		//var_dump($rs);exit;
		$this->assign('rs',$rs);
		vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
		$this->display();
	 }

}
