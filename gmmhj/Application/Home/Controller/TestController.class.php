<?php
namespace Home\Controller;
use Think\Controller;
class TestController extends BaseController{
    public function index(){
		//phpinfo();exit;
		$url = "http://gm.3595.com/sdfsdfsdfsdfsdf";
		$dhr = file_get_contents($url,false,null);
		if($dhr == 'false'){
			echo "false";
		}else{
			echo "true";
		}
		var_dump($dhr);
    }
    public function test(){
    	echo md5("maodada");
    	echo "<hr/>";
    	echo md5("100" . "3595mhj_hai1222" . "433c77088a026e7644ec6706ecef9df6");
    }

    public function test1(){
		$paylog = D('Paylog');
		$date = I('post.dateinput2222');
		$autoid = I('post.autoid');
		if($date != 0){
			$starttime = $date;
			$endtime = ($date + 86400 - 1) . "";
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
			echo $paylog->getLastSql();
		    $count = $paylog->where($where)->count();
        }
		//var_dump($pay);exit;
		foreach($pay as &$arr){
			$info = $this->getuser($arr['characterid'],$arr['autoid']);
			$arr['name'] = $info['name'];
			$arr['account'] = $info['account'];
			$arr['id'] = $this->getsid($arr['autoid']);
		}
        //print_r($pay);exit;
        //echo $paylog->getLastSql();exit;
		$this->assign('pay',$pay);
		$this->assign('summoney',$summoney);
		$this->assign('count',$count);
		vendor('Pager.Pager');
		$this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
		$this->display();
	}


    //更新模块信息
    public function updatemod(){
    	$input = I('post.');
    	$jsontitle = $input['jsontitle'];
    	//echo $jsontitle;exit;
    	$jsontitle = html_entity_decode($jsontitle);
    	//echo $jsontitle;exit;
    	$jsontitle = json_decode($jsontitle,TRUE);
    	//print_r($jsontitle);exit;
    	$block = D('Block');
    	$block->query("TRUNCATE TABLE `gm_block`");
    	foreach($jsontitle as $arr) {
    		$data = array();
			//进行添加
			$len = strlen($arr['blockname']);
			switch($len){
				case 3:
					//一级目录
					$data = array(
						'blocktitle'	=>	$arr['blockname'],
						'blockname'		=>	$arr['blocktitle'],
						'blockrank'		=>	1,
						'parentblock'	=>	0
					);
					$block->add($data);
					//echo "addone:" . $block->getLastSql();
					break;
				default:
					//二级目录
					$data = array(
						'blocktitle'	=>	$arr['blockname'],
						'blockname'		=>	$arr['blocktitle'],
						'blockrank'		=>	2,
						'parentblock'	=>	substr($arr['blockname'],0,3)
					);
					$block->add($data);
					//echo "addtwo:" . $block->getLastSql();
					break;
			}
    		
    	}
    }
    //对账页面
    public function checkbill(){
    	$input = I('post.');
    	if(empty($input)){
    		$this->display();
    	}else{
    		$starttime = $input['dateinput2222'];
    		$endtime = $starttime + 86400 - 1;
    		$m = M();
    		$gmres = $m->query("select m_billno,m_emoney/10 as money from `gm_paylog` where source=1 and m_chargetime>=$starttime and m_chargetime<=$endtime");
    		echo $m->getLastSql();exit;
    		$gmsum = $m->query("select sum(m_emoney)/10 as smoney from `gm_paylog` where source=1 and m_chargetime>=$starttime and m_chargetime<=$endtime");
    		$gmcount = $m->query("select count(*) as cmoney from `gm_paylog` where source=1 and m_chargetime>=$starttime and m_chargetime<=$endtime");
    		$this->assign('gmres',$gmres);
    		$this->assign('gmsum',floor($gmsum[0]['smoney']));
    		$this->assign('gmcount',$gmcount[0]['cmoney']);
    		$this->assign('datetime',date('Y-m-d',$starttime));
    		//var_dump($gmsum);
    		//var_dump($gmcount);
    		$pm = new \Home\Model\MyModel('pay_log','game_','mysql://3595_main:u3vwczqgg5xcc@192.168.68.238/game');
    		$pmres = $pm->query("select orderid,amount from `game_pay_log` where create_time >= $starttime and create_time <= $endtime and (trade_status='1' or trade_status='TRADE_SUCCESS')");
    		$pmsum = $pm->query("select sum(amount) as smoney from `game_pay_log` where create_time >= $starttime and create_time <= $endtime and (trade_status='1' or trade_status='TRADE_SUCCESS')");
    		$pmcount = $pm->query("select count(*) as cmoney from `game_pay_log` where create_time >= $starttime and create_time <= $endtime and (trade_status='1' or trade_status='TRADE_SUCCESS')");
    		$this->assign('pmres',$pmres);
    		$this->assign('pmsum',floor($pmsum[0]['smoney']));
    		$this->assign('pmcount',$pmcount[0]['cmoney']);
    		$this->assign('largenum',max($gmcount[0]['cmoney'],$pmcount[0]['cmoney']));
    		$this->display();
    	}
    }

	//根据id查询用户信息
	public function getuser($characterid,$autoid = 25){
		$gscharacter = new \Home\Model\GSCharacterModel($autoid);
		$info = $gscharacter->where(array('characterid' => $characterid))->find();
		return $info;
	}
	public function test2(){
		$url = "http://ad1.3595.com/index.php/Home/UserCollector/CollectorMoney";
		$post_data = array('username' => 'test123','money' => 100,'paytime' => time());

		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch,CURLOPT_POST,1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		//curl_setopt($ch,CURLOPT_HEADER,0);

		echo curl_exec($ch);

		curl_close($ch);
	}
}
