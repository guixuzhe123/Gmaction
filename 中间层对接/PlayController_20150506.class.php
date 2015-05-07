<?php
namespace Index\Controller;
use Think\Controller;
class PlayController extends Controller {
	//获取用户信息
	protected function getUserInfo($seid){
		S(array(
			'type'		=>	'memcache',
			'host'		=>	'192.168.68.238',
			'port'		=>	'11211',
			'prefix'	=>	'3595_',
			'expire'	=>	1800
			));
		$jsoninfo =  S($seid);
		if( $jsoninfo ){
			return $jsoninfo;
		}else{
			return false;
		}
	}	
	public function getLogininfo(){
		if( isset($_COOKIE['seid']) ){
			$seid = $_COOKIE['seid'];
			$sevalue = $_COOKIE['sevalue'];
			if( $sevalue == md5($seid.'nocherain') ){
				$userinfo = $this->getUserInfo($seid);
				return $userinfo;
				if( $userinfo == false ){
					return false;
				}else{
					return $userinfo;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
		
	}	
    public function index($gid,$sid){
		$jsoninfo = $this->getLogininfo();
		if( $jsoninfo  == false ){
			$url = 'http://www.3595.com/Game/serverlist/gid/'.$gid;
			$this->assign("jumpUrl",$url);
			$this->error('未登录-!');
		}
		$user = json_decode($jsoninfo,true);
		$username = $user['username'];
    	if($this->checkserver($sid,$username) == -1){
    		$this->error('该服务器维护中','/Index/Index/index');
    	}
		$uid = $user['uid'];
		if( $username&&$gid&&$sid ){
			$condition_ma['gid'] = $gid = C('GAME_CONFIG.GAME_GID');
			//当游戏需要激活且用户未激活的时候
			/*验证是否需要激活*/		
			$gm=new \Index\Model\GameModel();
			$condition_gm['gid'] = $gid;
			$record_gm = $gm->where($condition_gm)->find();
			$isActivation = $record_gm['isActivation'];
			$ma=new \Index\Model\MemberActivationModel();
			$condition_ma['uid'] = $uid;
			$condition_ma['gid'] = $gid;
			
			$record_ma = $ma->where($condition_ma)->find();
			if( $isActivation == 2 && empty($record_ma) ){
				$this->error('需要在官网激活才能进入游戏');
			}else{
				//取服务器信息
				$s=new \Index\Model\ServerModel();
				$s_condition['sid'] = $sid;
				$s_condition['gid'] = $gid;
				$serverdata = $s->where($s_condition)->find();
				if( empty($serverdata) ){$this->error('未知的服务器');}
				//取配置信息,跳转的URL和用户名前缀
				$mark = $serverdata['mark'];
				$servername = $serverdata['name'];
				/* 将 key 写入数据库 */
				$gp=new \Index\Model\GamePlayModel();
                $key = C('APP_KEY');
                $platform_id = C('PLATFORM_ID');
                $check = array(
                    'sid'           =>  $mark,
                    'platform_id'   =>  $platform_id,    
                    'username'      =>  $username,
                    'gid'           =>  $gid,
                    'time'          =>  time(),
                    'server_title'  =>  urlencode($servername),
                );
                ksort($check);
                $str = http_build_query($check);
                $sign = md5(strtolower($str . $key));

                $savedate = array(
                	'username'	=>	$check['username'],
                	'key'		=>	$sign,
                	'gameid'	=>	$gid,
                	'sid'		=>	$sid
                	'mark'		=>	$mark,
                	'playtime'	=>	$check['time'],
                	);	
                $gp->add($savedate);

				$posturl = "http://ad1.3595.com/index.php/Home/MengADManger/CollectorLoginTime";
				$post_fields = 'username='.$username.'&logintime='.time();
				$result = postcurl($posturl,$post_fields);
				
				echo "<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>
				<form style='display:none;' id='form1' name='form1' method='post' action='http://play.3595.com/play.php' target='_self'>
				<input name='sid' type='text' value='".$mark."' />
				<input name='platform_id' type='text' value='".$platform_id."'/>
				<input name='username' type='text' value='".$username."'/>
				<input name='gid' type='text' value='".$gid."'/>
				<input name='time' type='text' value='" . $check['time'] . "'/>
				<input name='server_title' type='text' value='" . $servername . "'/>
				<input name='sign' type='text' value='".$sign."'/>
				</form>
				<script type='text/javascript'>function load_submit(){document.form1.submit()}load_submit();</script>";
				exit;
			}		
		}else{
			$this->error('验证失败');
		}
	}
    
	public function getserverinfo(){
		$servername = isset($_POST['servernumber'])?$_POST['servernumber']:'';
		if(empty($servername)){
			$this->error ('未知的地址');
		}else{
			if( F('allserverlist') ){
				$allserverlist = F('allserverlist');
			}else{
				$gs=new \Index\Model\ServerModel();
				$serverlist = $gs->where('gid = '.$gid)->order('publishdate desc')->select();
				F('allserverlist',$allserverlist);
			}
			foreach($allserverlist as $key=>$value){
				$allserverlist[$key]['statusname'] = $servers_status_array[$value['status']];
			}
			foreach($allserverlist as $key=>$value){
				if( $value['mark'] == $servername){
					$array['gid'] = $value['gid'];
					$array['sid'] = $value['sid'];
					$info['href'] = 'http://'.$_SERVER['HTTP_HOST'].U('play/index',$array);
					$info['status'] = $value['status'];
					$this->success ('成功',$info);
				}
			}
			$this->error ('暂未开启');
		}
		
	}
	public function indexneibu($gid,$sid){
		$jsoninfo = $this->getLogininfo();
		if( $jsoninfo  == false ){
			$url = 'http://www.3595.com/Game/serverlist/gid/'.$gid;
			$this->assign("jumpUrl",$url);
			$this->error('未登录-!');
		}
		$user = json_decode($jsoninfo,true);
		$username = $user['username'];
		$uid = $user['uid'];
		if( $username&&$gid&&$sid ){
			$gid = C('GAME_CONFIG.GAME_GID');
			$HfConfig = C('HfConfig');
			$PlayUrl = $HfConfig['test']['PlayUrl'];
			$UserPre = $HfConfig['test']['UserPre'];
			$mark = $HfConfig['test']['serverlist'][$sid]['mark'];
			
			/* 将 key 写入数据库 */
			$key = md5($username.time().'123');
			$gp=new \Index\Model\GamePlayModel();
			$gpcondition['username'] = $username;
			$gpcondition['sid'] = $sid;
			$gpcondition['gameid'] = $gid;
			$gprs = $gp->where($gpcondition)->find();
			if( empty($gprs) ){
				$gpdata['username'] = $username;
				$gpdata['gameid'] = $gid;
				$gpdata['sid'] = $sid;
				$gpdata['playtime'] = time();
				$gpdata['mark'] = $mark;
				$gpdata['key'] = $key;
				$gp->add($gpdata);
			}else{
				$gpdata2['key'] = $key;
				$gpdata2['mark'] = $mark;
				$gpdata2['playtime'] = time();
				$gpcondition2['gpid'] = $gprs['gpid'];
				$gp->where($gpcondition2)->save($gpdata2);
			}
			/*
			$posturl = "http://ad1.3595.com/index.php/Home/UserCollector/CollectorLoginTime";
			$post_fields = 'username='.$username.'&logintime='.time();
			$result = postcurl($posturl,$post_fields);
			echo $result;
			*/
			
            echo "<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>
            <form style='display:none;' id='form1' name='form1' method='post' action='".$PlayUrl."' target='_self'>
			<input name='username' type='text' value='".$UserPre.$username."' />
			<input name='key' type='text' value='".$key."'/>
			<input name='mark' type='text' value='".$mark."'/>
			<input name='gid' type='text' value='".$gid."'/>
			<input name='urlorigin' type='text' value='3595mhj'/>
			<input name='client' type='text' value='0'/>
			</form>
			<script type='text/javascript'>function load_submit(){document.form1.submit()}load_submit();</script>";
			exit;		
		}else{
			$this->error('验证失败');
		}
	}
	public function checkActivation(){
		$data = $_POST;
		$username = $data['username'];
		if( empty($username) ) $this->error('未登录');
		$jsoninfo = $this->getLogininfo();
		if( $jsoninfo  == false ){
			$url = 'http://www.3595.com/Game/serverlist/gid/'.$gid;
			$this->assign("jumpUrl",$url);
			$this->error('未登录');
		}
		$user = json_decode($jsoninfo,true);
		$uid = $user['uid'];
		if($uid){
			//游戏是否需要激活
			$gid = C('GAME_CONFIG.GAME_GID');
			$gm=new \Index\Model\GameModel();
			$condition_gm['gid'] = $gid;
			$isActivation = $gm->where($condition_gm)->getField('isActivation');
			if($isActivation == 2){
				//用户是否已经激活
				$ma=new \Index\Model\MemberActivationModel();
				$condition_ma['uid'] = $uid;
				$condition_ma['gid'] = $gid = C('GAME_CONFIG.GAME_GID');
				$record_ma = $ma->where($condition_ma)->find();
				if( empty($record_ma) ){
					//echo '1';exit;
					$this->error('未激活');
				}else{
					//echo '2';exit;
					$this->success('已激活');
				}	
			}else{
				$this->success('不需要激活!');
			}
		}else{
			//echo '';exit;
			$this->error('未登录!!');
		}
	}
	public function indexClient($gid,$sid,$lc='0'){
		$jsoninfo = $this->getLogininfo();
		
		if( $jsoninfo  == false ){
			$this->redirect('http://www.3595.com/ClientLogin');
		}
		$user = json_decode($jsoninfo,true);
		$username = $user['username'];
		$uid = $user['uid'];
		if( $username&&$gid&&$sid ){
			$condition_ma['gid'] = $gid = C('GAME_CONFIG.GAME_GID');
			//当游戏需要激活且用户未激活的时候
			/*验证是否需要激活*/		
			$gm=new \Index\Model\GameModel();
			$condition_gm['gid'] = $gid;
			$record_gm = $gm->where($condition_gm)->find();
			$isActivation = $record_gm['isActivation'];
			$ma=new \Index\Model\MemberActivationModel();
			$condition_ma['uid'] = $uid;
			$condition_ma['gid'] = $gid;
			
			$record_ma = $ma->where($condition_ma)->find();
			if( $isActivation == 2 && empty($record_ma) ){
				$this->error('需要在官网激活才能进入游戏');
			}else{
				//取服务器信息
				$s=new \Index\Model\ServerModel();
				$s_condition['sid'] = $sid;
				$s_condition['gid'] = $gid;
				$serverdata = $s->where($s_condition)->find();
				if( empty($serverdata) ){$this->error('未知的服务器');}
				$mark = $serverdata['mark'];
				$servername = $serverdata['name'];
				
				/* 将 key 写入数据库 */
				$gp=new \Index\Model\GamePlayModel();
                $key = C('APP_KEY');
                $platform_id = C('PLATFORM_ID');
                $check = array(
                    'sid'           =>  $mark,
                    'platform_id'   =>  $platform_id,    
                    'username'      =>  $username,
                    'gid'           =>  $gid,
                    'time'          =>  time(),
                    'server_title'  =>  urlencode($servername),
                );
                ksort($check);
                $str = http_build_query($check);
                $sign = md5(strtolower($str . $key));

                $savedate = array(
                	'username'	=>	$check['username'],
                	'key'		=>	$sign,
                	'gameid'	=>	$gid,
                	'sid'		=>	$sid
                	'mark'		=>	$mark,
                	'playtime'	=>	$check['time'],
                	);	
                $gp->add($savedate);

				$posturl = "http://ad1.3595.com/index.php/Home/MengADManger/CollectorLoginTime";
				$post_fields = 'username='.$username.'&logintime='.time();
				$result = postcurl($posturl,$post_fields);
				
				echo "<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>
				<form style='display:none;' id='form1' name='form1' method='post' action='http://play.3595.com/play.php' target='_self'>
				<input name='sid' type='text' value='".$mark."' />
				<input name='platform_id' type='text' value='".$platform_id."'/>
				<input name='username' type='text' value='".$username."'/>
				<input name='gid' type='text' value='".$gid."'/>
				<input name='time' type='text' value='" . $check['time'] . "'/>
				<input name='server_title' type='text' value='" . $servername . "'/>
				<input name='sign' type='text' value='".$sign."'/>
				</form>
				<script type='text/javascript'>function load_submit(){document.form1.submit()}load_submit();</script>";
				exit;
				
			}		
		}else{
			$this->redirect('http://www.3595.com/ClientLogin');
		}
	}
	public function activation(){
		$uid = $_COOKIE['uid'];
		if($uid){
			$data = $_POST;
			$sid = $data['sid'];
			$ac=new \Index\Model\ActivationcodeModel();
			$condition_ac['activationcode'] = $activationcode = $data['activationcode'];
			$condition_ac['gid'] = $gid = C('GAME_CONFIG.GAME_GID');
			$record_ac = $ac->where($condition_ac)->find();
			//echo $ac->getLastSql();exit;
			if($record_ac){
				if( $record_ac['status'] == 2){$this->error('激活码已被使用');}
				$savedate['status'] = 2;
				if( $ac->where($condition_ac)->save($savedate) ){
					$aid = $ac->where($condition_ac)->getField('aid');
					//同时写入用户激活状态表
					$ma=new \Index\Model\MemberActivationModel();
					$condition_ma['uid'] = $uid;
					$condition_ma['gid'] = $gid;
					$record_ma = $ma->where($condition_ma)->find();
					if( !empty($record_ma) ){$this->error('已激活');}
					$condition_ma['aid'] = $aid;
					$condition_ma['status'] = 1;
					$ma->add($condition_ma);
					$this->success('激活成功');
				}else{$this->error('网络异常请重试');}
			}else{
				$this->error('激活码不存在');
			}
		}else{$this->error('未登录');}
	}
	public function sssql($gid){
        if($gid == 65){
			$ac=new \Index\Model\MemberActivationModel();
			$acuids = $ac->getField('uid',true);
			print_r($acuids);
			$am=new \Index\Model\MemberModel();
			$uids = $am->field('uid')->select();
			$data = array();
			foreach($uids as $key=>$value){
				if( in_array($value['uid'],$acuids)){
				}else{
					$data[$key]['uid'] = $value['uid'];
					$data[$key]['gid'] = 65;
					$data[$key]['aid'] = 1234567890;
					$data[$key]['status'] = 1;
				}
			}
			$ac->addAll($data);
		}else{
			echo 'error';exit;
		}
    }

    //查询服务器状态
    public function checkserver($sid,$username){
        $white = array("wsxedc12","edcrfv12","zhk003","zhk004","zhk005","okmijn12","ijnuhb12","uhbygv12","ygvtfc12","tfcrdx12");
        if(in_array($username,$white)){
            return 0;
        }
    	$s = new \Index\Model\ServerModel();
    	$res = $s->where(array('sid' => $sid))->find();
    	return $res['status'];
    }
}
