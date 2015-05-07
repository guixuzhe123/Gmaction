<?php

namespace Home\Controller;

use Think\Controller;

class OnlineController extends BaseController {

    /**
     *  时实在线查询：
     *  查询勾选服务器的当前在线人数，勾选多个服务器则按区服分别显示各个服务器的即时在线人数数据                             
     */
    public function online() {
        $input = I('post.');
        if (!empty($input)) {
			if($input['autoid'] == 0){
				$autoids = array();//用于保存服务器id的数组
				foreach($this->_server as $key => $value){
					$autoids[] = $key;
                }
                $datas = array();
                $allnum = 0;
                //$sock = socket_create(AF_INET,SOCK_STREAM,SOL_TCP);
                //socket_set_option($sock,SOL_SOCKET,SO_RCVTIMEO,array("sec"=>60,"usec"=>0));
                //socket_set_option($sock,SOL_SOCKET,SO_SNDTIMEO,array("sec"=>60,"usec"=>0));
                //if($sock === false){
                //    die('无法使用socket连接！');
                //}
                foreach($autoids as $single){
                    $data['serverid'] = $this->getsid($single);
                    $num = $this->send_msg('OnlineNumber',$data,$single);
                    $datas1['sid'] = $data['serverid'];
                    $datas1['num'] = $num['usOnlineNumber'];
                    $allnum += $datas1['num'];
                    $datas[] = $datas1;
                //    $socket = array();
                //    $socket = $this->getsocket($single);
                //    if(socket_connect($sock,$socket['socketip'],$socket['socketport']) == false){
                //        die($this->getsid($single) . "无法创建socket连接" . $socket['socketip'] . ":" . $socket['socketport']);
                //    }
                //    $datas1 = array();
                //    $sid = $this->getsid($single);
                //    $msg = pack("NN",$this->socketinter['OnlineNumber'],$sid);
                //    $len = 4 + strlen($msg);
                //    $msg = pack("N",$len) . $msg;
                //    $check = 3;
                //    if(socket_write($sock,$msg,strlen($msg)) === false){
                //        die($sid . "无法写入数据！");
                //    }                 
                //    $out = socket_read($sock,1024);
                //    $re = unpack("Nlen/Ntype/Nsid/namount",$out);
                //    sleep(1);
				//	$datas1['sid'] = $sid;
                //    $datas1['num'] = $re['amount'];
                //    $allnum += $re['amount'];
				//	$datas[] = $datas1;
                }
                array_unshift($datas,array('sid'=>'全服','num'=>$allnum));
                //socket_close($sock);
			}else{
				$autoid = I('post.autoid');
				$data['serverid'] = $this->getsid($autoid);
				$datas1['sid'] = $this->getsid($autoid);
				$num = $this->send_msg('OnlineNumber',$data,$autoid);
				$datas1['num'] = $num['usOnlineNumber'];
				$datas[] = $datas1;
			}
        }else{
			//$autoids = array();//用于保存服务器id的数组
			//foreach($this->_server as $key => $value){
			//	$autoids[] = $key;
			//}
			//foreach($autoids as $single){
			//	$data['serverid'] = $this->getsid($single);
			//	$num = $this->send_msg('OnlineNumber',$data,$single);
			//	$datas['sid'] = $single;
			//	$datas['num'] = $num['usOnlineNumber'];
			//}
		}
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->assign('datas', $datas);
        $this->display();
    }

    //online接口，通过传入platcode参数进行实时在线人数的读取
    public function onlineinterface()
    {
        $platcode = I('post.platcode');
        if(empty($platcode))
        {
            $ret['result'] = 0;
        }else
        {
            $serverinfo = D('Serverinfo');
            $server = $serverinfo->where(array('platcode' => $platcode))->find();
            if($server)
            {
                $data['serverid'] = $server['id'];
                $num = $this->send_msg('OnlineNumber',$data,$server['autoid']);
                if($num)
                {
                    $ret['number'] = $num['usOnlineNumber'];
                    $ret['platcode'] = $platcode;
                    $ret['result'] = 1;
                }else
                {
                    $ret['result'] = -1;
                }
            }else
            {
                $ret['result'] = -2;
            }
        }
        echo json_encode($ret);
    }

    /**
     * 日均在线
     *  对勾选服务器的日均在线情况进行查询，需要起始时间控件（精确到日），时间跨度最多为7天。显示对应服务器对应日期的每日的日均在线人数。                                              
     */
    public function day_total_online() {
        $input = I('post.');
        if (!empty($input)) {
            $start_date = I('post.start_date');
            $end_date = I('post.end_date');
            $sid = I('post.sid');

            //---where
            $where = array();
            if (!empty($sid)) {
                $where['sid'] = $sid;
            }
            if(!empty($start_date) && !empty($end_date)){
                $where['date'] = array('between',array($start_date,$end_date." 23:59:59"));
            }
                        
            //--query
            $day_data = D('Online');
            $datas = $day_data->where($where)->order('date desc')->select();
            
            
            //assign
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
            $this->assign('datas', $datas);
        }

        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('sid', 'sid', $this->_server, $sid));
        $this->display();
    }

    public function avg_online() {}

    /**
     *  历史在线:
     *   对勾选服务器的历史在线情况进行查询，需要起始时间控件（精确到日），可以选择统计表和曲线图两种显示方式。显示查询时间段内每小时的在线情况。（其中每日峰值的显示与其他数据区分。）
     */
    public function history_online() {
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $date = date('Y-m-d');
            }else{
                $date = I('post.date');
            }
            $sid = I('post.sid');

            $where = array();
            if (!empty($sid)) {
                $where['sid'] = $sid;
            }
            $where['date'] = $date;
            
            $hour_data = D('Online');
            $datas = $hour_data->where($where)->order('date desc')->select();
            $temparr = array();
            $temparr['sid'] = '全服';
            $temparr['date'] = $date;
            foreach($datas as &$r){
                $r['sid'] = $this->getsid($r['sid']) . '服';
                $temparr['h0'] += $r['h0'];
                $temparr['h1'] += $r['h1'];
                $temparr['h2'] += $r['h2'];
                $temparr['h3'] += $r['h3'];
                $temparr['h4'] += $r['h4'];
                $temparr['h5'] += $r['h5'];
                $temparr['h6'] += $r['h6'];
                $temparr['h7'] += $r['h7'];
                $temparr['h8'] += $r['h8'];
                $temparr['h9'] += $r['h9'];
                $temparr['h10'] += $r['h10'];
                $temparr['h11'] += $r['h11'];
                $temparr['h12'] += $r['h12'];
                $temparr['h13'] += $r['h13'];
                $temparr['h14'] += $r['h14'];
                $temparr['h15'] += $r['h15'];
                $temparr['h16'] += $r['h16'];
                $temparr['h17'] += $r['h17'];
                $temparr['h18'] += $r['h18'];
                $temparr['h19'] += $r['h19'];
                $temparr['h20'] += $r['h20'];
                $temparr['h21'] += $r['h21'];
                $temparr['h22'] += $r['h22'];
                $temparr['h23'] += $r['h23'];
            }
            array_unshift($datas,$temparr);
            $this->assign('date', $date);
            $this->assign('datas', $datas);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('sid', 'sid', $this->_server, $sid));
        $this->display();
    }

}
