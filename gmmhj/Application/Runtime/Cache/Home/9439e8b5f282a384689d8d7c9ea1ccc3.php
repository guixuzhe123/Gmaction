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
</head>
<body>
<div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
    <form method="post" action="<?php echo U('Home/Online/history_online');?>">
    <div class="panel-heading">
        <label>每小时在线</label>
        <label>区服:</label>
        <?php echo ($server_html); ?>
        <label for="date">查询日期:</label>
        <input class="datepicker" type="input" id="date" name="date" value="<?php echo ($date); ?>" />&nbsp;
        <input type="submit" value="查询"/>
    </div>
    </form>
    <label>每小时在线</label>
    <div class="panel-body">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
            <tr align="center">
                <td id="col1">区服</td>
                <td id="col2">日期</td>
                <td>0时</td><td>1时</td><td>2时</td><td>3时</td><td>4时</td><td>5时</td><td>6时</td><td>7时</td>
                <td>8时</td><td>9时</td><td>10时</td><td>11时</td><td>12时</td><td>13时</td><td>14时</td><td>15时</td>
                <td>16时</td><td>17时</td><td>18时</td><td>19时</td><td>20时</td><td>21时</td><td>22时</td><td>23时</td>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($datas)): $i = 0; $__LIST__ = $datas;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                    <td><?php echo ($vo["sid"]); ?></td>
                    <td><?php echo ($vo["date"]); ?></td>
                    <td><?php echo ($vo["h0"]); ?></td>
                    <td><?php echo ($vo["h1"]); ?></td>
                    <td><?php echo ($vo["h2"]); ?></td>
                    <td><?php echo ($vo["h3"]); ?></td>
                    <td><?php echo ($vo["h4"]); ?></td>
                    <td><?php echo ($vo["h5"]); ?></td>
                    <td><?php echo ($vo["h6"]); ?></td>
                    <td><?php echo ($vo["h7"]); ?></td>
                    <td><?php echo ($vo["h8"]); ?></td>
                    <td><?php echo ($vo["h9"]); ?></td>
                    <td><?php echo ($vo["h10"]); ?></td>
                    <td><?php echo ($vo["h11"]); ?></td>
                    <td><?php echo ($vo["h12"]); ?></td>
                    <td><?php echo ($vo["h13"]); ?></td>
                    <td><?php echo ($vo["h14"]); ?></td>
                    <td><?php echo ($vo["h15"]); ?></td>
                    <td><?php echo ($vo["h16"]); ?></td>
                    <td><?php echo ($vo["h17"]); ?></td>
                    <td><?php echo ($vo["h18"]); ?></td>
                    <td><?php echo ($vo["h19"]); ?></td>
                    <td><?php echo ($vo["h20"]); ?></td>
                    <td><?php echo ($vo["h21"]); ?></td>
                    <td><?php echo ($vo["h22"]); ?></td>
                    <td><?php echo ($vo["h23"]); ?></td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>