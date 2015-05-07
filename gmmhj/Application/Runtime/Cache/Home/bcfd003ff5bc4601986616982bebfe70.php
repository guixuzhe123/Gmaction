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
        <label>发布即时公告</label>
        <br/>
		<label>区服:</label>
        <?php echo ($server_html); ?>
        <span>不选择区服为所有服发布</span><br/><br/>
        <label>请输入公告内容</label><br/>
        <textarea class="content form-control" rows="3"></textarea><br/>
        &nbsp;&nbsp;<button type="button" class="btn btn-primary addinstant">发布</button>
    </div>
    </form>
    
    
</div>
<script>
    $(document).ready(function(){
        $(".addinstant").click(function(){
            var url = "<?php echo U('Home/Announce/addinstant');?>";
            var autoid = $('#autoid').val();
            var content = $(".content").val();
            $.post(url,{autoid:autoid,content:content},function(data){
                if(data == 0){
                    alert('发布成功！');
                }else{
                    alert('发布失败！');
                }
            })
        })
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