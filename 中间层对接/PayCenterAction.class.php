<?php
class PayCenterAction extends PublicAction
{
    
	/*public function _initialize() {
        echo "<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>";
        echo '<script>alert("维护中，暂时关闭充值功能，详情请查看官网公告");</script>';
        echo "<script>window.location.href='http://www.3595.com'</script>";
        exit;
    }*/
     
	public function index(){
		$info = A('Getinfo');
		$userinfo = $info->returninfobypaycenter();
		if($userinfo){
			//全部游戏及类别名和最后一个服务器
			$m=new Model();
			$allgames=$m->query("SELECT a.gid,a.name FROM game_game a where  a.status<4 ORDER BY a.gid DESC");
			foreach($allgames as &$singlegame){
				$singlegame['firstletter'] = $this->getinitial($singlegame['name']);
			}
			//var_dump($allgames);exit;
			if(empty($_GET['leftselect'])){
				$leftselect = 0;
			}else{
				$leftselect = $_GET['leftselect'];
			}
			$this->assign("leftselect",$leftselect);
			$this->assign ( "allgames", $allgames );
			$this->assign("userinfo",$userinfo);
			$websetting = F('websetting');
			$this->assign("websetting",$websetting[0]);
			//$this->assign('lastgameserver',$userinfo['lastgameserver']);
			//print_r($userinfo);exit;
			$this->display('PayCenter/test');
		}else{
			$this->display('UserCenter/userLogin-newc');
		}
	}
	/*获取服务器列表，返回JSON格式数组*/
	public function getserverlist(){
		$gid = $_POST['gid'];
		$k = new Model("server");
		$servers = $k->query("select sid,name,platcode from `game_server` where `show`=1 and `gid`=" . $gid);
		$ret = json_encode($servers);
		echo $ret;
	}
	public function test(){
		//$test = A('Test');
		//$test->paycenter();
		$this->redirect('Test/paycenter');
	}
	public function getinitial($str){
		//获取拼音首字母
		$str = iconv('UTF-8','GB2312',$str);
		$asc = ord(substr($str,0,1));
		if($asc > 160){
			$asc = $asc * 1000 + ord(substr($str,1,1));
			if($asc >= 176161 && $asc < 176197){
				return 'A';
			}elseif ($asc>=176197 && $asc<178193){ 
				return 'B'; 
			}elseif ($asc>=178193 && $asc<180238){ 
				return 'C'; 
			}elseif ($asc>=180238 && $asc<182234){ 
				return 'D'; 
			}elseif ($asc>=182234 && $asc<183162){ 
				return 'E'; 
			}elseif ($asc>=183162 && $asc<184193){ 
				return 'F'; 
			}elseif ($asc>=184193 && $asc<185254){ 
				return 'G'; 
			}elseif ($asc>=185254 && $asc<187247){ 
				return 'H'; 
			}elseif ($asc>=187247 && $asc<191166){ 
				return 'J'; 
			}elseif ($asc>=191166 && $asc<192172){ 
				return 'K'; 
			}elseif ($asc>=192172 && $asc<194232){ 
				return 'L'; 
			}elseif ($asc>=194232 && $asc<196195){ 
				return 'M'; 
			}elseif ($asc>=196195 && $asc<197182){ 
				return 'N'; 
			}elseif ($asc>=197182 && $asc<197190){ 
				return 'O'; 
			}elseif ($asc>=197190 && $asc<198218){ 
				return 'P'; 
			}elseif ($asc>=198218 && $asc<200187){ 
				return 'Q'; 
			}elseif ($asc>=200187 && $asc<200246){ 
				return 'R'; 
			}elseif ($asc>=200246 && $asc<203250){ 
				return 'S'; 
			}elseif ($asc>=203250 && $asc<205218){ 
				return 'T'; 
			}elseif ($asc>=205218 && $asc<206244){ 
				return 'W'; 
			}elseif ($asc>=206244 && $asc<209185){ 
				return 'X'; 
			}elseif ($asc>=209185 && $asc<212209){ 
				return 'Y'; 
			}elseif ($asc>=212209){ 
				return 'Z'; 
			}else{ 
				return FALSE; 
			} 
		}else{
			return FALSE;
		}
	}
	public function testsubmit(){
		print_r($_POST);
	}
	
	//测试用
	public function payTo(){
		vendor("payment.alipay.alipay#class");
		
		$aliapy_config['partner']      = '2088002134467641';
		$aliapy_config['key']          = 'yg0txyruiwdiwmja50mucyib0lgbasm3';
		$aliapy_config['seller_email'] = 'yuhuidog@163.com';
		$aliapy_config['return_url']   = 'http://www.csyingwu.com/aplipy/return_url.php';
		$aliapy_config['notify_url']   = 'http://www.csyingwu.com/aplipy/notify_url.php';
		$aliapy_config['sign_type']    = 'MD5';
		$aliapy_config['input_charset']= 'utf-8';
		$aliapy_config['transport']    = 'http';
		
		//请与贵网站订单系统中的唯一订单号匹配
		$order['order_no'] = date('Ymdhis');
		$order['order_subject']      = $_POST['subject'];
		$order['order_desc']         = $_POST['body'];
		$order['order_amount']    = $_POST['total_fee'];
		$alipay=new Alipay($aliapy_config);
		echo "<a href='".$alipay->get_code($order)."'>go to pay</a>";
		
	}
	
