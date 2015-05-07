<?php

namespace Home\Controller;

use Think\Controller;

class AnnounceController extends BaseController {

    /**
     *  即时公告 
     */
    public function instant(){
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
        $this->display();
    }
    /**
    *发布即时公告
    */
    public function addinstant(){
        $input = I('post.');
        if (!empty($input)) {
            $content = I('post.content');
            if(I('post.autoid') == 0){
                foreach($this->_server as $k => $v){
                    $sids[] = $k;
                }
                foreach($sids as $sid){
                    $data = array(
                        'sid'       => $this->getsid($sid),
                        'content'   => $content
                    );
                    $this->send_msg('add_AnnounceInstant',$sid);
                }
                $this->log('所有服发布即时公告',cookie('gmuser'));
                echo 0;
            }else{
                $sid = I('post.autoid');
                $content = I('post.content');
                $data = array(
                    'sid' => $this->getsid($sid),
                    'content' => $content,
                );
                $ret = $this->send_msg('add_AnnounceInstant', $data,$sid);
                $this->log($this->getsername($sid) . '服发布即时公告',cookie('gmuser'));
                echo $ret['ret'];
            }
            //echo $ret['ret'];
        }
    }
    /**
    *循环公告
    */
    public function loop(){
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
        $this->display();
    }

    /**
    *添加循环公告
    */
    public function addloop(){
        $data = I('post.');
        $data['sid'] = $this->getsid($data['autoid']);
        //print_r($data);exit;
        $ret = $this->send_msg('add_AnnounceLoop',$data,$data['autoid']);
        $this->log($this->getsername($data['autoid']) . '发布循环公告',cookie('gmuser'));
        echo $ret['ret'];
    }

    /**
    *定时公告
    */
    public function regular(){
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
        $this->display();
    }

    /**
    *添加定时公告
    */
    public function addregular(){
        $data = I('post.');
        $data['sid'] = $this->getsid($data['autoid']);
        $ret = $this->send_msg('add_AnnounceRegular',$data,$data['autoid']);
        $this->log($this->getsername($data['autoid']) . '服发布定时公告',cookie('gmuser'));
        echo $ret['ret'];
    }

    //选择服务器进行公告列表查看
    public function preannlist(){
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
        $this->display();
    }
    /**
    *公告列表
    */
    public function annlist(){
        $loop = $this->getlooplist(I('post.formautoid'));
        //var_dump($loop);exit;
        $regular = $this->send_msg('AnnounceRegularList',"",I('post.formautoid'));
        $regular_list = $regular['announce'];
        foreach($regular_list as &$arr){
            $hour = floor($arr['send_time'] / 3600);
            $minute = floor(($arr['send_time'] % 3600) / 60);
            $hour = $hour < 10 ? "0" . $hour : $hour;
            $minute = $minute < 10 ? "0" . $minute : $minute;
            $arr['send_time'] = $hour . ":" . $minute;
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, I('post.formautoid'))); 
        $this->assign('loop',$loop['announce']);
        $this->assign('regular',$regular_list);
        $this->display();
    }

    /**
    *删除循环公告
    */
    public function delloop(){
        $data = I('post.');
        /*print_r($data);exit;*/
        $ret = $this->send_msg('del_AnnounceLoop',$data,$data['autoid']);
        $this->log($this->getsername($data['autoid']) . '服删除循环公告',cookie('gmuser'));
        echo $ret['ret'];
    }

    /**
    *删除定时公告
    */
    public function delregular(){
        $data = I('post.');
        $ret = $this->send_msg('del_AnnounceRegular',$data,$data['autoid']);
        $this->log($this->getsername($data['autoid']) . '服删除定时公告',cookie('gmuser'));
        echo $ret['ret'];
    }
    
    public function test() {
        $regular = $this->send_msg('AnnounceRegularList',"");
        print_r($regular['announce']);
    }
	
	//获取循环公告列表单独出来
	public function getlooplist($autoid){
		$type = 2573;
		$msg = pack("N",$type);
		$len = 4 + strlen($msg);
		$msg = pack("N",$len) . $msg;
		$socketinfo = $this->getsocket($autoid);
		$address = $socketinfo['socketip'];
        $port = $socketinfo['socketport'];
        
        
        //创建端口
		$sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
        socket_set_option($sock, SOL_SOCKET, SO_RCVTIMEO, array("sec"=>2,"usec"=>0));//发送超时2秒
        socket_set_option($sock, SOL_SOCKET, SO_SNDTIMEO, array("sec"=>4,"usec"=>0));//接收超时4秒
		if($sock === false){
			die('无法使用socket连接!');
		}
        if(socket_connect($sock, $address, $port) == false){
			//echo($address.$port);
            die('无法创建socket连接!');
		}


		
		if (socket_write($sock, $msg, strlen($msg)) === false)
		{
			echo "socket_write failed";
			echo "socket_write() failed: reason: " . socket_strerror(socket_last_error()) ."/n";
			die("无法写入数据！");
		}

        /*while($buffer = socket_read($sock, 1024)){  
            //printf("Data sent was: SOME DATA Response was:" . $buffer . "");  
            $out .= $buffer;
        } */

        $out = socket_read($sock, 4096);
        
		$re = array();
		$temp = array();
		$temp = unpack("Nlen/Ntype/namount", $out);
		if($temp['amount'] > 0){
			$looptime = ceil($temp['amount'] / 10) - 1;
			//echo $looptime;exit;
			for($i = 1;$i <= $looptime;$i++){
				$out .= socket_read($sock,4096);
			}
		}
		$re = unpack("Nlen/Ntype/namount", $out);
        $out = substr($out, 10);
		if($re['amount'] > 0){
			for($i = 0; $i < $re['amount']; $i++) {
				$tmp = unpack("NidGameServer/NidAnnounce/ncontent_len", $out);
				$out = substr($out, 10);
				$len = $tmp['content_len'];
				$cc = unpack("a{$len}content", $out);
				$tmp['szContent'] = $cc['content'];
				$out = substr($out, $len);
				$bb = unpack("Na/Nsend_time/Nb/Nend_time/Nc/Ninterval", $out);
				$tmp = array_merge($tmp, $bb);
				$out = substr($out, 24);
				$re['announce'][] = $tmp;
			}
		}
		socket_close($sock);
		return $re;
	}

}
