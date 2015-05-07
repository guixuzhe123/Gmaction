<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>每日数据</title>
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
    <form method="post" action="<?php echo U('Home/Reg/data_keep');?>">
    <div class="panel-heading">
        <label>留存数据</label>&nbsp;&nbsp;
        <label>区服:</label>
        <?php echo ($server_html); ?>
        <label for="date">开始日期:</label>
        <input class="datepicker" type="input" id="start_date" name="start_date" value="<?php echo ($start_date); ?>" />&nbsp;
        <label for="date">结束日期:</label>
        <input class="datepicker" type="input" id="end_date" name="end_date" value="<?php echo ($end_date); ?>" />&nbsp;
        <input type="submit" value="查询"/>
    </div>
    </form>
    <div class="panel-body">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
            <tr align="center">
                <td id="col1">区服</td>
                <td id="col2">日期</td>
                <td>新增</td>
                <td>2日留存</td>
                <td>3日留存</td>
                <td>4日留存</td>
                <td>5日留存</td>
                <td>7日留存</td>
                <td>14日留存</td>
                <td>21日留存</td>
                <td>30日留存</td>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($rs)): $i = 0; $__LIST__ = $rs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                    <td><?php echo ($vo["sid"]); ?></td>
                    <td><?php echo ($vo["date"]); ?></td>
                    <td><?php echo ($vo["day1"]); ?></td>
                    <td><?php echo ($vo["day2"]); ?></td>
                    <td><?php echo ($vo["day3"]); ?></td>
                    <td><?php echo ($vo["day4"]); ?></td>
                    <td><?php echo ($vo["day5"]); ?></td>
                    <td><?php echo ($vo["day7"]); ?></td>
                    <td><?php echo ($vo["day14"]); ?></td>
                    <td><?php echo ($vo["day21"]); ?></td>
                    <td><?php echo ($vo["day30"]); ?></td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </div>
    
</div>
</body>
</html>