<?php

namespace Home\Controller;

use Think\Controller;

/*
 * 需要读取一些共同列表，如区服列表，可通过继续此类
 */

class BaseController extends Controller {
    /*
     * @type array
     *  区服列表
     */

    protected $_server = array();
    protected $_server_list = array();

    protected $plats = array(); //平台信息
    protected $socketinter = array();//接口代码

    public function __construct() {
        parent::__construct();
        $serverinfo = D('Serverinfo');
        $server_list = $serverinfo->select();
        $datas = array();
        foreach ($server_list as $s) {
            $datas[$s['autoid']] = array('name' => $s['name'],'sid' => $s['id']);
        }
        $this->plats = array(
            array(
                'resource'  =>  1,
                'platname'  =>  '3595平台'
            ),
            array(
                'resource'  =>  2,
                'platname'  =>  '优宅平台'
            )
        );
        $this->_server_list = $server_list;
        $this->_server = $datas;
        $this->socketinter = array(
            'AnnounceLoopList'		=>	2573, //取循环公告列表
            'AnnounceRegularList'	=>	2574, //取定时公告列表
            'add_AnnounceLoop'		=>	2521, //发布循环公告
            'add_AnnounceRegular'	=>	2522, //发布定时公告
            'add_AnnounceInstant'	=>	2523, //发布及时公告
            'del_AnnounceLoop'		=>	2525, //删除循环公告
            'del_AnnounceRegular'	=>	2527, //删除定时公告
            'KillUser'				=>	2529, //踢人下线
            'SilenceUser'			=>	2533, //禁言
            'GMMail'				=>	2539, //发送email
            'GMMail1'				=>	2539, //发送email
            'LockAccount'			=>	2581, //锁定账号
            'UnlockAccount'			=>	2583, //解锁账号
            'ReturnCity'			=>	2541, //强制回城
            'Recharge'				=>	8546, //GM充值
            'PlatCash'				=>	5006, //平台充值
			'OnlineNumber'			=>	2513, //实时查询在线人数
			'LockIP'				=>	2585, //封IP
			'UnLockIP'				=>	2587, //解封IP
			'LockIPList'			=>	8531  //IP封禁列表
        );
        //$this->assign('servers', $this->_server);
    }