	//填写充值信息
	public function payInfo(){
		/*$this->isLogin();
		$n = new Model("game");
		$game=$n->where("status<4")->select();;
		$member=new Model("member");
		$user=$member->where(" uid=".$_SESSION["user"]["uid"])->find();
		$k= new Model("server");
		$servers=$k->where("gid=".$_REQUEST['gid'])->order("sid desc")->select();
		$selectedGame=$n->find($_REQUEST['gid']);
		$this->assign("selectedGame",$selectedGame);
		
		$this->assign("games",$game);
		$this->assign("dp",$_REQUEST['dp']);
		$this->assign("user",$user);
		$this->assign("servers",$servers);
		$this->display();*/
		$this->redirect('PayCenter/index');
	}

	//填写充值信息
	public function payInfo2(){
		/*$this->isLogin();
		$n = new Model("game");
		$game=$n->where("status<4")->select();;
		$member=new Model("member");
		$user=$member->where(" uid=".$_SESSION["user"]["uid"])->find();
		$k= new Model("server");
		$servers=$k->where("gid=".$_REQUEST['gid'])->order("sid desc")->select();
		$selectedGame=$n->find($_REQUEST['gid']);
		$this->assign("selectedGame",$selectedGame);
		
		$this->assign("games",$game);
		$this->assign("dp",$_REQUEST['dp']);
		$this->assign("user",$user);
		$this->assign("servers",$servers);*/
		$this->redirect('PayCenter/index');
	}
	
	//判断是否登录
	protected function isLogin(){
	//判断是否登录
		if(!($this->loadmemcache())){
			$this->assign("jumpUrl","PayCenter/index");
			$this->display("UserCenter/UserLogin");
			//exit();
		}
		else
		{
			return true;
		}
	}
	
