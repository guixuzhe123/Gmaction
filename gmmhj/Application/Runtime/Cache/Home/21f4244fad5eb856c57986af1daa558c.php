<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>实时等级分布</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <script src="/Public/Flot/js/jquery.js"></script>    
    <script src="http://121.201.104.239:8000/socket.io/socket.io.js"></script>
    <!--<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>-->

    <style>
        body{
            font-family: '微软雅黑';
        }
        .username{
            color:blue;
            text-decoration:underline;
        }
        .panel-body{
            max-height:500px;
            overflow-y:auto;
        }
        .unit{margin-top:5px;}
        .findkeyword{color:red;font-weight:bold;}
        .leftblock{display:inline-block;float:left;}
        .rightblock{display:inline-block;float:left;margin-top:5px;}
        .clear{clear:both;}
    </style>
    <script type="text/javascript">
    </script>
</head>
<body>
<div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
    <div class="panel-heading">
        <h3>聊天系统监控</h3>
		<label>选服:</label>
        <?php echo ($server_html); ?>
		&nbsp;&nbsp;<label>频道:</label>
        <select class="form-control" style="width:100px;display:inline;" id="channel">
            <option value="0">综合</option>
            <option value="1">当前</option>
            <option value="2">阵营</option>
            <option value="3">公会</option>
            <option value="4">队伍</option>
            <option value="5">传音</option>
            <option value="6">交易</option>
            <option value="7">系统</option>
            <option value="8">副本</option>
            <option value="9">战场</option>
            <option value="100">私聊</option>
        </select>
        &nbsp;&nbsp;<label>关键词:</label>
        <input class="form-control keyword" style="width:100px;display:inline;"/>
        &nbsp;&nbsp;<button type="button" class="btn btn-primary findword">查询</button>
        &nbsp;&nbsp;<span>每隔</span>&nbsp;<input class="form-control timecount" style="width:50px;display:inline;" value="5"/>&nbsp;<span>分钟自动清数据</span>
        &nbsp;&nbsp;<span class="timehint"></span>
    </div>
    <div class="panel-body">
    </div>
</div>
<input type="hidden" name="gmuser" value='<?php echo ($gmuser); ?>'>
<script type="text/javascript" src="http://gm.3595.com/Public/Home/Js/chat.js"></script>
<script type="text/javascript">
    var sid = 0;//默认选服，0为全服
    var channelid = 0;//默认频道，0为所有频道
    $(document).ready(function(){
        var serverarr = new Array();
        var serverarr1 = new Array();
        $("#autoid").find("option").each(function(index){
            if(index > 0){
                serverarr[$(this).val()] = $(this).attr('sid');
                serverarr1[$(this).attr('sid')] = $(this).val();
            }
        });
        CHAT.init($("input[name='gmuser']").val());
        CHAT.clear(5);
        $(".timecount").change(function(){
            //改变倒计时
            var changemin = $(this).val();
            if(!isNaN(changemin)){
                CHAT.clear(changemin);
            }else{
                alert("请输入正确的数字！");
            }
        });
        $("#autoid").change(function(){
            //服务器id改变
            sid = serverarr[$(this).val()];
        });
        $("#channel").change(function(){
            //频道改变
            channelid = $(this).val();
        });
        $(".findword").click(function(){
            //查找关键字
            $(".chatcontent").each(function(index){
                $(this).html($(this).html().replace(/(.*)<font.*>(.*)<\/font>(.*)/,"$1$2$3"));
                var keyword = $(".keyword").val();
                if(keyword != ""){
                    $(this).html($(this).html().replace(keyword,"<font class='findkeyword'>" + keyword + "</font>"));
                }
            });
        });
        $(document).on('click',".lock",function(){
            var url = "<?php echo U('Player/Lock');?>";
            var autoid = serverarr1[$(this).attr('sid')];
            var account = $(this).attr('account');
            alert(autoid);
            $.post(url,{autoid:autoid,account:account},function(data){
                if(data == 0){
                    alert("封号成功");
                }else{
                    alert(data);
                    alert("封号失败");
                }
            })
        });
        $(document).on('click',".iplock",function(){
            $.iplock($(this).attr('ip'));
            alert("操作成功");
        });
        $(document).on('click',".ipblock",function(){
            var ipblock = $(this).attr('ip');        
            var ips = new Array();
            ips = ipblock.split(".");
            for(var i = 2;i < 255;i++){
                ips[3] = i;
                var newip = ips.join(".");
                $.ipblock(newip);
                alert("操作成功！");
            }
        });
        $.iplock = function(ip){
            var url = "<?php echo U('Player/iplock');?>";
            var autoid = serverarr1[$(this).attr('sid')];
            $.post(url,{autoid:autoid,ip:ip},function(data){
                return data;
            })
        }
    })
</script>
</body>
</html>