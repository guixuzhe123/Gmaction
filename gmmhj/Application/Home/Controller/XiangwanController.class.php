<?php
namespace Home\Controller;
use Think\Controller;

class XiangwanController extends BaseController{
    public function index(){
        $input = I('post.');
        if(!empty($input)){
            $autoid = $input['autoid'];
            $resourceid = $input['resourceid'];
            $start_date = $input['start_date'];
            $end_date = $input['end_date'];
            $start_level = $input['start_level'];
            $end_level = $input['end_level'];
            $where = array();
            if(empty($autoid)){
                $this->error("请选择区服");
            }
            if($resourceid == 1){
                $where['account'] = array('LIKE',"3595mhj_%");
                $this->assign('resourceid',$resourceid);
            }
            if($resourceid == 2){
                $where['account'] = array('LIKE',"youzhai_%");
                $this->assign('resourceid',$resourceid);
            }
            if(!empty($start_date) && !empty($end_date)){
                $where['logintime'] = array('between', array($start_date, $end_date . " 23:59:59"));
                $this->assign('start_date',$start_date);
                $this->assign('end_date',$end_date);
            }
            if(!empty($start_level) && !empty($end_level)){
                $where['level'] = array('between', array($start_level, $end_level));
                $this->assign('start_level',$start_level);
                $this->assign('end_level',$end_level);
            }
            $character = new \Home\Model\GSCharacterModel($autoid);
            $rs = $character->where($where)->select();
            $this->assign('rs',$rs);
            //echo $character->getLastSql();exit;
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->assign('plats',$this->plats);
        $this->display();
    }

    //5.1活动
    public function huodong(){
        //echo  "success_jsonpCallback('222')";exit;
        $platcode = I('get.platcode');
        //echo  "success_jsonpCallback({$sid})";exit;
        $serverinfo = D('Serverinfo');
        $server = $serverinfo->where(array('platcode' => $platcode))->find();
        if(!empty($platcode)){
            //$sql = "select serverid,characterid,account, sum(rmb) as total from chargeemoney where serverid = {$sid} and time between '2015-05-01 00:00:00' and '2015-05-03 23:59:59' group by serverid,characterid order by total desc limit 10";
            $sql = "select serverid,characterid,account, sum(rmb) as total from chargeemoney where serverid = {$server['id']} and account like '3595mhj_%' group by serverid,characterid order by total desc limit 10";
            //echo  "success_jsonpCallback(" . json_encode($sql) . ")";exit;
            $charge = new \Home\Model\PublicchargeModel();
            $ret = $charge->query($sql);
            foreach($ret as &$r){
                //$character = new \Home\Model\GSCharacterModel($server['autoid']);
                //$char = $character->where(array('characterid' => $r['characterid']))->find();
                //$r['characterid'] = $char['name'];
                $r['account'] = str_replace("3595mhj_","",$r['account']);
            }
        }else{;
            $ret = array('msg' => 'empty sid');
        }
        header('Content-Type:application/json; charset=utf-8');
        echo  "success_jsonpCallback(" . json_encode($ret) . ")";
        exit;
    }
}
