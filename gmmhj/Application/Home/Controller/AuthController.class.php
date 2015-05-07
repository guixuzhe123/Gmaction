<?php
namespace Home\Controller;
use Think\Controller;
class AuthController extends BaseController{
	public function index(){
		$admin = D('Admin');
		$user = $admin->select();
		$block = D('Block');
		$listone = $block->where(array('blockrank' => 1))->select();
		foreach($listone as &$arr){
			$arr['listtwo'] = $block->where(array('parentblock' => $arr['blocktitle']))->select();
		}
		foreach($user as &$arr){
			$blockid4 = array();
			if($arr['blockid'] != 0 && $arr['blockid'] != 999){
				$blockid1 = $arr['blockid'];
				$blockid2 = explode(',',$blockid1);
				foreach($blockid2 as $arr2){
					$blockid3 = $block->where("blocktitle=$arr2 AND blockrank=2")->find();
					if($blockid3){
						$blockid4[] = $blockid3['blockname'];
					}
				}
				$arr['blockid'] = implode(',',$blockid4);
			}
		}
		$this->assign('list',$listone);
		$this->assign('user',$user);
		$this->assign('loginuser',cookie('gmuser'));
		$this->display();
	}

	public function checkusername(){
		$admin = D('Admin');
		$username = I('post.username');
		if($admin->where(array('username' => $username))->find()){
			echo 1;
		}else{
			echo 0;
		}
	}

	public function adduser(){
		$admin = D('Admin');
		$data = I('post.');
		$data['password'] = md5($data['password']);
		$data['id'] = null;
		if($admin->data($data)->add()){
			$this->log('添加用户' . $data['username'],cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}

	//加载当前用户权限信息
	public function authinfo(){
		$admin = D('Admin');
		$username = cookie('gmuser');
		$r = $admin->where(array('username' => $username))->find();
		$block = $r['blockid'];
		$blocklist = explode(',', $block);
		if(count($blocklist) == 1){
			$data['len'] = 1;
			$data['list'] = $r['blockid'];
			echo json_encode($data);
		}else{
			$data['len'] = 2;
			$data['list'] = $blocklist;
			echo json_encode($data);
		}
	}

	//分配权限
	public function authdis(){
		$username = I('post.username');
		$str = I('post.str');
		$strarr = explode(',', $str);
		foreach($strarr as $arr1){
			$strarr[] = substr($arr1,0,3);
		}
		$strarr1 = array_unique($strarr);
		$blockid = implode(',',$strarr1);
		$data['blockid'] = $blockid;
		$admin = D('Admin');
		if($admin->where(array('username' => $username))->save($data)){
			$this->log('给用户' . $username . '全新分配可操作模块',cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}
	//删除用户
	public function deluser(){
		$id = I('post.id');
		$admin = D('Admin');
		if($admin->where(array('id' => $id))->delete()){
			$this->log('删除id为' . $id . '的用户',cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}
	//模块管理
	public function blockmange(){
		$block = D('Block');
		$blockparent = $block->where(array('blockrank' => 1))->select();
		foreach($blockparent as &$arr){
			$blockson = $block->where(array('parentblock' => $arr['blocktitle']))->select();
			$arr['son'] = $blockson;
		}
		$this->assign('blockall',$blockparent);
		$this->display();
	}
	//添加模块
	public function addblock(){
		$block = D('Block');
		$rank = I('post.rank');
		$blocktitle = I('post.blocktitle');
		$blockname = I('post.blockname');
		$data['id'] = null;
		$data['blocktitle'] = $blocktitle;
		$data['blockname'] = $blockname;
		$data['blockrank'] = $rank;
		if($rank == 1){
			$data['parentblock'] = 0;
		}
		if($rank == 2){
			$data['parentblock'] = I('post.parentblock');
		}
		if($block->data($data)->add()){
			if($rank == 1){
				$this->log('添加一级模块' . $blockname,cookie('gmuser'));
			}else{
				$this->log('添加二级模块' . $blockname,cookie('gmuser'));
			}
			echo 1;
		}else{
			echo 0;
		}
	}
	//删除模块
	public function delblock(){
		$id = I('post.id');
		$block = D('Block');
		if($block->where(array('id' => $id))->delete()){
			$this->log('删除id为' . $id . '的模块',cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}
	//修改密码
	public function modifypwd(){
		$username = cookie('gmuser');
		$this->assign('username',$username);
		$this->display();
	}
	//验证旧密码，更新新密码
	public function pwd(){
		$oldpwd = I('post.oldpwd');
		$newpwd = I('post.newpwd');
		$username = I('post.username');
		$admin = D('Admin');
		$r = $admin->where(array('username' => $username))->find();
		if($r){
			if($r['password'] == md5($oldpwd)){
				$data['password'] = md5($newpwd);
				if($admin->where(array('username' => $username))->save($data)){
					$this->log('修改密码',cookie('gmuser'));
					echo 3;//修改成功
				}else{
					echo 2;//修改失败
				}
			}else{
				echo 1;//原始密码输入错误
			}
		}else{
			echo 0;//用户不存在
		}
	}
}