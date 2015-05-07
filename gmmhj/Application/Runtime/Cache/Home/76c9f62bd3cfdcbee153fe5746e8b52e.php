<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


    <style>
        body{
            font-family: "微软雅黑";
        }
    </style>
</head>


<body>
<div class="panel panel-danger" style="margin:50px auto;width:500px;">
    <div class="panel-heading" style="text-align: center;">
        <h3>欢迎使用本后台</h3>
    </div>
    <div class="panel-body">
        <h3 style="line-height: 40px;">游戏运营平台</h3>
    </div>
    <!--<div class="panel-body">
        <table class="table table-striped">
            <thead>
            <tr>
                <td width="200px"></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>当前用户昵称：</td>
                <td align="left"><?php echo ($rst["displayname"]); ?></td>
            </tr>
            <tr>
                <td>最后登录时间：</td>
                <td><?php echo ($rst["lasttime"]); ?></td>
            </tr>
            <tr>
                <td>当前浏览器：</td>
                <td><?php echo ($rst["browser"]); ?></td>
            </tr>
            <tr>
                <td>当前登录IP：</td>
                <td><?php echo ($rst["clientip"]); ?></td>
            </tr>
            </tbody>
        </table>
    </div>-->
</div>


</body>

</html>