    /**
     * 发送socket消息
     * @param type $action 操作类型
     * @param type $data 数据列表
     */
    protected function send_msg($action, $data,$autoid) {
        $arr = array(
            'AnnounceLoopList'		=>	2573, //取循环公告列表
            'AnnounceRegularList'	=>	2574, //取定时公告列表
            'add_AnnounceLoop'		=>	2521, //发布循环公告
            'add_AnnounceRegular'	=>	2522, //发布定时公告
            'add_AnnounceInstant'	=>	2523, //发布及时公告
            'del_AnnounceLoop'		=>	2525, //删除循环公告
            'del_AnnounceRegular'	=>	2527, //删除定时公告
            'KillUser'				=>	2529, //踢人下线
            'SilenceUser'			=>	2533, //禁言
            'GMMail'				=>	2539, //发送email
            'GMMail1'				=>	2539, //发送email
            'LockAccount'			=>	2581, //锁定账号
            'UnlockAccount'			=>	2583, //解锁账号
            'ReturnCity'			=>	2541, //强制回城
            'Recharge'				=>	8546, //GM充值
            'PlatCash'				=>	5006, //平台充值
			'OnlineNumber'			=>	2513, //实时查询在线人数
			'LockIP'				=>	2585, //封IP
			'UnLockIP'				=>	2587, //解封IP
			'LockIPList'			=>	8531  //IP封禁列表
        );
        if ($action == 'AnnounceLoopList') {
            $msg = pack("N", $arr[$action]);
        } elseif ($action == 'AnnounceRegularList') {
            $msg = pack("N", $arr[$action]);
        } elseif ($action == 'add_AnnounceLoop') {
            $len = strlen($data['content']);
			$format = sprintf("N2na%dN6",$len);
            $msg = pack($format, $arr[$action], $data['sid'], $len, $data['content'], 0, $data['send_time'], 0, $data['end_time'], 0, $data['interval']);
        } elseif ($action == 'add_AnnounceRegular') {
            $len = strlen($data['content']);
			$format = sprintf("N2na%dNN",$len);
            $msg = pack($format, $arr[$action], $data['sid'], $len, $data['content'], 0, $data['send_time']);
        } elseif ($action == 'add_AnnounceInstant') {
            $len = strlen($data['content']);
            $msg = pack("NNna{$len}", $arr[$action], $data['sid'], $len, $data['content']);
        } elseif ($action == 'del_AnnounceLoop') {
            $msg = pack("NNN", $arr[$action], $data['sid'], $data['msgid']);
        } elseif ($action == 'del_AnnounceRegular') {
            $msg = pack("NNN", $arr[$action], $data['sid'], $data['msgid']);
        } elseif ($action == 'KillUser') {
            $msg = pack("NNN", $arr[$action], $data['sid'], $data['characterid']);
        } elseif ($action == 'SilenceUser') {
            $len = strlen($data['name']);
            $msg = pack("NNna{$len}c", $arr[$action], $data['sid'],$len, $data['name'], $data['silence']);
        } elseif ($action == 'GMMail') {
            $character_num = $data['character_num'];
            $msg = pack("NNn",$arr[$action], $data['sid'],$character_num);
			//var_dump($msg);
            if($character_num > 0){
                $characters = explode(',', $data['characterids']);
                foreach($characters as $cid) {
                    $msg .= pack("N",$cid);
                }
            }
			//var_dump($msg);
			$len = strlen($data['content']);
			//var_dump($len);
			$msg .= pack("NNna{$len}n",$data['money'],$data['emoney'],$len,$data['content'],1);
			//添加邮件附件，0物品，1装备
			$msg .= pack("nNNc",0,$data['itemid'],$data['num'],$data['isbind']);
			//var_dump($msg);
        }elseif($action == 'GMMail1'){
            $character_num = $data['character_num'];
            $msg = pack("NNn",$arr[$action], $data['sid'],$character_num);
			//var_dump($msg);
            if($character_num > 0){
                $characters = explode(',', $data['characterids']);
                foreach($characters as $cid) {
                    $msg .= pack("N",$cid);
                }
            }
			//var_dump($msg);
			$len = strlen($data['content']);
			//var_dump($len);
            $mailthingnum = count($data['mailthing']);
            $msg .= pack("NNna{$len}n",$data['money'],$data['emoney'],$len,$data['content'],$mailthingnum);
            foreach($data['mailthing'] as $arr){
                //添加邮件附件，0物品，1装备
                $msg .= pack("nNNc",0,$arr['itemid'],$arr['num'],$arr['isbind']);
            }
			//var_dump($msg);
        }elseif($action == 'LockAccount'){
            $len = strlen($data['account']);
            $msg = pack("NNna{$len}",$arr[$action],$data['sid'],$len,$data['account']);
        }elseif($action == 'UnlockAccount'){
            $len = strlen($data['account']);
            $msg = pack("NNna{$len}",$arr[$action],$data['sid'],$len,$data['account']);
        }elseif($action == 'ReturnCity'){
            $msg = pack("NNnNN",$arr[$action],$data['sid'],1,$data['characterid'],6002) . $this->floatToBigEndian(53) . $this->floatToBigEndian(139);
        }elseif($action == 'Recharge'){
            $msg = pack("NNNN",$arr[$action],$data['sid'],$data['characterid'],$data['money']);
        }elseif($action == 'PlatCash'){
            $accountlen = strlen($data['m_account']);
            $orderlen = strlen($data['m_billno']);
            $ip = $data['ip'];
            $iplen = strlen($ip);
            $msg = pack("NNNNNNNNna{$iplen}na{$accountlen}na{$orderlen}",$arr[$action],$data['serverid'],$data['CharacterID'],0,$data['m_chargetime'],$data['m_emoney'],$data['extra_money'],$data['source'],$iplen,$ip,$accountlen,$data['m_account'],$orderlen,$data['m_billno']);
        }elseif($action == 'OnlineNumber'){
			$msg = pack("NN",$arr[$action],$data['serverid']);
		}elseif($action == 'LockIP'){
			$len = strlen($data['ip']);
			$msg = pack("NNna{$len}",$arr[$action],$data['sid'],$len,$data['ip']);
		}elseif($action == 'UnLockIP'){
            $len = strlen($data['ip']);
            $msg = pack("NNna{$len}",$arr[$action],$data['sid'],$len,$data['ip']);
		}elseif($action == 'LockIPList'){
			$msg = pack("NN",$arr[$action],$data['sid']);
		}
        
		$len = 4 + strlen($msg);
		$msg = pack("N",$len).$msg;	
		//var_dump($msg);
		//exit;
        //echo strlen($msg);exit;
        switch($action){
            case 'PlatCash':
                $out = $this->send_socket($msg,$autoid,2);
                break;
            default:
                $out = $this->send_socket($msg,$autoid);
                break;
        }
        $re = array();
        switch ($action) {
            case 'AnnounceLoopList':
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
				return $re;
                break;
			case 'AnnounceRegularList':
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
                        $bb = unpack("Na/Nsend_time", $out);
                        $tmp = array_merge($tmp, $bb);
                        $out = substr($out, 8);
                        $re['announce'][] = $tmp;
                    }
                }
				return $re;
                break;
            case 'add_AnnounceLoop':
            case 'add_AnnounceRegular':
            case 'add_AnnounceInstant':
            case 'LockAccount':    
            case 'UnlockAccount':    
            case 'ReturnCity':   
            case 'Recharge': 
            case 'GMMail':
			case 'LockIP':
                $re = array('ret' => 0);
                return $re;
            case 'del_AnnounceLoop':
            case 'del_AnnounceRegular':
            case 'del_AnnounceRegular':    
            case 'KillUser':
            case 'SilenceUser':    
                $re = unpack("Nlen/Ntype/Nsid/Nret", $out);
                return $re;
            case 'PlatCash':
                $re = unpack("Nlen/Ntype/ncode/Ncharacterid",$out);
                return $re;
			case 'OnlineNumber':
				$re = unpack("Nlen/Ntype/NidGameServer/nusOnlineNumber",$out);
				return $re;
			case 'LockIPList':
				$re = unpack("Nlen/Ntype/Nsid/namount",$out);
                //print_r($re);exit;
                //echo strlen($re['sid']);exit;
                $out = substr($out,14);
                if($re['amount'] > 0){
                    for($i = 0;$i < $re['amount'];$i++){
                        $tmp = unpack("nip_len",$out);
                        $out = substr($out,2);
                        $len = $tmp['ip_len'];
                        $cc = unpack("a{$len}szLockIP",$out);
                        $tmp['szLockIP'] = $cc['szLockIP'];
                        $out = substr($out,$len);
                        $re['ips'][] = $tmp;
                    }
                }
				return $re;
            default:
                break;
        }
    }

    protected function send_socket($msg,$autoid,$sockettype=1) {
        //sockettype,默认值1，代表GM操作接口，2为CASH操作接口
		/*$address = C('SOCKET_IP');
        $port = C('SOCKET_PORT');*/
        if($sockettype == 1){
            $socketinfo = $this->getsocket($autoid);
        }elseif($sockettype == 2){
            $socketinfo = $this->getcash($autoid);
        }
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
        socket_close($sock);
        return $out;
    }

    function floatToBigEndian($float_num) 
    {
        $result = pack ('f', $float_num);
        return strrev($result);
    }

    //根据atuoid获取服务器id
    public function getsid($autoid){
        $serverinfo = D('Serverinfo');
        $re = $serverinfo->where(array('autoid' => $autoid))->find();
        return $re['id'];
    }
    //根据atuoid获取服务器名字
    public function getsername($autoid){
        $serverinfo = D('Serverinfo');
        $re = $serverinfo->where(array('autoid' => $autoid))->find();
        return $re['name'];
    }
    //根据autoid获取socket信息
    public function getsocket($autoid){
        $serverinfo = D('Serverinfo');
        $re = $serverinfo->where(array('autoid' => $autoid))->find();
        $socket['socketip'] = $re['socketip'];
        $socket['socketport'] = $re['socketport'];
        return $socket;
    } 
    //根据autoid获取cash连接信息
    public function getcash($autoid){
        $serverinfo = D('Serverinfo');
        $re = $serverinfo->where(array('autoid' => $autoid))->find();
        $socket['socketip'] = $re['caship'];
        $socket['socketport'] = $re['cashport'];
        return $socket;
    } 

    //操作日志
    public function log($msg,$author){
        //return 1;
        $log = D('Log');
        $data['id'] = null;
        $data['operator'] = $author;
        $data['content'] = $msg;
        $data['ip'] = get_client_ip();
        $data['time'] = time();
        $log->data($data)->add();
        return true;
    }
    //根据id获取管理员用户名
    public function getadminusername($id){
        $admin = D('Admin');
        $re = $admin->where(array('id' => $id))->find();
        return $re['username'];
    }
    //根据管理员名字获取id
    public function getadminid($username){
        $admin = D('Admin');
        $re = $admin->where(array('username' => $username))->find();
        return $re['id'];
    }

    //获取道具键值对
    public function getprop(){
        //F('props',null);
        $temp = F('props');
        if(!$temp){
            $xml = simplexml_load_file('./Public/Xml/item.xml');
            $str = array();
            for($i = 0;$i < count($xml->item);$i++){
                $str[$i]['propid'] = (int)($xml->item[$i]->attributes()->id);
                $str[$i]['propname'] = (string)($xml->item[$i]->attributes()->name);
            }
            F('props',$str);
            $temp = F('props');
        }
        return $temp;
    }
    //获取道具键值对
    public function getprop1(){
        //F('props',null);
        $temp = F('props1');
        if(!$temp){
            $xml = simplexml_load_file('./Public/Xml/item.xml');
            $str = array();
            for($i = 0;$i < count($xml->item);$i++){
                //$str[$i]['propid'] = (int)($xml->item[$i]->attributes()->id);
                //$str[$i]['propname'] = (string)($xml->item[$i]->attributes()->name);
                $str[(string)($xml->item[$i]->attributes()->id)] = (string)($xml->item[$i]->attributes()->name);
            }
            F('props1',$str);
            $temp = F('props1');
        }
        return $temp;
    }

    //获取装备信息
    public function getequip(){
        //F('props',null);
        $temp = F('equip');
        if(empty($temp)){
            $xml = simplexml_load_file('./Public/Xml/equip.xml');
            $str = array();
            for($i = 0;$i < count($xml->equipment);$i++){
				$str[(string)($xml->equipment[$i]->attributes()->id)] = (string)($xml->equipment[$i]->attributes()->name);
            }
            F('equip',$str);
            $temp = F('equip');
        }
        return $temp;
    }

    //根据serverid、characterid获取角色名
    public function getusername($serverid,$characterid){
        
    }

    public function getfirstautoid(){
        //获取第一个服的autoid
        $serverinfo = D('Serverinfo');
        $ret = $serverinfo->find();
        return $ret['autoid'];
    }

}
