<?php
namespace Home\Controller;
use Think\Controller;
class CrontabController extends Controller{
   
   public function oldplayer(){
	//老玩家数据
	$data['date'] = strtotime("today") - 86400;
	$data['num'] = 0;
	$serverinfo = D('Serverinfo');
	$servers = $serverinfo->select();
	$m = M();
	foreach($servers as $server){
		$characters = new \Home\Model\GSCharacterModel($server['autoid']);
		$SQL = "SELECT COUNT(*) as todayc FROM `character` WHERE UNIX_TIMESTAMP(logintime)>=" .  $data['date'] . " AND UNIX_TIMESTAMP(logintime)-UNIX_TIMESTAMP(create_character_time)>86400";
		//echo $SQL;exit;
		$res = $characters->query($SQL);
		$data['num'] += $res[0]['todayc'];
	}
	$oldplayer = D('Oldplayer');
	if($oldplayer->add($data)){
		echo "222";
	}else{
		echo $oldplayer->getLastSql();
	}
   }

   public function stock(){
        //银两、元宝、礼金存量
       $serverinfo = D('Serverinfo');
       $servers = $serverinfo->select();
       $datas = array();
       foreach($servers as $server){
            $money = new \Home\Model\OAMoneyModel($server['autoid']);
            $money_stock = $money->query("SELECT ABS(a.num1-b.num2) as stock FROM (SELECT abs(sum(amount1)-sum(amount2)) as num1 FROM `money` WHERE useorget=0) a,(SELECT abs(sum(amount1)-sum(amount2)) as num2 FROM `money` WHERE useorget=1) b");
            $emoney_stock = $money->query("SELECT ABS(a.num-b.num) as stock FROM (SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney` WHERE useorget=0) a,(SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney` WHERE useorget=1) b");
            $emoney2_stock = $money->query("SELECT ABS(a.num-b.num) as stock FROM (SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney2` WHERE useorget=0) a,(SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney2` WHERE useorget=1) b");
            $datas[] = array(
                'autoid'    =>  $server['autoid'],
                'money'     =>  $money_stock[0]['stock'],
                'gold'      =>  $emoney_stock[0]['stock'],
                'gift'      =>  $emoney2_stock[0]['stock']
                );
       }
       print_r($datas);
   }
   public function stock1(){
        //银两、元宝、礼金存量
       $serverinfo = D('Serverinfo');
       $servers = $serverinfo->select();
       $stock = D('Stock');
       $datas = array();
       foreach($servers as $server){
            $money = new \Home\Model\OAMoneyModel($server['autoid']);
            $money_stock1 = $money->query("SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `money` WHERE useorget=0");
            $money_stock2 = $money->query("SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `money` WHERE useorget=1");
            $money_stock = abs($money_stock1[0]['num'] - $money_stock2[0]['num']);
            $emoney_stock1 = $money->query("SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney` WHERE useorget=0");
            $emoney_stock2 = $money->query("SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney` WHERE useorget=1");
            $emoney_stock = abs($emoney_stock1[0]['num'] - $emoney_stock2[0]['num']);
            $emoney2_stock1 = $money->query("SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney2` WHERE useorget=0");
            $emoney2_stock2 = $money->query("SELECT ABS(SUM(amount1)-SUM(amount2)) as num FROM `emoney2` WHERE useorget=1");
            $emoney2_stock = abs($emoney2_stock1[0]['num'] - $emoney2_stock2[0]['num']);
            $datas = array(
                'autoid'    =>  $server['autoid'],
                'money'     =>  $money_stock,
                'gold'      =>  $emoney_stock,
                'gift'      =>  $emoney2_stock
                );
            if($stock->where(array('autoid' => $server['autoid']))->find()){
                $stock->save($datas);
            }else{
                $stock->add($datas);
            }
       }
   }
   
}
