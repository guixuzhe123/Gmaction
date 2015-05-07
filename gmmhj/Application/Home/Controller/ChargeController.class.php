<?php

namespace Home\Controller;

use Think\Controller;

class ChargeController extends BaseController {

    /**
     * 区服充值详情:
     *  对勾选服务器的充值详细情况进行查询，需要起始时间控件（精确到日），
     *  显示所选服务器所选时间段内的每一笔充值详情。 区服，订单号，用户账号，充值元宝，充值时间
     */
    public function query_charge_list() {
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
            }else{
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
            }
            $autoid = I('post.autoid');
            $characterid = I('post.characterid');
            $account = I('post.account');
            $resourceid = I('post.resourceid');

            $where = array();
            if($autoid != 0){
                $where['serverid'] = $this->getsid($autoid);
            }
            if($resourceid != 0){
                $where['channel'] = $resourceid;
                $this->assign('resourceid',$resourceid);
            }
            if(!empty($characterid)){
                $where['characterid'] = $characterid;
                $this->assign('characterid',$characterid);
            }
            if(!empty($account)){
                switch($resourceid){
                    case 1:
                        $where['account'] = "3595mhj_" . $account;
                        break;
                    case 2:
                        $where['account'] = "youzhai_" . $account;
                        break;
                    default:
                        break;
                }
                $this->assign('account',$account);
            }
            if(!empty($start_date) && !empty($end_date)){
                $where['time'] = array('between',array($start_date,$end_date." 23:59:59"));
                $this->assign('start_date', $start_date);
                $this->assign('end_date', $end_date);
            }
            //$limit = 50;
            $day_data = new \Home\Model\PublicchargeModel();
            $rs = $day_data->where($where)->order('time desc')->select();
            $characters = new \Home\Model\GSCharacterModel($autoid);
            foreach($rs as &$arr){
                $name = $characters->where(array('characterid' => $arr['characterid']))->find();
                $arr['username'] = $name['name'];
            }
            $this->assign('rs', $rs);
        }
        vendor('Pager.Pager');
        $this->assign('plats',$this->plats);
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }


    /**
     * 区服充值详情:
     *  对勾选服务器的充值详细情况进行查询，需要起始时间控件（精确到日），
     *  显示所选服务器所选时间段内的每一笔充值详情。 区服，订单号，用户账号，充值元宝，充值时间
     */
    public function query_charge_list_old() {
        $input = I('post.');
        if (!empty($input)) {
            $start_date = I('post.start_date');
            $end_date = I('post.end_date');
            $autoid = I('post.autoid');
            $characterid = I('post.characterid');
            $account = I('post.account');

            $where = array();
            /*if (!empty($sid)) {
                $where['sid'] = $sid;
            }*/

            if(!empty($characterid)){
                $where['characterid'] = $characterid;
            }
            if(!empty($account)){
                $where['ACCOUNT'] = $account;
            }
            if(!empty($start_date) && !empty($end_date)){
                $where['time'] = array('between',array($start_date,$end_date." 23:59:59"));
            }
            $day_data = new \Home\Model\PublicchargeModel();
            $rs = $day_data->where(array('channel' => 1,'serverid' => 2))->select();
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
            $this->assign('characterid', $characterid);
            $this->assign('account', $account);
            $this->assign('rs', $rs);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }
    
    public function top_10_charge() {
        $input = I('post.');
        if (!empty($input)) {
	    	$autoid = I('post.autoid');
            if($autoid != 1000000) {
                $serverid = $this->getsid($autoid);
                $sql = "select serverid,characterid,account, sum(rmb) as total from chargeemoney where serverid = $serverid group by serverid,characterid order by total desc limit 10 ";
            }else{
                $sql = "select serverid,characterid,account, sum(rmb) as total from chargeemoney group by serverid,characterid order by total desc limit 10 ";
            }
            $serverinfo = D('Serverinfo');
			$day_data = new \Home\Model\PublicchargeModel();
            $rs = $day_data->query($sql);
            foreach($rs as &$r){
                $server = $serverinfo->where(array('id' => $r['serverid']))->find();
                $character = new \Home\Model\GSCharacterModel($server['autoid']);
                $char = $character->where(array('characterid' => $r['characterid']))->find();
                $r['characterid'] = $char['name'];
            }
            $this->assign('rs', $rs);
        }
        vendor('Pager.Pager');
        $this->_server[1000000] = "全服数据";
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->assign('datas', $datas);
        $this->display();
    }
    
    public function charge_total() {
        $input = I('post.');
        if (1) {
            $start_date = I('post.start_date');
            $end_date = I('post.end_date');
            $where = " where 1=1";
             if(!empty($start_date) && !empty($end_date)){
                $where .= " and time >= '$start_date' and time <= '".$end_date." 23:59:59'";
             }else{
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
             }
            $sql = "select a.serverid, sum(a.rmb) as total_num,(select sum(c.rmb) from chargeemoney as c where left(time,10) = '".date("Y-m-d")."' and c.serverid = a.serverid) as today_num from chargeemoney as a $where group by serverid";
            $day_data = new \Home\Model\PublicchargeModel();
            $rs = $day_data->query($sql);

            $total = 0;
            $today = 0;
            foreach($rs as $r) {
                $total += $r['total_num'];
                $today += $r['today_num'];
            }
            $rstotal = array('serverid'=>'全','total_num' => $total, 'today_num'=>$today);
            $this->assign('start_date',$start_date);
            $this->assign('end_date',$end_date);
            $this->assign('rs', $rs);
            $this->assign('rstotal', $rstotal);
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
        }
        $this->display();
    }

    //付费段人数统计
    public function payblock(){
        $input = I('post.');
        if(1){
            if(empty($input)){
                $autoid = 25;
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
            }else{
                $autoid =  $input['autoid'];
                $start_date = $input['start_date'];
                $end_date = $input['end_date'];
            }
            $where = array();
            if(empty($autoid)){
                $this->error('请选择正确的区服');
            }else{
                $sid = $this->getsid($autoid);
            }
            if(empty($start_date) || empty($end_date)){
                $this->error('请输入正确的时间');
            }
            $charge = new \Home\Model\PublicchargeModel();
            //$SQL = "select sum(num) as total from (select characterid,count(1) as num from chargeemoney where serverid=$sid and time between '$start_date' and '$end_date 23:59:59' group by characterid having sum(rmb)>10) T";
            $SQL = "select count(num) as total from (select characterid,count(1) as num from chargeemoney where serverid=$sid and time between '$start_date' and '$end_date 23:59:59' group by characterid";
            $sql1 = $SQL . " having sum(rmb)>0 and sum(rmb)<=10) T";
            $sql2 = $SQL . " having sum(rmb)>10 and sum(rmb)<=50) T";
            $sql3 = $SQL . " having sum(rmb)>50 and sum(rmb)<=100) T";
            $sql4 = $SQL . " having sum(rmb)>100 and sum(rmb)<=500) T";
            $sql5 = $SQL . " having sum(rmb)>500 and sum(rmb)<=1000) T";
            $sql6 = $SQL . " having sum(rmb)>1000 and sum(rmb)<=2000) T";
            $sql7 = $SQL . " having sum(rmb)>2000 and sum(rmb)<=5000) T";
            $sql8 = $SQL . " having sum(rmb)>5000 and sum(rmb)<=10000) T";
            $sql9 = $SQL . " having sum(rmb)>10000 and sum(rmb)<=20000) T";
            $sql10 = $SQL . " having sum(rmb)>20000) T";
            $num1 = $charge->query($sql1);
            $num2 = $charge->query($sql2);
            $num3 = $charge->query($sql3);
            $num4 = $charge->query($sql4);
            $num5 = $charge->query($sql5);
            $num6 = $charge->query($sql6);
            $num7 = $charge->query($sql7);
            $num8 = $charge->query($sql8);
            $num9 = $charge->query($sql9);
            $num10 = $charge->query($sql10);
            //echo $charge->getLastSql();exit;
            $this->assign('num1',$num1['0']['total']);
            $this->assign('num2',$num2['0']['total']);
            $this->assign('num3',$num3['0']['total']);
            $this->assign('num4',$num4['0']['total']);
            $this->assign('num5',$num5['0']['total']);
            $this->assign('num6',$num6['0']['total']);
            $this->assign('num7',$num7['0']['total']);
            $this->assign('num8',$num8['0']['total']);
            $this->assign('num9',$num9['0']['total']);
            $this->assign('num10',$num10['0']['total']);
            $this->assign('start_date',$start_date);
            $this->assign('end_date',$end_date);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }
}
