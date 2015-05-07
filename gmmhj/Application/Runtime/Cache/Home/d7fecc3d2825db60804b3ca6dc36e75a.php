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
    <div class="panel panel-danger" style="margin:50px auto;width:1559px;">
        <div class="panel-heading">
            <h3>日志列表</h3>
            <h4>管理员列表：
                <select class="form-control" name="platform" id="platform" style="width:150px;display:inline;" selectid="<?php echo ($selectid); ?>">
                    <option value="0">请选择管理员</option>
                    <?php if(is_array($operatorlist)): $i = 0; $__LIST__ = $operatorlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>" class="operatoroption" uhref="<?php echo U('Log/selectoperator',array('user' => $vo['username']));?>"><?php echo ($vo["username"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </h4>
        </div>
        <form action="" method="post" name="form1" id="form1">
            <!-- <input type="hidden" name="operatorid" class="operatorid"/> -->
        </form>
        <div class="panel-body">
            <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
                <thead>
                    <tr align="center">
                        <td>日志ID</td>
                        <td>操作者</td>
                        <td>操作内容</td>
                        <td>操作IP</td>
                        <td>操作时间</td>
                    </tr>
                </thead>
                <tbody>
                    <?php if(is_array($logs)): $i = 0; $__LIST__ = $logs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                            <td><?php echo ($vo["id"]); ?></td>
                            <td><?php echo ($vo["operator"]); ?></td>
                            <td><?php echo ($vo["content"]); ?></td>
                            <td><?php echo ($vo["ip"]); ?></td>
                            <td><?php echo (date("Y-m-d H:i:s",$vo["time"])); ?></td>
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                    <tr align="right">
                        <td colspan="5"><?php echo ($page); ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script>
    $(document).ready(function(){
        $(".operatoroption").each(function(index){
            if($(this).val() == $("#platform").attr('selectid')){
                $(this).attr('selected','1');
            }
        });
        $("#platform").change(function(){
            $(".operatorid").val($(this).val());
            var url;
            var selectid = $(this).val();
            $(".operatoroption").each(function(index){
                if($(this).val() == selectid){
                    url = $(this).attr('uhref');
                }
            });
            $("#form1").attr('action',url);
            form1.submit();
        });
    });
    </script>
</body>

</html>