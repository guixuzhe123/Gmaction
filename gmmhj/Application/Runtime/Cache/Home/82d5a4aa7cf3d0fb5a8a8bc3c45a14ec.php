<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/Public/Home/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/Public/Home/Js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	});
    //获取用户名
})	
</script>


</head>

<body style="background:url(/Public/Home/Image/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.html" target="_parent"><!--<img src="/Public/images/logo.png" title="系统首页" style="width:300px;height:100px;margin:-8px 0 0 0;" />--></a>
    </div>
        

    <div>
        <span style="font-size: 26px;position: absolute;margin-top:40px;margin-left: -280px;">GM Server</span>
    </div>
            
    <div class="topright">    
    <ul>
    <li><a href="/index.php/Home/Logout" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span><?php echo ($username); ?></span>
    </div>    
    
    </div>

</body>
</html>