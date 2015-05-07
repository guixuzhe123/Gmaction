<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>每小时在线</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="http://lib.sinaapp.com/js/jquery-ui/1.9.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery-ui/1.9.2/jquery-ui.js"></script>
    <script type="text/javascript" src="Public/Home/Js/global.js"></script>
    <style>
        body{
            font-family: '微软雅黑';
        }
    </style>
</head>
<body>
<div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
    <form method="post" action="<?php echo U('Home/Player/info');?>">
    <div class="panel-heading">
        <label>发布循环公告</label>
        <br/>
		<label>区服:</label>
        <?php echo ($server_html); ?><br/><br/>
        <label for="date">请选择开始时间</label>
        <input class="form-control" type="text" id="start_date" name="start_date" value="<?php echo ($start_date); ?>" style="display:inline-block;width:300px;"/>&nbsp;&nbsp;时间格式为"2015-01-09 14:20",不足10请在前面加0,请使用英文输入法输入<br/><br/>
        <label for="date">请选择结束时间</label>
        <input class="form-control" type="text" id="end_date" name="end_date" value="<?php echo ($end_date); ?>" style="display:inline-block;width:300px;"/>
        <br/><br/>
        <label>间隔时间</label>&nbsp;&nbsp;<input type="text" class="form-control" style="width:50px;display:inline-block;" id="interval" value="10">&nbsp;秒<br/><br/>
        <label>请输入公告内容</label><br/>
        <textarea class="content form-control" rows="3"></textarea><br/>
        &nbsp;&nbsp;<button type="button" class="btn btn-primary addloop">发布</button>
    </div>
    </form>
    
    
</div>
<script>
    $(document).ready(function(){
        $(".addloop").click(function(){
            var url = "<?php echo U('Home/Announce/addloop');?>";
            var autoid = $("#autoid").val();
            var content = $(".content").val();
            var send_time = $("#start_date").val();
            var end_time = $("#end_date").val();
            var interval = $("#interval").val();
            if(autoid == 0){
                alert("请选择服务器！");
                return;
            }
            if(content == ""){
                alert('请输入公告内容！');
                return;
            }
            if(send_time == ""){
                alert('请输入开始时间！');
                return;
            }
            if(end_time == ""){
                alert('请输入结束时间！');
                return;
            }
            //alert("222");
            $.post(url,{autoid:autoid,content:content,send_time:parseInt((new Date(send_time)) / 1000),end_time:parseInt((new Date(end_time)) / 1000),interval:interval},function(data){
                alert(data);
                /*if(data == 0){
                    alert('发布成功！');
                }else{
                    alert('发布失败！');
                }*/
            });
        });
        $(".content").keydown(function(){
            if($(this).val().length >= 300){
                alert('字数超过限制！');
                $(this).val($(this).val().substr(0,299));
            }
        })
    });
</script>
</body>
</html>