	//确认充值信息
	public function confirmPay(){
		//$this->isLogin();
		
		$username=trim($_REQUEST['username']);
		$reusername=trim($_REQUEST['reusername']);

		if(strlen($username)==0 || strlen($reusername)==0 ){
			$this->error('充值帐号不能为空');
		}
		
		if($username!=$reusername){
			$this->error('两次输入的充值帐号不一致');
		}
		
		if($_REQUEST['pay_for']=="platform"){
			$order['game']['gid']=18;
			$order['game']['name']="平台充值";
			$order['server']['sid']=4;
			$order['server']['name']="充值到平台";			
		}else if($_REQUEST['pay_for']=="game"){
			// echo "<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>";
	  //       echo '<script>alert("维护中，暂时关闭充值功能，详情请查看官网公告");</script>';
	  //       echo "<script>window.location.href='http://www.3595.com'</script>";
	  //       exit;
			$m = new Model("game");
			$game=$m->find($_REQUEST['gid']);
			
			if(!empty($game)){
				$order['game']=$game;
			}else{
				$this->error('选择的游戏不存在');
			}
			
			$n = new Model("server");
			$server=$n->find($_REQUEST['sid']);
			
			if(!empty($server)){
				$order['server']=$server;
			}else{
				$this->error('选择的服务器不存在');
			}
		}else{
			$this->error('请选择充值到哪里');
		}
		
		$j=new MemberModel();
		$user=$j->where("username='".$username."'")->find();
		$paymen=$j->where("username='". $_REQUEST['paymen'] ."'")->find();
		if(!empty($user)){
			$order['user']=$user;
		}else{
			$this->error('您还没有登录!!!');
		}
		
		
		$k = new Model("payment");
		$pay=$k ->where("pay_code='".$_REQUEST['code']."'")->find();

		$order['pay']=$pay;		
		$order['money']=$_REQUEST['payMoney'];
		if($order['money']<10 ||  $order['money']>50000 ){
			$this->error('输入的金额不正确!');
		}
		$order['gamemoney']=$_REQUEST['rate2']*$game['moneybili'];	//前端rate2代表原money
		$this->assign("order",$order);		
		$pay_config=unserialize($order['pay']['pay_config']);//反序化支付配置信息
		$payhelp = new Model();
		//设定返回路径
		//$baseurl=$_SESSION['websetting']['gsiteurl'];
		$baseurl=F('websetting')[0]['gsiteurl'];
		$return_url=$baseurl."PayCenter/alipayRespond";
		//$orderid = time();
		$orderid= time();

		$nowUnix = strtotime(date("Y-m-d",time()));

		$nowTime = date("Y-m-d H:i:s",time());

		$lastIp=get_client_ip();
		//print_r("as");exit;
		//dump($pay_config);
		//平台币兑换游戏币
		if($_REQUEST['code']=='platform'){
			$paymentpassword=md5($_REQUEST['paymentpassword']);
			if(strlen($paymentpassword)<6){
				$this->error('请输入正确的交易密码');
			}else if(strlen($user["paymentpassword"])!=32){
				$this->assign("jumpUrl","/UserCenter/tradepassword");
				$this->error('请您到用户中心设置您的交易密码');
			}
			if($paymentpassword==$paymen["paymentpassword"]){
				$this->assign ( "waitSecond", 10 );

				$gid=$order['game']['gid'];
				$uid=$user["uid"];
				$sid=$order['server']['sid'];
				$money=$order['money'];
				if($user["money"]>=$money){				
					$j->setDec("money","uid=".$uid,$money);
					if($gid==65){
						
						$long_rescode=$this->mhj_duihuang($uid,$gid,$sid,$money,$server['platcode'],'plat' . time(),$username,get_client_ip(),0,1);
						if($long_rescode>=0){
							$this->assign("jumpUrl","/PayCenter/payInfo/type/2/gid/".$gid);
							$this->success('充值成功，请到游戏中查收！');
						}else{
							switch ($long_rescode)
							{
								case -1:
								$pay_errmsg="充值失败,未创建角色";
								break;
								case -2:
								$pay_errmsg="充值失败,无法识别的充值服务器";
								break;
								case -3:
								$pay_errmsg="充值失败,无效的请求签名，签名加密错误时返回";
								break;
								case -4:
								$pay_errmsg="充值失败,帐号不存在";
								break;
								case -5:
								$pay_errmsg="充值失败,重复的订单，同一个订单号重复充值时返回";
								break;
								default:
								$pay_errmsg="充值失败,网络异常";
							}
							$this->assign("jumpUrl","/PayCenter/payInfo/type/2/gid/".$gid);
							$this->error($pay_errmsg);
						}
					}
				}else{
					$this->assign("jumpUrl","/PayCenter/payInfo/type/2/gid/".$gid);
					$this->error('您的平台币不够,请充值后再操作!');
				}
			}else{
				$this->error('充值到游戏失败,您输入的交易密码不正确!');
			}
			
		}
        else if($_REQUEST['code']=='alipay'){
            vendor("payment.alipay.alipay#class");
			
			//请与贵网站订单系统中的唯一订单号匹配
			$order['order_no'] = $orderid;
			$order['order_subject'] = '3595游戏充值';//$order['game']['name'].'['.$order['server']['name'].']-充值人民币'.$order['money'];
			$order['order_desc'] = '3595平台游戏充值，http://www.3595.com';//'充值人民币'.$order['money']."，获得元宝".($order['game']['moneybili']*$order['money']);
			$order['order_amount'] = $order['money'];
			$order['show_url'] = "http://www.3595.com";
			$order['return_url'] = "http://www.3595.com/PayCenter/alipayRespond";
			$order['notify_url'] = "http://www.3595.com/PayCenter/alipayNotify";
			//$pay_config['return_url']=$return_url;
			//var_dump($order);exit;
			$alipay=new Alipay();
			$bankname="支付宝";
			$paycheck = $payhelp->execute("insert into game_pay_log values(null,$orderid,$nowUnix,".$order['money'].",".$order['user']['uid'].",".$order['game']['gid'].",".$order['server']['sid'].",'支付宝','IP:$lastIp,时间:$nowTime',0,'','',".time().",null,".$order['money'].")");
			while(!$paycheck){
				$orderid = time();
				$order['order_no'] = $orderid;
				$paycheck = $payhelp->execute("insert into game_pay_log values(null,$orderid,$nowUnix,".$order['money'].",".$order['user']['uid'].",".$order['game']['gid'].",".$order['server']['sid'].",'支付宝','IP:$lastIp,时间:$nowTime',0,'','',".time().",null,".$order['money'].")");
			}
			$this->assign("url",$alipay->get_code($order));
			
		}
		else if($_REQUEST['code']=='yeepay'){
			//$this->error('易宝充值接口维护中，请稍后再试！');
			vendor("payment.yeepay.yeepay#class");
			//请与贵网站订单系统中的唯一订单号匹配
			$order['p2_Order'] = $orderid;
			$order['p5_Pid']      = '3595.com';
			//iconv("GB2312","UTF-8",$order['game']['name'].'-充值人民币'.$order['money']);
			$order['p7_Pdesc']         = '3595.com';
			//iconv("GB2312","UTF-8",'充值人民币'.$order['money'].",获元宝".($order['game']['moneybili']*$order['money']));
			$bankname="易宝-银行卡";
			$truemoney=$order['money'];
			$money=$order['money'];
			switch ($_REQUEST['bankid'])
			{
				case "JUNNET-NET":
				$bankname="易宝-骏网一卡通";
				$truemoney=$money-$money*0.2;
				break;
				case "SZX-NET":
				$bankname="易宝-神州行卡";
				$truemoney=$money-$money*0.1;
				  //$this->error('神州行接口维护中，请使用其他方式充值或关注平台开启神州行接口充值公告！');
				break;
				case "UNICOM-NET":
				$bankname="易宝-联通卡";
				$truemoney=$money-$money*0.1;
				break;
				case "TELECOM-NET":
				$bankname="易宝-电信卡";
				$truemoney=$money-$money*0.1;
				break;
				case "ZHENGTU-NET":
				$bankname="易宝-征途卡";
				$truemoney=$money-$money*0.2;
				break;
				case "SNDACARD-NET":
				$bankname="易宝-盛大卡";
				$truemoney=$money-$money*0.2;

				break;
				case "NETEASE-NET":
				$bankname="易宝-网易卡";
				$truemoney=$money-$money*0.2;
				break;
				case "TIANXIA-NET":
				$bankname="易宝-天下一卡通";
				$truemoney=$money-$money*0.2;
				break;
				default:
				$bankname="易宝-银行卡";
			}
			//dump($bankname);
			$order['p3_Amt']    = $order['money'];
			$order['pd_FrpId']    = $_REQUEST['bankid'];

			$pay_config['p8_Url']="http://www.3595.com/PayCenter/yeepayRespond";
			$order['p8_Url'] = $pay_config['p8_Url'];
			
			$paycheck = $payhelp->execute("insert into game_pay_log values(null,$orderid,$nowUnix,".$order['money'].",".$order['user']['uid'].",".$order['game']['gid'].",".$order['server']['sid'].",'$bankname','IP:$lastIp,时间:$nowTime',0,'','',".time().",null,$truemoney)");		
			while(!$paycheck){
				$orderid = time();
				$order['p2_Order'] = $orderid;
				$paycheck = $payhelp->execute("insert into game_pay_log values(null,$orderid,$nowUnix,".$order['money'].",".$order['user']['uid'].",".$order['game']['gid'].",".$order['server']['sid'].",'$bankname','IP:$lastIp,时间:$nowTime',0,'','',".time().",null,$truemoney)");
			}
			$yeepay=new YeePay();
			$this->assign("url",$yeepay->get_code($order));
			//dump($payhelp->getLastSql());
			
		}
		$this->assign("orderid",$orderid);
		$this->assign("bankname",$bankname);
		$this->display();
	}

