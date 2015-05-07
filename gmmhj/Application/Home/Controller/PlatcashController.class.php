<?php
namespace Home\Controller;

use Think\Controller;

//平台充值接口
class PlatcashController extends BaseController{

	public function index(){
		/*$data['CharacterID'] = 28;
		$data['m_chargetime'] = time();
		$data['m_emoney'] = 10000;
		$data['m_account'] = '1283293845@qq.com';
		$data['m_billno'] = time();
		$ret = $this->send_msg('PlatCash',$data,1);*/
		$input = I('post.');
		$serverinfo = D('Serverinfo');
		$server = $serverinfo->where(array('platcode' => $input['platcode']))->find();
		if(!$server){
			echo 10;exit;//找不到服务器
		}
		//var_dump($server);
		$gscharacter = new \Home\Model\GSCharacterModel($server['autoid']);
		if(!$gscharacter){
			echo 20;exit;//连接不到角色库
		}
		$info = $gscharacter->where(array('account' => $input['m_account']))->find();
		if(!$info){
			echo 30;exit;//找不到角色
		}
		$data['serverid'] = $server['id'];
		$data['CharacterID'] = $info['characterid'];
		$data['m_chargetime'] = time();
		$data['m_emoney'] = $input['m_emoney'];
		$data['m_account'] = $input['m_account'];
		$data['m_billno'] = $input['m_billno'];
		$data['ip'] = $input['ip'];
		$data['source'] = $input['source'];
		$data['extra_money'] = $input['extra_money'];
		//$data['id'] = 2;
		//$data['characterid'] = $data['CharacterID'];
		$paylog = M("Paylog");
		//echo "888";
		$paydata = array(
			'autoid'		=>	$server['autoid'],
			'characterid'	=>	$info['characterid'],
			'm_chargetime'	=>	time(),
			'm_emoney'		=>	$input['m_emoney'],
			'm_billno'		=>	$input['m_billno'],
			'm_account'		=>	$input['m_account'],
			'ip'			=>	$input['ip'],
			'source'		=>	$input['source'],
			'extra_money'	=>	$input['extra_money'],
			'status'		=>	0
		);
		//print_r($paydata);exit;
		if($paylog->add($paydata)){

			//echo '111';exit;
		}else{
			echo '40';exit;//无法写充值日志
		}
		//echo "999";exit;
		$ret = $this->send_msg('PlatCash',$data,$server['autoid']);
		if($ret['code'] == 0){
			$savedata['status'] = 1;
			$paylog->where(array('m_billno' => $data['m_billno']))->save($savedata);
			echo $ret['code'];
		}else{
			echo '50';exit;
		}
		//print_r($data);
		//print_r($input);
	}
	public function test2(){
		echo 10;
		exit;
		return 20;
	}

	//自动补单操作
	public function payadd(){
		$paylog = D("Paylog");
		$lostpay = $paylog->where(array('status' => 0))->select();
		$logurl = "/home/www/php/background/gmmhj/crontab/log/" . date('Y-m-d',time()) . "payadd.log";
		$fp = fopen($logurl,'a');
		if(!$lostpay){
			fwrite($fp,date('Y-m-d H:i:s',time()) . " no payadd\r\n");
		}else{
			foreach($lostpay as $perpay){
				$data['serverid'] = $this->getsid($perpay['autoid']);
				$data['CharacterID'] = $perpay['characterid'];
				$data['m_chargetime'] = $perpay['m_chargetime'];
				$data['m_emoney'] = $perpay['m_emoney'];
				$data['m_account'] = $perpay['m_account'];
				$data['m_billno'] = $perpay['m_billno'];
				$data['ip'] = $perpay['ip'];
				$data['source'] = $perpay['source'];
				$data['extra_money'] = $perpay['extra_money'];
				$ret = $this->send_msg('PlatCash',$data,$perpay);
				if($ret['code'] == 0){
					$savedata['status'] = 1;
					$paylog->where(array('id' => $perpay['id']))->save($savedata);
					fwrite($fp,date('Y-m-d H:i:s',time()) . ' succss' . $paylog->getLastSql() . "\r\n");
				}else{
					fwrite($fp,date('Y-m-d H:i:s',time()) . ' failed' . var_dump($ret) . "\r\n");
				}
			}
		}
		
		fclose($fp);
	}
	public function test1(){
		$paylog = D('Paylog');
		$date = I('post.dateinput2222');
		$autoid = I('post.autoid');
		if($date != 0){
			$starttime = $date;
			$endtime = $date + 86400 - 1;
			$where['m_chargetime'] = array('between',array($starttime,$endtime));
			$this->assign('datetime',date('Y-m-d',$date));
		}
		if($autoid != 0){
			$where['autoid'] = $autoid;
			$this->assign('selectautoid',$autoid);
        }
        if($date == "" && $autoid == ""){}else{
            $summoney = $paylog->where($where)->sum('m_emoney');
		    $pay = $paylog->where($where)->order('id desc')->select();
		    $count = $paylog->where($where)->count();
        }
		foreach($pay as &$arr){
			$info = $this->getuser($arr['characterid'],$arr['autoid']);
			$arr['name'] = $info['name'];
			$arr['account'] = $info['account'];
		}
        //print_r($pay);exit;
		$this->assign('pay',$pay);
		$this->assign('summoney',$summoney);
		$this->assign('count',$count);
		vendor('Pager.Pager');
		$this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
		$this->display();
	}
	public function index1(){
		$data['serverid'] = 1;
		$data['CharacterID'] = 728;
		$data['m_chargetime'] = time();
		$data['m_emoney'] = 100;
		$data['m_account'] = 'hai1222';
		$data['m_billno'] = time();
		$data['ip'] = '192.168.1.139';
		$data['source'] = 1;
		$data['extra_money'] = 0;
		$ret = $this->send_msg('PlatCash',$data,25);
		echo $ret['code'];
		//print_r($data);
		//print_r($input);
	}


	//查询是否创角
	public function checkuser(){
		$input = I('post.');
		$serverinfo = D('Serverinfo');
		$server = $serverinfo->where(array('platcode' => $input['platcode']))->find();
		if(!$server){
			echo 10;exit;//找不到服务器
		}
		//var_dump($server);
		$gscharacter = new \Home\Model\GSCharacterModel($server['autoid']);
		if(!$gscharacter){
			echo 20;exit;//连接不到角色库
		}
		$info = $gscharacter->where(array('account' => $input['m_account']))->find();
		if(!$info){
			echo 30;exit;//找不到角色
		}else{
			echo 1;exit;
		}
	}

	//根据id查询用户信息
	public function getuser($characterid,$autoid = 25){
		$gscharacter = new \Home\Model\GSCharacterModel($autoid);
		$info = $gscharacter->where(array('characterid' => $characterid))->find();
		return $info;
	}

	public function test(){
		echo "222";
	}
}
