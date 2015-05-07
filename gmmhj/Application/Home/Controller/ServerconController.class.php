<?php
namespace Home\Controller;
use Think\Controller;
class ServerconController extends BaseController{



	public function index($selectid = 0){

		$plat = D('Plat');
		$serverinfo = D('Serverinfo');
		if($selectid == 0){
			$r0 = $serverinfo->select();
			$count = $serverinfo->count();
		}else{
			$r0 = $serverinfo->where(array('platid' => $selectid))->select();
			$count = $serverinfo->where(array('platid' => $selectid))->count();
		}
		$Page = new \Think\Page($count,10);
		$show = $Page->show();
		if($selectid == 0){
			$r0 = $serverinfo->limit($Page->firstRow . ',' . $Page->listRows)->select();
		}else{
			$r0 = $serverinfo->where(array('platid' => $selectid))->limit($Page->firstRow . ',' . $Page->listRows)->select();
		}
		$r = $plat->select();
		foreach ($r as &$arr) {
			$arr['href'] = U('Servercon/index',array('selectid' => $arr['platid']));
		}
		$this->assign('plat',$r);
		$this->assign('serverinfo',$r0);
		$this->assign('page',$show);
		$this->assign('selectid',$selectid);//运营平台选择，默认为0，即所有平台
		$this->display();
	}

	public function ajaxadd(){
		$data = I('post.');
		$serverinfo = D('Serverinfo');
		$data['autoid'] = null;
		$data['create_time'] = time();
		$data['platcode'] = md5(time());
		$r = $serverinfo->data($data)->add();
		if($r){
			$res = $this->log('添加服务器' . $data['name'],cookie('gmuser'));
			echo 1;
		}else{
			echo $serverinfo->getLastSql();
		}
	}

	public function ajaxupdate(){
		$data = I('post.');
		$data['create_time'] = time();
		$serverinfo = D('Serverinfo');
		if($serverinfo->save($data)){
			$this->log('更新服务器' . $data['name'],cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}

	public function ajaxdel(){
		$autoid = I('post.autoid');
		$serverinfo = D('Serverinfo');
		if($serverinfo->where(array('autoid' => $autoid))->delete()){
			$this->log('删除服务器id:' . $autoid,cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}

	//3595平台服务器对接
	public function allot(){
		$serverinfo = D('Serverinfo');
		$unallot = $serverinfo->where(array('gameip' => 0))->limit(1)->select();//未分配服务器
		$platser = new \Home\Model\MyModel('server','game_','mysql://3595_main:u3vwczqgg5xcc@192.168.68.238/game');
		$platunallot = $platser->query("SELECT * FROM `game_server` WHERE platcode=''");
		$platstr = "<select class='form-control platser' style='width:500px;'>"
			. "<option value='0'>请选择要对接的服务器</option>";
		foreach ($platunallot as $arr) {
			$platstr .= "<option value='" . $arr['sid'] . "'>" . $arr['name'] . "</option>";
		}
		$platstr .= "</select>";
		$this->assign("platstr",$platstr);
		$this->assign('unallot',$unallot);
		$this->display();
	}

	public function modifyallot(){
		//对接应该服务器
		$input = I('post.');
		if($input['pmid'] != 0){
			$serverinfo = D('Serverinfo');
			$gms = $serverinfo->where(array('autoid' => $input['gmid']))->find();
			$platcode = $gms['platcode'];
			$platser = new \Home\Model\MyModel('server','game_','mysql://3595_main:u3vwczqgg5xcc@192.168.68.238/game');
			$r = $platser->query("UPDATE `game_server` SET platcode='". $platcode . "' WHERE sid=" . $input['pmid']);
			$data['gameip'] = 1;
			$serverinfo->where(array('autoid' => $input['gmid']))->save($data);
			if($r){
				echo 1;
			}else{
				echo $platser->getLastSql();
			}
		}else{
			echo 2;
		}
	}

	public function getserverinfo(){
		//获取区服数据库信息
		$input = I('get.');
		$gameid = $input['gameid'];
		$time = $input['time'];
		$sign = $input['sign'];
		$key = "4FBEE704-006B-432F-AAD7-976427613C2E";
		$ret = array();
		$ret['msgnum'] = 1;
		$ret['data'] = "";
		if(empty($gameid)){
			$ret['msginfo'] = 'gameid为空';
			return json_encode($ret);
		}
		if(empty($time)){
			$ret['msginfo'] = 'time为空';
			return json_encode($ret);
		}
		if(empty($sign)){
			$ret['msginfo'] = 'sign为空';
			return json_encode($ret);
		}
		if(md5("gameid=" . $gameid . "&time=" . $time . "&key=" . $key) != sign){
			$ret['msginfo'] = 'sign检验错误';
			return json_encode($ret);
		}
		$ret['msgnum'] = 0;
		$ret['msginfo'] = "";
		$serverinfo = D('Serverinfo');
		$servers = $serverinfo->select();
		$temp = array();
		$temp['servretype'] = "tencent";
		$temp['software'] = "mariadb";
		foreach($servers as $server){
			$oa = $server['oa_connection'];
			$gs = $server['gs_connection'];
			$oaarr = parse_url($oa);
			$temp['serverid'] = substr($oaarr['path'],strpos($oaarr['path'],'s'));
			$temp['hostname'] = "";
			$temp['serverip'] = $oaarr['host'];
			$temp['port'] = $oaarr['port'];
			$temp['dbname'] = substr($oaarr['path'],1);
			if(strpos($oaarr['path'],'log')){
				$temp['servicetype'] = "logdb";
			}else{
				$temp['servicetype'] = "db";
			}
			$ret['data'][] = $temp;
			$gsarr = parse_url($gs);
			$temp['serverid'] = substr($gsarr['path'],strpos($gsarr['path'],'s'));
			$temp['hostname'] = "";
			$temp['serverip'] = $gsarr['host'];
			$temp['port'] = $gsarr['port'];
			$temp['dbname'] = substr($gsarr['path'],1);
			if(strpos($gsarr['path'],'log')){
				$temp['servicetype'] = "logdb";
			}else{
				$temp['servicetype'] = "db";
			}
			$ret['data'][] = $temp;
		}
		echo json_encode($ret);
	}
	

}