	/*public function makeorderid(){
		//生成唯一订单号
		date_default_timezone_set('PRC');
		$paylog = new Model("pay_log");
		$orderid = time();
		$orderlist = $paylog->where("orderid=" . $orderid)->find();
		if($orderlist){
	        sleep(1);
   			$this->makeorderid();
		}else{
			return $orderid;
		}
	}*/
	//移动短信充值返回支付页面
	public function ydzfreceive(){}



		
		//支付宝用户返回支付页面
		public function alipayRespond(){		
			//平台订单号
			$out_trade_no=$_REQUEST["out_trade_no"];
			//支付宝订单号
			$trade_no=$_REQUEST["trade_no"];
			//支付宝返回结果信息
			$trade_status=$_REQUEST["trade_status"];
			//支付金额
			$total_fee=$_REQUEST["total_fee"];	
			$paylog=new Model("pay_log");		
			$orderlist=$paylog->where("orderid=".$out_trade_no." and status=0")->find();

			if(!empty($orderlist)){
				//$k = new Model("payment");
				//$pay=$k ->where("pay_code='alipay'")->find();			
			//$pay_config=unserialize($pay['pay_config']);//反序化支付配置信息			
			$baseurl=F('websetting')[0]['gsiteurl'];
			$pay_config["return_url"]=$baseurl."PayCenter/alipayRespond";
			vendor("payment.alipay.alipay#class");
			$alipay=new Alipay();
			$result=$alipay->respond();
			
			if($result){
				//$this->assign("result","恭喜你支付成功!");
				$s = new Model('server');
				//更新相关信息
				$money=$orderlist['amount'];
				//扣除渠道费用的金额
				$truemoney=$orderlist['truemoney'];
				$uid=$orderlist['uid'];
				$gid=$orderlist['gameid'];
				$sid=$orderlist['serverid'];
				$sid=$orderlist['serverid'];
				$money=$orderlist['amount'];
				$payname=$orderlist['pay'];
				$nowUnix = strtotime(date("Y-m-d",time()));
				$nowTime = date("Y-m-d h:i:s",time());
				$lastIp=get_client_ip();
				$server=$s->where("sid=".$sid)->find();
				$m = new Model();
				$m->startTrans();
				//追加积分
				/*$n=new Model("score_type");
				$scotetype=$n->find(2);
				if($scotetype['run']>0){
					$score=$scotetype['eachscore'];
					$m->execute("update game_member set score=score+$score where uid=$uid");
				}*/
				//首充活动
				$this->New_pro_pay($uid);
				//活动期内获得1：1的积分
				$this->onebyone_getscore($uid,$momey);
				
				//插入支付日志
				$paylogdata=array(
					"status"=>1,
					"succ_time"=>time(),
					"trade_no"=>$trade_no,
					"trade_status"=>$trade_status
					);				
				$paylog->data($paylogdata)->where("orderid=".$out_trade_no)->save();
				
				//获取用户信息
				$um = new MemberModel();
				$member = $um->find($uid);
				//该用户如果有推广站长,那么更新站长的成绩
				if($member['agentid']>0){
					$ip=get_client_ip();
						$agentid=$member['agentid'];//站长ID
						$pmode=3;//代理模式
						$p=new Model("project");
						$project=$p->where("gid=$gid")->order("payticheng asc")->find();//求出该游戏提成最小的项目ID
						$pid=$project['pid'];//项目ID
						$nowUnix=strtotime(date("Y-m-d",time()));
						
						$k = new Model("webmasterresult");
						$mresult=$k->where("date=$nowUnix and webmasterid=$agentid and projectid=$pid and proxymode=$pmode and gameid=$gid")->find();
						//从game_webmasterresult表中找出有没有对应的记录并更新,没有则新建
						if($mresult){
							$wresultid=$mresult['id'];
							$flag=$m->execute("update game_webmasterresult set money = money+$money where id = $wresultid ");
						}else{
							$flag=$m->execute("insert into game_webmasterresult values (null,$nowUnix,$agentid,0,0,0,$money,0,'$ip',$pmode,$gid,$pid) ");
						}
						
						$m->execute("insert into game_webmasterresult_person values (null,$nowUnix,$agentid,$pmode,'$ip',$gid) ");
						if(!$flag)$m->rollback();				
					}
					/*广告用户充值统计*/
					if($member['cid']>0){					
					//$adconfig=new Model("adconfig");
					//$adconfig->setInc("money","cid=".$member['cid'],$money);
						$m->execute("update game_adconfig set money=money+$money where cid=".$member['cid']);
					}
					/*兑换*/
					if($gid!=18){					
						if($gid==65){
							$code = $this->mhj_duihuang($uid,$gid,$sid,$truemoney,$server['platcode'],$out_trade_no,$member['username'],get_client_ip(),0,1);
							$this->assign('result','支付成功，请进入游戏查收！');					
						}
					}else{
						$this->assign("result","支付成功,请到游戏用户中心查收!");
						//$um->setInc("money","uid=".$uid,$money);
						//$m->execute("update game_member set money=money+$money where uid=$uid");
						//dump($m->getLastSql());
					}

				//调用工会活动方法
					$this->guild_pro_pay($member['pcode'],$money);

					$m->commit();				

				}else{
					$this->assign("result","非常抱歉你支付失败!");
				}

			}else{
				$this->assign("result","您的订单已经付款!");
			}

			$this->assign("pay","支付宝");
			$this->assign("trade_no",$out_trade_no);
			$this->assign("total_fee",$total_fee);
			$this->display('payRespond');
		}


