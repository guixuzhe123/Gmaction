<?php

namespace Home\Controller;

use Think\Controller;

//用户信息查询

class UserinfoController extends BaseController{
	public function index(){
        $input = I('post.');
        if(empty($input)){
            $autoid = $this->getfirstautoid();
            $start_date = date('Y-m-d');
            $end_date = date('Y-m-d');
        }else{
            $autoid = $input['autoid'];
            $start_date = $input['start_date'];
            $end_date = $input['end_date'];
        }
        $where['logintime'] = array('between',array($start_date,$end_date." 23:59:59"));
        $character = new \Home\Model\GSCharacterModel($autoid);
        $users = $character->where($where)->select();
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->assign('start_date',$start_date);
        $this->assign('end_date',$end_date);
        $this->assign('rs',$users);
        $this->display();
	}
}
