<?php
namespace Home\Controller;
use Think\Controller;

class TopcombatController extends BaseController{
    public function index(){
        $input = I('post.');
        if(empty($input['autoid'])){
            $autoid =$this->getfirstautoid();
        }else{
            $autoid = $input['autoid'];
        }
        $this->assign('datas',$this->getdata($autoid));
        $this->assign('sid',$this->getsid($autoid));
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }

    public function getdata($autoid){
        $character  = new \Home\Model\GSCharacterModel($autoid);
        $list = $character->query("SELECT account,name,combat,level FROM `character` ORDER BY combat DESC LIMIT 10");
        return $list;
    }


    public function face(){
        $input = I('post.');
        if(empty($input['sid'])){
            echo "0";exit;
        }
        $sid = $input['sid'];
        $ret['sid'] = $sid;
        $serverinfo = D('Serverinfo');
        $rs = $serverinfo->where("id=$sid")->find();
        $autoid = $rs['autoid'];
        $ret['data'] = $this->getdata($autoid);
        echo json_encode($ret);
    }

}
