<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/unicorn.login.css" />

<script src="js/jquery.min.js"></script>  
<script src="js/unicorn.login.js"></script> 
<style type="text/css">
	.errorMessage{
		color: red;
	}
</style>
</head>
<body>
	<div id="logo">
        <img src="img/logo.png" alt="" />
    </div>
    <div id="loginbox">
		<form id="loginform" class="form-vertical" action="organization_login.action" method="post">
			<p class="errorMessage">${errorMessage }&nbsp;</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span><input
							type="text" name="account" placeholder="昵称" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-lock"></i></span><input
							type="password" name="password" placeholder="密码" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				 <span class="pull-right">
				 	<font id="error" style="font-size: 20px;" color="red">${error }</font>
				 	<input type="submit" class="btn btn-inverse" value="进入后台" />
				 </span>
			</div>
		</form>
	</div>
</body>
</html>