		//支付宝用户返回支付页面
		public function alipayNotify(){
			vendor("payment.alipay.alipay#class");
			$alipay = new Alipay();
			$result = $alipay->notifyrespond();
			if($result){
				//验证成功
				//商户订单号
				$out_trade_no = $_POST['out_trade_no'];
				//支付宝交易号
				$trade_no = $_POST['trade_no'];
				//交易状态
				$trade_status = $_POST['trade_status'];
				//支付金额
				$total_fee = $_REQUEST['total_fee'];

				$paylog = new Model("pay_log");


				if($_POST['trade_status'] == 'TRADE_SUCCESS' || $_POST['trade_status'] == 'TRADE_FINISHED'){
					$orderlist = $paylog->where("orderid=" . $out_trade_no . " and status=0")->find();
					if(!empty($orderlist)){
						$s = new Model("server");
						$money = $orderlist['amount'];
						$truemoney = $orderlist['truemoney'];
						$uid = $orderlist['uid'];
						$gid = $orderlist['gameid'];
						$sid = $orderlist['serverid'];
						$payname = $orderlist['pay'];
						$server = $s->where("sid=" . $sid)->find();
						$m = new Model();
						$m->startTrans();
						//插入支付日志
						$paylogdata = array(
							"status"		=>	1,
							"succ_time"		=>	time(),
							"trade_no"		=>	$trade_no,
							"trade_status"	=>	$trade_status
						);
						$paylog->data($paylogdata)->where("orderid=" . $out_trade_no)->save();
						//获取用户信息
						$um = new MemberModel();
						$member = $um->find($uid);
						/*兑换*/
						if($gid != 18){
							if($gid == 65){
								$this->mhj_duihuang($uid,$gid,$sid,$truemoney,$server['platcode'],$out_trade_no,$member['username'],get_client_ip(),0,1);
								//logResult("已执行充值到游戏操作，订单号：" . $out_trade_no . "返回状态：" . $_POST['trade_status']);
							}
						}else{
							//$um->setInc("money","uid=" . $uid,$money);
							$m->execute("update `game_member` set money=money+$money where uid=$uid");
							//logResult("已执行充值到平台操作，订单号：" . $out_trade_no . "返回状态：" . $_POST['trade_status']);
						}
						$m->commit();
					}else{
						logResult("订单已付款或不存在,订单号：" . $out_trade_no . "返回状态：" . $_POST['trade_status']);
					}
				}
				$url = "http://ad1.3595.com/index.php/Home/UserCollector/CollectorMoney";
				$post_data = array('username' => $member['username'],'money' => $truemoney,'paytime' =>$out_trade_no);

				$ch = curl_init();
				curl_setopt($ch,CURLOPT_URL,$url);
				curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
				curl_setopt($ch,CURLOPT_TIMEOUT, 10);
				curl_setopt($ch,CURLOPT_POST,1);
				curl_setopt($ch,CURLOPT_POSTFIELDS, $post_data);
				//curl_setopt($ch,CURLOPT_HEADER,0);

				curl_exec($ch);

				curl_close($ch);
			}else{
				//logResult("没有返回值" . ",时间：" . date("Y-m-d h:i:s",time()));
			}
		}



