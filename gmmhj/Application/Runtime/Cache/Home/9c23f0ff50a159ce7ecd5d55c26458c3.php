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
    <form method="post" action="<?php echo U('Home/Charge/payblock');?>">
    <div class="panel-heading">
        <label>付费段人数</label>&nbsp;&nbsp;
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
                <td id="col1">付费金额</td>
                <td id="col2">人数</td>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>0-10</td>
                    <td><?php echo ($num1); ?></td>
                </tr>
                <tr>
                    <td>11-50</td>
                    <td><?php echo ($num2); ?></td>
                </tr>
                <tr>
                    <td>51-100</td>
                    <td><?php echo ($num3); ?></td>
                </tr>
                <tr>
                    <td>101-500</td>
                    <td><?php echo ($num4); ?></td>
                </tr>
                <tr>
                    <td>501-1000</td>
                    <td><?php echo ($num5); ?></td>
                </tr>
                <tr>
                    <td>1001-2000</td>
                    <td><?php echo ($num6); ?></td>
                </tr>
                <tr>
                    <td>2001-5000</td>
                    <td><?php echo ($num7); ?></td>
                </tr>
                <tr>
                    <td>5001-10000</td>
                    <td><?php echo ($num8); ?></td>
                </tr>
                <tr>
                    <td>10001-20000</td>
                    <td><?php echo ($num9); ?></td>
                </tr>
                <tr>
                    <td>20000以上（不含20000）</td>
                    <td><?php echo ($num10); ?></td>
                </tr>
            </tbody>
        </table>
    </div>
    
</div>
</body>
</html>