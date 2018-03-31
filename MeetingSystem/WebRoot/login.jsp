<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>登录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}</script>
		<!-- Bootstrap Core CSS -->
		<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
		<!-- Custom CSS -->
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<!-- Graph CSS -->
		<link href="css/font-awesome.css" rel="stylesheet">
		<!-- jQuery -->
		<link
			href='https://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400'
			rel='stylesheet' type='text/css'>
		<!-- lined-icons -->
		<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
		<!-- //lined-icons -->
		<script src="js/jquery-1.10.2.min.js">
</script>
		<!--clock init-->
	</head>

	<body>
		<!--/login-->
		<div class="error_page">
			<!--/login-top-->
			<div class="error-top">
				<h2 class="inner-tittle page">
					&nbsp;&nbsp;&nbsp;M&nbsp;M&nbsp;S
				</h2>
				<div class="login">
					<h3 class="inner-tittle t-inner">
						账号登录
					</h3>
					<div class="buttons login">
						<ul>
							<li>
								<a href="#" class="hvr-sweep-to-right">QQ</a>
							</li>
							<li class="lost">
								<a href="#" class="hvr-sweep-to-left">Weibo</a>
							</li>
							<div class="clearfix"></div>
						</ul>
					</div>
					<form action="#" onsubmit="return false" method="post">
						<div id="errorinfo" style="font-size:12px; color:#FF0000">*</div>
						<input type="text" class="text" id="username" value="请输入用户名"
							name="userName" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '请输入用户名';}">
						<input type="password" id="password" value="Password"
							name="password" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Password';}">
						<div class="submit">
							<input type="button" onclick="checkAndlogin()" value="登录">
						</div>
						<div class="clearfix"></div>
						<div class="new">
							<p>
								<label class="checkbox11">
									<a href="modify_password.jsp"
										style="text-decoration: underline;">忘记密码 ?</a>
								</label>
							</p>
							<p class="sign">
								还没有账号 ?&nbsp;
								<a href="register.jsp" style="text-decoration: underline;">注册</a>
							</p>
							<div class="clearfix"></div>
						</div>
					</form>

<script type="text/javascript">
$("#errorinfo").hide();
function checkAndlogin() {
	var username = $("#username").val();
	var password = $("#password").val();
	if (username == "" || username == "请输入用户名") {
	   	$("#errorinfo").html("请输入用户名");
		$("#errorinfo").show();
		return;
	} else if (password == "" || password == "Password") {
	    $("#errorinfo").html("请输入密码");
		$("#errorinfo").show();
		return;
	} else {
		$.post("<%=basePath%>user/login", 
		    $("form").serialize(), 
		    function(data) {
            if (data == "ordinary ok") {
                window.location.href = "index.jsp";
            } else if (data == "admin ok") {
                window.location.href = "admin_index.jsp";
            } else {
                $("#errorinfo").html("用户名或密码输入错误");
                $("#errorinfo").show();
            }
		});
		return;
	}
}
</script>
				</div>
			</div>
			<!--//login-top-->
		</div>
		<!--//login-->
		<!--/404-->
		<!--js -->
		<!-- <script src="js/jquery.nicescroll.js">
</script> -->
		<script src="js/scripts.js">
</script>
		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js">
</script>
	</body>
</html>
