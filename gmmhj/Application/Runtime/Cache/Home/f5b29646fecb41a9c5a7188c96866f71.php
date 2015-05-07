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
<div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
    <div class="panel-heading">
        <h3>公告列表</h3>
        <label>区服:</label>
        <?php echo ($server_html); ?>
    </div>
    <form name="form1" action="<?php echo U('Home/Announce/annlist');?>" method="post">
        <input type="hidden" value="" name="formautoid" id="formautoid"/>
    </form>
    <div class="panel-body">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
            <tr align="center">
                <td colspan="7"><h4 style="font-weight:bold;">循环公告列表</h4></td>
            </tr>
            <tr align="center">
                <td>服务器ID</td>
                <td>公告ID</td>
                <td>公告内容</td>
                <td>开始时间</td>
                <td>结束时间</td>
                <td>频率（单位：秒）</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($loop)): $i = 0; $__LIST__ = $loop;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                        <td><?php echo ($vo["idGameServer"]); ?></td>
                        <td><?php echo ($vo["idAnnounce"]); ?></td>
                        <td><?php echo ($vo["szContent"]); ?></td>
                        <td><?php echo (date("Y-m-d H:i",$vo["send_time"])); ?></td>
                        <td><?php echo (date("Y-m-d H:i",$vo["end_time"])); ?></td>
                        <td><?php echo ($vo["interval"]); ?></td>
                        <td><button type="button" class="btn btn-danger" onclick="delloop(<?php echo ($vo["idGameServer"]); ?>,<?php echo ($vo["idAnnounce"]); ?>);">删除</button></td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
            <tr align="center">
                <td colspan="5"><h4 style="font-weight:bold;">定时公告列表</h4></td>
            </tr>
            <tr align="center">
                <td>服务器ID</td>
                <td>公告ID</td>
                <td>公告内容</td>
                <td>开始时间</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($regular)): $i = 0; $__LIST__ = $regular;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                        <td><?php echo ($vo["idGameServer"]); ?></td>
                        <td><?php echo ($vo["idAnnounce"]); ?></td>
                        <td><?php echo ($vo["szContent"]); ?></td>
                        <td><?php echo ($vo["send_time"]); ?></td>
                        <td><button type="button" class="btn btn-danger" onclick="delregular(<?php echo ($vo["idGameServer"]); ?>,<?php echo ($vo["idAnnounce"]); ?>);">删除</button></td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).ready(function(){
        $("#autoid").change(function(){
            var autoid = $(this).val();
            if(autoid != 0){
                $("#formautoid").val(autoid);
                form1.submit();
            }
        })
    });
</script>
</body>

</html>