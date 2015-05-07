<?php
namespace Home\Controller;
use Think\Controller;

class LogoutController extends BaseController{
    public function index(){
    	$this->log('退出后台系统',cookie('gmuser'));
        cookie('gmuser',null);
        $this->redirect('Index/index');
    }
}