	//易宝返回支付页面
		public function yeepayRespond(){		
		//平台订单号
			$out_trade_no=$_REQUEST["r6_Order"];
		//订单号
			$trade_no=$_REQUEST["r2_TrxId"];
		//返回结果信息
			$trade_status=$_REQUEST["r1_Code"];
		//支付金额
			$total_fee=$_REQUEST["r3_Amt"];
			$paylog=new Model("pay_log");		
			$orderlist=$paylog->where("orderid=".$out_trade_no." and status=0")->find();
			/*echo $orderlist->getLastSql();
			print_r($orderlist);
			echo $orderlist['gameid'];exit;*/
			$k = new Model("payment");
			//$pay=$k ->where("pay_code='yeepay'")->find();			
		//$pay_config=unserialize($pay['pay_config']);//反序化支付配置信息			
		$baseurl="http://www.3595.com/";
		$pay_config["return_url"]=$baseurl."PayCenter/yeepayRespond";
		vendor("payment.yeepay.yeepay#class");
		$yeepay=new YeePay();
		$result=$yeepay->respond();
		if(!empty($orderlist)){			
			if($result){			
				$this->assign("result","恭喜你支付成功!");
				$s = new Model('server');
				//更新相关信息
				$money=$orderlist['amount'];
				$truemoney=$orderlist['truemoney'];
				$uid=$orderlist['uid'];
				$gid=$orderlist['gameid'];
				$sid=$orderlist['serverid'];
				$payname=$orderlist['pay'];
				$money=$orderlist['amount'];
				$nowUnix = strtotime(date("Y-m-d",time()));
				$nowTime = date("Y-m-d h:i:s",time());
				$lastIp=get_client_ip();
				$server=$s->where("sid=".$sid)->find();
				$m = new Model();
				$m->startTrans();
				//首充活动
				//$this->New_pro_pay($uid);
				//活动期内获得1：1的积分
				//$this->onebyone_getscore($uid,$momey);				
				//插入支付日志
				$paylogdata=array(
					"status"=>1,
					"succ_time"=>time(),
					"trade_no"=>$trade_no,
					"trade_status"=>$trade_status
					);
				$succ_time=time();
				//$paylog->data($paylogdata)->where("orderid=".$out_trade_no)->save();
				$m->execute("update game_pay_log set status=1,succ_time=".$succ_time.",trade_no='".$trade_no."',trade_status='".$trade_status."' where orderid=".$out_trade_no." and status=0");
				//获取用户信息
				$um = new MemberModel();
				$member = $um->find($uid);
				//该用户如果有推广站长,那么更新站长的成绩
				if($member['agentid']>0){
					$ip=get_client_ip();
						$agentid=$member['agentid'];//站长ID
						$pmode=3;//代理模式
						$p=new Model("project");
						$project=$p->where("gid=$gid")->order("payticheng asc")->find();//求出该游戏提成最小的项目ID
						$pid=$project['pid'];//项目ID
						$nowUnix=strtotime(date("Y-m-d",time()));
						
						$k = new Model("webmasterresult");
						$mresult=$k->where("date=$nowUnix and webmasterid=$agentid and projectid=$pid and proxymode=$pmode and gameid=$gid")->find();
						//从game_webmasterresult表中找出有没有对应的记录并更新,没有则新建
						if($mresult){
							$wresultid=$mresult['id'];
							$flag=$m->execute("update game_webmasterresult set money = money+$money where id = $wresultid ");
						}else{
							$flag=$m->execute("insert into game_webmasterresult values (null,$nowUnix,$uid,0,0,0,$money,0,'$ip',$pmode,$gid,$pid) ");
						}
						
						$m->execute("insert into game_webmasterresult_person values (null,$nowUnix,$agentid,$pmode,'$ip',$gid) ");
						if(!$flag)$m->rollback();						
					}
					/*广告用户充值统计*/
					if($member['cid']>0){					
						$adconfig=new Model("adconfig");
						$adconfig->setInc("money","cid=".$member['cid'],$money);
					}
					/*兑换*/
					if($gid!=18){
					//longjiang_duihuang($uid,$gid,$sid,$money,$paycode)
					//pay_orderid

						if($gid==65){
							$code = $this->mhj_duihuang($uid,$gid,$sid,$truemoney,$server['platcode'],$out_trade_no,$member['username'],get_client_ip(),0,1);
							/*if($code == 0){
								$this->assign('result','支付成功，请进入游戏查收！');
							}else{
								$this->assign('result','支付成功，但充值到游戏失败！');
							}*/
							$this->assign('result','支付成功，请进入游戏查收！code:' . $code);
						}
					}
					else
					{
						$this->assign("result","支付成功,请到用户中心查收!");
						$m->execute("update game_member set money=money+$truemoney where uid=$uid");
					}

				//调用工会活动方法
					//$this->guild_pro_pay($member['pcode'],$money);

					$m->commit();				
					$url = "http://ad1.3595.com/index.php/Home/UserCollector/CollectorMoney";
					$post_data = array('username' => $member['username'],'money' => $truemoney,'paytime' =>$out_trade_no);

					$ch = curl_init();
					curl_setopt($ch,CURLOPT_URL,$url);
					curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
					curl_setopt($ch,CURLOPT_TIMEOUT, 10);
					curl_setopt($ch,CURLOPT_POST,1);
					curl_setopt($ch,CURLOPT_POSTFIELDS, $post_data);
					//curl_setopt($ch,CURLOPT_HEADER,0);

					curl_exec($ch);

					curl_close($ch);
				}else{
					$this->assign("result","非常抱歉你支付失败!");
				}
			}else{
				$this->assign("result","非常抱歉，您的订单已经付款或不存在!");
			}
			$this->assign("pay","易宝支付");
			$this->assign("trade_no",$out_trade_no);
			$this->assign("total_fee",$total_fee);
			$this->display('payRespond');
		}

