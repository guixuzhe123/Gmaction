<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController{
    public function index(){
        if(cookie('gmuser')){
            $this->display();
        }else{
            $this->display('login');
        }
    }

    public function top(){
        $username = cookie('gmuser');
        $this->assign('username',$username);
        $this->display();
    }

    public function test(){
        $test = D('Test');
        $r = $test->find();
        $this->assign('url',U($r['url']));
        $this->display();
    }

    public function left(){
        $username = cookie('gmuser');
        $this->assign('username',$username);
        $this->display();
    }
}