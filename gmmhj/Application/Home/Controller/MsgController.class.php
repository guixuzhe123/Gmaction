<?php

namespace Home\Controller;

use Think\Controller;

/**
 * 公告处理
 */
class MsgController extends BaseController {

    /**
     * 发送一个循环公告
     */
    public function AddAnnounceLoop() {
		

		/*
		
		 $data = array(
			'sid' => 1,
			'content' => 'yang',
			'send_time' => time() + 60,
			//'end_time' => time() + 86400,
			//'interval' => 10,
		);

        $re = $this->send_msg('add_AnnounceRegular', $data);
		
		die();
		//*/
		
		$re = $this->send_msg('AnnounceLoopList', array());
		echo '<pre>';
		print_r($re);
		
		$re = $this->send_msg('AnnounceRegularList', array());
		echo '<pre>';
		print_r($re);
		die();
		
		
	
        $input = I('post.');
        if (!empty($input)) {
            $send_time = I('post.send_time'); //开始时间
            $end_time = I('post.end_time'); //结束时间
            $interval = I('post.interval'); //播放间隔
            $sid = I('post.sid');
            $content = I('post.content');
			
            //--todo
            //判断长度
            $data = array(
                'sid' => $sid,
                'content' => $content,
                'send_time' => $send_time,
                'end_time' => $end_time,
                'interval' => $interval,
            );

            $re = $this->send_msg('add_AnnounceLoop', $data);
            $this->assign('ret', 0);
            if ($re['ret'] == 1) {
                $msg = D('msg');
                $arr = array(
                    'role' => $_SESSION['role'],
                    'type' => 'add_AnnounceLoop',
                    'content' => json_encode($data),
                );
                $msg->data($arr)->add();
                $this->assign('ret', 1);
            }
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('sid', 'sid', $this->_server, $sid));
        $this->display();
    }

    /**
     * 发送一个定时公告
     */
    public function AddAnnounceRegular() {
        $input = I('post.');
        if (!empty($input)) {
            $send_time = I('post.send_time'); //开始时间
            $sid = I('post.sid');
            $content = I('post.content');

            //--todo
            //判断长度
            $data = array(
                'sid' => $sid,
                'content' => $content,
                'send_time' => $send_time,
            );

            $re = $this->send_msg('add_AnnounceRegular', $data);
            $this->assign('ret', 0);
            if ($re['ret'] == 1) {
                $msg = D('msg');
                $arr = array(
                    'role' => $_SESSION['role'],
                    'type' => 'add_AnnounceRegular',
                    'content' => json_encode($data),
                );
                $msg->data($arr)->add();
                $this->assign('ret', 1);
            }
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('sid', 'sid', $this->_server, $sid));
        $this->display();
    }
    
    /**
     * 发送一个及时公告
     */
    public function AddAnnounceInstant() {
        $input = I('post.');
        if (!empty($input)) {
            $sid = empty(I('post.sid')) ? 0 : I('post.sid');
            $content = I('post.content');

            //--todo
            //判断长度
            $data = array(
                'sid' => $sid,
                'content' => $content,
            );

            $re = $this->send_msg('add_AnnounceInstant', $data);
            $this->assign('ret', 0);
            if ($re['ret'] == 1) {
                $msg = D('msg');
                $arr = array(
                    'role' => $_SESSION['role'],
                    'type' => 'add_AnnounceInstant',
                    'content' => json_encode($data),
                );
                $msg->data($arr)->add();
                $this->assign('ret', 1);
            }
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('sid', 'sid', $this->_server, $sid));
        $this->display();
    }

    

}