	//莽荒纪兑换接口
		private function mhj_duihuang($uid,$gid,$sid,$money,$paycode,$pay_orderid,$username,$ip,$extra_money,$source){
			$m = new Model();
			$gamelist=new GameModel();
			$gl=$gamelist->where("gid=$gid")->find();
			$dhmoney=intval($money*$gl["moneybili"]);
			$gold=intval($money*$gl["moneybili"]);
			$dhorderid=time();
		//eval('$dhpayurl='.stripslashes($paycode));//生成游戏支付路径
			$sc_payorderid=0;
			$exchange=new Model("exchange");
			if($pay_orderid>0){
				$r_e=$exchange->where(" pay_orderid=".$pay_orderid)->find();
				if(!empty($r_e)){
					$this->assign("result","操作失败,重复的订单充值！");
					return -999;
				}else{
					$exchange->pay_orderid=$pay_orderid;	
				}		
			}	
			$exchange->uid=$uid;
			$exchange->gid=$gid;
			$exchange->sid=$sid;
			$exchange->amount=$money;
			$exchange->time=time();
			$exchange->platcode = $paycode;	
			$exchange->m_account = $username;
			$exchange->ip = $ip;
			$exchange->source = $source;
			$exchange->extra_money = $extra_money;
			$um = new MemberModel();
		//$dhr=$um->getHttpResponse($dhpayurl,'utf-8',60);
			$surl=substr($dhpayurl,0,strpos($dhpayurl,'?'));
			$adata=substr($dhpayurl,strpos($dhpayurl,'?')+1,strlen($dhpayurl));
			//$payip="59.34.148.252";
			//$payport=80;

			$k = new Model("server");
			$server = $k->where(array('sid' => $sid))->find();
			$data = array(
				'sid'			=>	$server['mark'],
				'platform_id'	=>	C('PLATFORM_ID'),
				'username'		=>	$username,
				'charge_time'	=>	$pay_orderid,
				'money'			=>	$dhmoney,
				'ip'			=>	$ip,
				'order_id'		=>	$pay_orderid,
				'time'			=>	time(),
			);
			ksort($data);
			$str = http_build_query($data);
			$data['sign'] = md5(strtolower($str . C('APP_KEY')));
			$data = http_build_query($data);
			$options = array(
				'http'	=>	array(
					'method'	=>	'POST',
					'header'	=>	'Content-type:application/x-www-form-urlencoded',
					'content'	=>	$data,
					'timeout'	=>	30
				)
			);
			//中间层地址
			//$url = "http://gm.3595.com/index.php?m=Home&c=Platcash&a=index";
			//$url = "http://42.62.79.192:8686/index.php?m=Home&c=Platcash&a=index";
			$url = "http://gm.3595.com/index.php?m=Home&c=Platcash&a=index";
			$context = stream_context_create($options);
			$dhr = file_get_contents($url,false,$context);

			//echo $dhr;exit;
			///////////////////////////////////////
			if(!$dhr){
				$dhr = 50;
			}	
			$status=0;
			if($dhr == 0){
				$status=1;
			}
			$exchange->status=$status;
			$exchange->code=$dhr;
			$exchange->add();

			return $dhr;
		} 



		private function curl_get($url){
			$ch = curl_init(); 
			curl_setopt($ch, CURLOPT_URL, $url); 
			curl_setopt($ch, CURLOPT_HEADER, false); 
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			$ret = curl_exec($ch);
			return $ret;	
		}


	//公会活动充值积分增加	private
		private function guild_pro_pay($pcode,$paymoney){
			if(strlen($pcode)>0){
			//活动用户
				$guilduser=new GuilduserModel();
				$userinfo=$guilduser->where("code='".$pcode."'")->find();
				if($userinfo){
				//dump($userinfo);
				//积分
					$guilduserfee=new Model("guildappfee");
				//积分日至
					$guilduserfeelog=new Model("guildappfeelog");
				//项目
					$guildapp=new Model("guildapp");
				//获取项目配置信息
					$gapps=$guildapp->find($userinfo['guildappid']);
				//充值增加积分规则
				$basemoney=$gapps['pay'];//金额基数
				if($paymoney>=$basemoney){
					$truefee=round($paymoney/$basemoney)*$gapps['payfee'];
					//$truefee=$gapps['payfee'];
					//查询积分表中是否有生效的积分条目　如果存在累加否则新增
					$isfee=$guilduserfee->where("guilduserid=".$userinfo['id']." and guildappid=".$userinfo['guildappid']." and isok=1")->find();
					if($isfee){
						$data["fee"]=$isfee['fee']+$truefee;
						$guilduserfee->where("id=".$isfee["id"])->save($data);
					}else{
						$guilduserfee->guilduserid=$userinfo['id'];
						$guilduserfee->guildappid=$userinfo['guildappid'];
						$guilduserfee->fee=$truefee;
						$guilduserfee->isok=1;
						$guilduserfee->time=date('Y-m',time());
						$guilduserfee->add();
					}

					//添加积分日志online,peple,pay
					$guilduserfeelog->guilduserid=$userinfo['id'];
					$guilduserfeelog->guildappid=$userinfo['guildappid'];
					$guilduserfeelog->fee=$truefee;
					$guilduserfeelog->time=time();
					$guilduserfeelog->feetype='pay';
					$guilduserfeelog->timemonth=date('Y-m',time());
					$guilduserfeelog->add();
				}
			}
			return true;
		}
	}

