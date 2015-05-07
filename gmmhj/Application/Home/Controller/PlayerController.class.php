<?php

namespace Home\Controller;

use Think\Controller;

class PlayerController extends BaseController {

    /**
     *  玩家信息查询 
     */
    public function info() {
        $input = I('post.');
        if (!empty($input)) {
            //print_r($input);exit;
            $autoid = I('post.autoid');
            $characterid = I('post.characterid');
            $name = I('post.charactername');
            $account = I('post.account');
            $resourceid = I('post.resourceid');

            if($resourceid != 0){
                $this->assign('resourceid',$resourceid);
            }
            if (!empty($characterid)) {
                $where['characterid'] = $characterid;
            }
            if (!empty($name)) {
                $where['name'] = $name;
            }
            if (!empty($account)) {
                switch($resourceid){
                    case 1:
                        $where['account'] = "3595mhj_" . $account;
                        $this->assign('account',$account);
                        break;
                    case 2:
                        $where['account'] = "youzhai_" . $account;
                        $this->assign('account',$account);
                        break;
                    default:
                        break;
                }
            }
            $day_data =  new \Home\Model\GSCharacterModel($autoid);
            $info = $day_data->where($where)->find();
            $currency = $day_data->query("select * from `currency` where characterid=" . $info['characterid']);
            $info = array_merge($info,$currency[0]);
            //print_r($currency);exit;
            //print_r($info);exit;
            $bag = $day_data->query("select * from `containers` where type=1 and characterid=" . $info['characterid']);
            $bagthing = $this->getthings($bag[0]['thing'],$autoid);
            $storehouse = $day_data->query("select * from `containers` where type=2 and characterid=" . $info['characterid']);
            $storehousething = $this->getthings($storehouse[0]['thing'],$autoid);
			if($info){
				$characterid = $info['characterid'];
			}else{
				$this->error('找不到该用户，请重新输入！');
			}
			$vipdata = new \Home\Model\GSVipModel($autoid);
			$vip = $vipdata->where(array('characterid' => $characterid))->find();
			$paywhere = array(
				'characterid'	=>	$characterid,
				'type'			=>	0
			);
			$paydata = new \Home\Model\OAPayModel($autoid);
			$summoney = $paydata->where($paywhere)->sum('num');
            if(in_array($info['name'],$this->GetSilenceList($autoid))){
                $isSilence = 1;
            }else{
                $isSilence = 0;
            }
            if(in_array($info['account'],$this->GetLockList($autoid))){
                $isLock = 1;
            }else{
                $isLock = 0;
            }
			$this->assign('info', $info);
			$this->assign('bagthing',$bagthing);
			$this->assign('storehousething',$storehousething);
            $this->assign('showbody', 1);
            $this->assign('isSilence',$isSilence);
            $this->assign('isLock',$isLock);
			$this->assign('vip',$vip);
			$this->assign('summoney',$summoney);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
        vendor('Pager.Pager');
        $this->assign('scenename',\Pager::getScene($info['sceneid']));
        $this->assign('plats',$this->plats);
        $this->display();
    }
    
    /*
     * 踢下线
     */
    public function KillUser() {
        $input = I('post.');
        if (!empty($input)) {
            $sid = $this->getsid($input['autoid']);
            $characterid = I('post.characterid');
            $data = array(
                'sid' => $sid,
                'characterid' => $characterid,
            );
            $ret = $this->send_msg('KillUser', $data,$input['autoid']);
            $this->log('踢id为' . $characterid . '的玩家下线',cookie('gmuser'));
            echo $ret['ret'];
        }
    }
    
    /**
     * 禁言
     */
    public function SilenceUser() {
        $input = I('post.');
        if (!empty($input)) {
            $sid = $this->getsid($input['autoid']);
            $name = I('post.name');
            $data = array(
                'sid' => $sid,
                'name' => $name,
                'silence' => true
            );
            $ret = $this->send_msg('SilenceUser', $data,$input['autoid']);
            $this->log('对用户名为' . $name . '的玩家禁言',cookie('gmuser'));
            echo $ret['ret'];
        }
    }

    /**
     * 解除禁言
     */
    public function UnsetSilenceUser() {
        $input = I('post.');
        if (!empty($input)) {
            $sid = $this->getsid($input['autoid']);
            $name = I('post.name');
            $data = array(
                'sid' => $sid,
                'name' => $name,
                'silence' => false
            );
            $ret = $this->send_msg('SilenceUser', $data,$input['autoid']);
            $this->log('对用户名为' . $name . '的玩家解禁',cookie('gmuser'));
            echo $ret['ret'];
        }
    }

    /**
     * 获取禁言列表
     */
    public function GetSilenceList($autoid){
        $forbidtalk = new \Home\Model\GSForbidtalkModel($autoid);
        $r = $forbidtalk->select();
        foreach($r as $arr){
            $ret[] = $arr['charactername'];
        }
        return $ret;
    }
    /**
     * 锁定账号
     */
    public function Lock(){
        $input = I('post.');
        if (!empty($input)) {
            $sid = $this->getsid($input['autoid']);
            $account = I('post.account');
            $data = array(
                'sid' => $sid,
                'account' => $account
            );
            $ret = $this->send_msg('LockAccount', $data,$input['autoid']);
            $this->log('对账号为' . $account . '的玩家封号',cookie('gmuser'));
            echo $ret['ret'];
        } 
    }
    /**
     * 解锁账号
     */
    public function Unlock(){
        $input = I('post.');
        if (!empty($input)) {
            $sid = $this->getsid($input['autoid']);
            $account = I('post.account');
            $data = array(
                'sid' => $sid,
                'account' => $account
            );
            $ret = $this->send_msg('UnlockAccount', $data,$input['autoid']);
            $this->log('对账号为' . $account . '的玩家解封',cookie('gmuser'));
            echo $ret['ret'];
        } 
    }
    /**
     * 强制回城
     */
    public function ReturnCity(){
        $input = I('post.');
        if (!empty($input)) {
            $sid = $this->getsid($input['autoid']);
            $characterid = I('post.characterid');
            $data = array(
                'sid' => $sid,
                'characterid' => $characterid
            );
            $ret = $this->send_msg('ReturnCity', $data,$input['autoid']);
            $this->log('对角色id为' . $characterid . '的玩家强制回城',cookie('gmuser'));
            echo $ret['ret'];
        } 
    }
    /**
     * 获取锁定列表
     */
    public function GetLockList($sid){
        $lockaccount = new \Home\Model\GSLockaccountModel($sid);
        $r = $lockaccount->select();
        foreach($r as $arr){
            $ret[] = $arr['account'];
        }
        return $ret;
    }
	
	/**
     * 封IP相关操作
     */
	 public function ipoperation(){
		vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
		$this->display();
	 }
	 
	 /**
     * 封IP
     */
	 public function iplock(){
		$input = I('post.');
		$data['sid'] = $this->getsid($input['autoid']);
        $ips = $input['ip'];
        $iparr = explode(",",$ips);
        $character = new \Home\Model\GSCharacterModel($input['autoid']);
        $characters = $character->where(array('loginIP' => $data['ip']))->select();
        if(count($iparr) >= 1){
            foreach($iparr as $ip){
                $data['ip'] = $ip;
                foreach ($characters as $single) {
                    $datakick['sid'] = $data['sid'];
                    $datakick['characterid'] = $single['characterid'];
                    $this->send_msg('KillUser', $datakick,$input['autoid']);
                }
                //print_r($data);exit;
                $ret = $this->send_msg('LockIP',$data,$input['autoid']);
            }
        }
		echo $ret['ret'];
	 }
	 
	 /**
     * IP封禁列表查询
     */
	 public function iplocklist(){
		vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
		$this->display();
	 }
	 
	 /**
     * 获取IP封禁列表
     */
	 public function loadiplocklist(){
		$input = I('post.');
		$data['sid'] = $this->getsid($input['autoid']);
		$ret = $this->send_msg('LockIPList',$data,$input['autoid']);
		//print_r($ret);exit;
        $ipnum = count($ret['ips']);
        for($i = 0;$i < $ipnum;$i++){
            $tmp[]['ip'] = $ret['ips'][$i]['szLockIP'];
        }
        echo json_encode($tmp);
	 }

     /**
     * 解封IP
     */
     public function unlockip(){
        $input = I('post.');
        if(!empty($input)){
            $autoid = $input['autoid'];
            $data['sid'] = $this->getsid($autoid);
            $data['ip'] = $input['ip'];
            $ret = $this->send_msg('UnLockIP',$data,$input['autoid']);
            echo $ret['ret'];
        }else{
            $this->error('参数有误！');
        }
     }
	 
	  /**
     * 批量封号
     */
	 public function lockusers(){
		$input = I('post.');
		$serverinfo = D('Serverinfo');
		if(!empty($input)){
			$names = $input['names'];
			$namearr = explode(',',$names);
			foreach($namearr as $name){
				preg_match('/^s(.*)\./',$name,$matches);
				$data['sid'] = $matches[1];
				$server = $serverinfo->where(array('id' => $data['sid']))->find();
				$character = new \Home\Model\GSCharacterModel($server['autoid']);
				$gameuser = $character->where(array('name' => $name))->find();
				$data['account'] = $gameuser['account'];
				$ret = $this->send_msg('LockAccount', $data,$server['autoid']);
				echo $ret['ret'];
			}
			exit;
		}
		$this->display();
	 }
	
    public function test() {
        $forbidtalk = new \Home\Model\GSLockaccountModel(1);
        $r = $forbidtalk->select();
        foreach($r as $arr){
            preg_match('/s(*).(*)/',$arr,$matches);
			print_r($matches);
        }
		
        print_r($r);
    }

     public function getthings($thing,$autoid){
         //获取背包和仓库里的物品信息
         preg_match_all("/\[(\d+)\]/",$thing,$ret);
         $things = $ret[1];
         $m =  new \Home\Model\GSCharacterModel($autoid);
		 $ret = array();
		 $quip = $this->getequip();
		 foreach($things as $thing){
		 	$rs = $m->query("select * from `item` where id={$thing}");
			if($rs){
				$ret['item'][] = array('itemname' => $this->getitemname($rs[0]['thingcfgid']),'overlap' => $rs[0]['overlap']);
			}else{
				$rs = $m->query("select * from `equipment` where id={$thing}");
				if($rs){
					$ret['equipment'][] = $quip[$rs[0]['thingcfgid']];
				}
			}
		 }
         //print_r($ret);exit;
         return $ret;
     }
	 //根据道具id获得道具名称
	 public function getitemname($id){
	 	$props = $this->getprop();
	 	$len = count($props);
		for($i = 0;$i < $len;$i++){
			if($props[$i]['propid'] == $id){
				return $props[$i]['propname'];
			}
		}
	 } 
}
