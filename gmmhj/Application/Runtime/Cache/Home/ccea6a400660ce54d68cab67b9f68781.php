<?php if (!defined('THINK_PATH')) exit();?>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GM Server</title>
    <link rel="stylesheet" href="/Public/Home/css/login.css">
</head>
<body>
<div class="login">
    <form method="post" action="<?php echo U('Home/Login/index');?>">
        <div class="login-form-header">
            <h1>管理员登录</h1>
        </div>
        <div class="login-form-body">
            <label for="username">用户名</label>
            <input type="text" tabindex="1" name="username" id="username" value="">
            <label for="password">密码</label>
            <input type="password" tabindex="2" name="password" id="password">
            <input type="hidden" name="submit" value="Login"/>
            <button type="submit" tabindex="3" class="btn">登录</button>
            <span></span>
        </div>
    </form>
</div>
</body>
</html>