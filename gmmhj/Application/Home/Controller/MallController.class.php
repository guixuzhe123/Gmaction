<?php
namespace Home\Controller;
use Think\Controller;
class MallController extends BaseController{

    public function index(){
    	$input = I('post.');
        if(1){
            if(empty($input)){
                $autoid = 25;
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
            }else{
                $autoid = $input['autoid'];
                $start_date = $input['start_date'];
                $end_date = $input['end_date'];
            }
    		if($autoid == 0){
    			$this->error('请选择区服');
    		}
    		if(empty($start_date)){
    			if(empty($end_date)){
    				$SQL = "select sum(itemnum) as buy_num,itemid from mall_buy where goldtype = 1 group by itemid order by buy_num desc";
    			}else{
    				$SQL = "select sum(itemnum) as buy_num,itemid from mall_buy where goldtype = 1 and time <= '" . $end_date . " 23:59:59' group by itemid order by buy_num desc";
    			}
    		}else{
    			if(empty($end_date)){
    				$SQL = "select sum(itemnum) as buy_num,itemid from mall_buy where goldtype = 1 and time >= '" . $start_date . "' group by itemid order by buy_num desc";
    			}else{
    				$SQL = "select sum(itemnum) as buy_num,itemid from mall_buy where goldtype = 1 and time >= '" . $start_date . "' and time <= '" . $end_date . " 23:59:59' group by itemid order by buy_num desc";
    			}
    		}
    		$emptymodel = new \Home\Model\OAEmptyModel($autoid);
    		$rs = $emptymodel->query($SQL);
    		$props = $this->getprop();
    		foreach($rs as &$rsarr){
    			foreach($props as $prop){
    				if($prop['propid'] == $rsarr['itemid']){
    					$rsarr['itemid'] = $prop['propname'];
    					break;
    				}
    			}
    		}
    		$this->assign('rs',$rs);
    		$this->assign('start_date',$start_date);
    		$this->assign('end_date',$end_date);
    		//$this->assign('props',$this->getprop());
    		//echo $SQL;exit;
    	}
    	vendor('Pager.Pager');
    	$this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }
}