	//首充送积分
	private function New_pro_pay($uid){
		$paylog=new Model("pay_log");
		$n=new Model("score_type");			
		$scotetype=$n->find(5);
		$stime=intval($scotetype['begintime']);
		$etime=intval($scotetype['endtime']);
		$onedata=$paylog->where("uid=$uid and status=1 and create_time>=".$stime)->find();
		$now=time();
		if(empty($onedata)){			
			if($scotetype['run']=='1' && $now>$stime && $now < $etime){
				$score=$scotetype['eachscore'];
				$n->execute("update game_member set score=score+$score where uid=$uid");
			}
		}	
	}
	

	
	//活动期内获得1：1的积分
	private function onebyone_getscore($uid,$momey){
		$now=time();
		$n=new Model("score_type");
		$scotetype=$n->find(2);
		$stime=intval($scotetype['begintime']);
		$etime=intval($scotetype['endtime']);
		if($scotetype['run']=='1' && $now>$stime && $now<$etime ){
			$score=$momey;
			$n->execute("update game_member set score=score+$score where uid=$uid");
				//dump($n->getLastSql());
		}

	}

	function curl_post($dhpayurl){
		$url=substr($dhpayurl,0,strpos($dhpayurl,'?'));
		$post_data=substr($dhpayurl,strpos($dhpayurl,'?')+1,strlen($dhpayurl));
		dump($url);
		dump($post_data);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_URL,$url);
		//为了支持cookie
		//curl_setopt($ch, CURLOPT_COOKIEJAR, 'cookie.txt');
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		$result = curl_exec($ch);
		return $result;
	}
	
/*	public function sjf_shouchong(){
		$uid=$_REQUEST['uid'];
		$this->New_pro_pay($uid);
		dump('首冲送积分成功'.$uid);
	}

public function sjf_onebyone(){
		$uid=$_REQUEST['uid'];
		$this->onebyone_getscore($uid,100);
		dump('充值1:1送积分成功 100');
	}*/

	public function test1(){
		$dhr = $this->mhj_duihuang(16792,65,1,1,'386a62562103fc3fcbf2198c087bd516',time(),'hai1222',get_client_ip(),0,1);
		echo $dhr;
	}

	//加载memcache配置
	public function loadmemcache(){
		session_start();
		$infokey = '3595_' . session_id();
		$memcachehost = C('memcachehost');
		$memcacheport = C('memcacheport');
		$memcacheexpire = C('memcacheexpire');
		$memcache_obj = new Memcache;
		$memcache_obj->connect($memcachehost,$memcacheport);
		$info = $memcache_obj->get($infokey);
		$memcache_obj->close();
		$info = json_decode($info);
		//print_r($info);
		return $info;
	}

	//加载memcache配置
	public function loadmemcache1(){
		session_start();
		$infokey = '3595_' . session_id();
		$memcachehost = C('memcachehost');
		$memcacheport = C('memcacheport');
		$memcacheexpire = C('memcacheexpire');
		$memcache_obj = new Memcache;
		$memcache_obj->connect($memcachehost,$memcacheport);
		$info = $memcache_obj->get($infokey);
		$memcache_obj->close();
		$info = json_decode($info);
		print_r($info);
		echo "<hr>";
		print_r(F('websetting'));
		echo "<hr>";
		echo F('websetting')[0]['gsiteurl'];
		//return $info;
	}
	public function checkuser(){
		$username = $_POST['username'];
		$platcode = $_POST['platcode'];
		$k = new Model("server");
		$server = $k->where(array('platcode' => $platcode))->find();

		$data = array(
			'sid'			=>	$server['mark'],
			'platform_id'	=>	C('PLATFORM_ID'),
			'username'		=>	$username,
			'time'			=>	time()
		);
		ksort($data);
		$str = http_build_query($data)
		$data['sign'] = md5(strtolower($str . C('APP_KEY')));

		$data = http_build_query($data);
		$options = array(
			'http'	=>	array(
				'method'	=>	'POST',
				'header'	=>	'Content-type:application/x-www-form-urlencoded',
				'content'	=>	$data,
				'timeout'	=>	10
			)
		);
		$url = "http://gm.3595.com/index.php?m=Home&c=Platcash&a=checkuser";
		$context = stream_context_create($options);
		$dhr = file_get_contents($url,false,$context);
		echo $dhr;
	}

	public function jserr($msg){
		return "<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>" . 
        '<script>alert(' . $msg . ');</script>' .
        "<script>window.location.href='http://www.3595.com'</script>";
	}
	
}
