<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>充值记录列表</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="http://lib.sinaapp.com/js/jquery-ui/1.9.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery-ui/1.9.2/jquery-ui.js"></script>
    <script type="text/javascript" src="Public/Home/Js/global.js"></script> 
</head>
<body>
<div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
    <form method="post" action="<?php echo U('Home/Reg/ip_query');?>">
    <div class="panel-heading">
        <label>批量封号</label>&nbsp;&nbsp;<br/><br/>
        <textarea class="form-control names"></textarea><br/>
		<font color="red">*</font>请输入角色名，并以英文","作为分割符，例：s1.西门,s2.东门<br/>
        <input type="button" value="确定" class="iplock"/>
    </div>
    </form>
    <div class="panel-body">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    
</div>
<script>
	$(document).ready(function(){
		$(".iplock").click(function(){
			var url = "<?php echo U('Player/lockusers');?>";
			var names = $(".names").val();
			if(names == ""){
				alert('IP不能为空!');
				return false;
			}
			//alert(names);
			$.post(url,{names:names},function(data){
				alert(data);
			})
		})
	})
</script>
</body>
</html>