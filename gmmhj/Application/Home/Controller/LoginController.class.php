<?php
namespace Home\Controller;
use Think\Controller;

class LoginController extends BaseController{
    public function index(){
        $this->login();
    }

    public function login(){
        if(I('post.username') == '' or I('post.password') == ''){
            $this->error('用户名或密码不能为空');
        }else{
            $name = I('post.username');
            $password = I('post.password');
            $account = D('Admin');
            $r = $account->where(array('username' => $name))->find();
            if($r){
                if($r['password'] == md5($password)){
                    cookie('gmuser',$name);
                    $this->log('登录后台系统',cookie('gmuser'));
                    $this->redirect('Index/index');
                }else{
                    $this->error('密码不正确！');
                }
            }else{
                $this->error('用户名不存在！');
            }
            /*if($account->login($name,$password)){
                cookie('fortuneuser',$name);
                $this->redirect('Index/index');
            }else{
                $this->error($account->error);
            }*/
        }
    }
}