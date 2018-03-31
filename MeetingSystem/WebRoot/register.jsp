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

		<title>注册</title>
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

			<div class="error-top up">
				<h2 class="inner-tittle page">
					&nbsp;&nbsp;&nbsp;M&nbsp;M&nbsp;S
				</h2>
				<div class="login">
					<h3 class="inner-tittle t-inner">
						账号注册
					</h3>
					<form action="#" onsubmit="return false" method="post">
					    <div id="errorinfo" style="font-size:12px; color:#FF0000">输入不能为空</div>
						<input type="text" class="text" id="username" name="userName" value="请输入用户名"
							onfocus="this.value = '';"
							onblur="checkUsername()">
						<input type="password" value="Password" id="password" name="password" 
						    onfocus="this.value = '';"
							onblur="checkPassword()">
						<input type="password" value="Password" id="confirmPassword" name="confirmPassword" 
						    onfocus="this.value = '';" 
							onblur="checkConfirmPassword()">
					    <input class="certcode" id="certCode" value="请输入验证码" 
					        onfocus="this.value = '';" 
					        onblur="checkCertCode()">&nbsp;
					    <img id="certPic" src="make_certpic.jsp"/>
					    <a href="javascript:changeImg()" style="color:#00C6D7; text-decoration: underline">&nbsp;换一张</a>
						<div class="submit">
							<input type="button" onclick="checkAndRegister()" value="注册">
						</div>
						<div class="clearfix"></div>
						<div class="buttons">
							<ul>
								<li>
									<a href="#" class="hvr-sweep-to-right">QQ</a>
								</li>
								<li class="or">
									<h6>
										或
									</h6>
								</li>
								<li class="lost">
									<a href="#" class="hvr-sweep-to-left">Weibo</a>
								</li>
								<div class="clearfix"></div>
							</ul>
						</div>
						<div class="new">
							<p class="sign up">
								已经有账号 ?&nbsp;去
								<a href="login.jsp" style="text-decoration: underline;">登录</a>
							</p>
							<div class="clearfix"></div>
						</div>
					</form>
					
<script type="text/javascript">
$("#errorinfo").hide();
$.ajaxSetup({
    async : false
});
function checkUsername() {
    var username = $("#username");
    if (username.val() == "" || username.val() == "请输入用户名") {
        $("#errorinfo").html("请输入用户名");
		$("#errorinfo").show();
		username.val("请输入用户名");
		return false;
    } else {
        $.post("<%=basePath%>user/queryUserName", 
            {userName : username.val()}, 
		    function(data) {
                if (data == "ok") {
                    $("#errorinfo").html("ok");
                    $("#errorinfo").hide();
                } else {
                    $("#errorinfo").html("此用户名已存在");
                    $("#errorinfo").show();
                }
		});
		
		if ($("#errorinfo").html() == "ok") {
		    $("#errorinfo").html("");
		    return true;
		} else {
		    return false;
		}
    }
}

function checkPassword() {
    var password = $("#password");
    if (password.val() == "" || password.val() == "Password") {
        $("#errorinfo").html("请输入密码");
		$("#errorinfo").show();
		password.val("Password");
		return false
    } else if (password.val().length < 6 || password.val().length > 16) {
        $("#errorinfo").html("密码位数必须在6-16位之间");
        $("#errorinfo").show();
        return false;
    }
    
    var re = /^[0-9]*$/;
    if (re.test(password.val())) {
        $("#errorinfo").html("密码不能为纯数字");
        $("#errorinfo").show();
        return false;
    }
    
    $("#errorinfo").html("");
    $("#errorinfo").hide();
    return true;
}

function checkConfirmPassword() {
    var password = $("#password");
    var confirmPwd = $("#confirmPassword")
    if (confirmPwd.val() == "" || confirmPwd.val() == "Password") {
        $("#errorinfo").html("请确认密码");
		$("#errorinfo").show();
		confirmPwd.val("Password");
		return false;
    } else if (confirmPwd.val() != password.val()) {
        $("#errorinfo").html("两次密码输入不一致");
		$("#errorinfo").show();
		return false;
    }
    
    $("#errorinfo").hide();
    return true;
}

function changeImg() {
    now = new Date(); 
    var src = "make_certpic.jsp?code=" + now.getTime();
    $("#certPic").attr("src", src);
}

function checkCertCode() {
    var inputCode = $("#certCode");
    if (inputCode.val() == "" || inputCode.val() == "请输入验证码") {
        inputCode.val("请输入验证码");
        $("#errorinfo").html("验证码输入错误");
        $("#errorinfo").show();
        return false;
    } else {
        $.post("<%=basePath%>user/checkCertCode", 
            {inputCode : inputCode.val()}, 
		    function(data) {
		        if (data == "fail") {
                    $("#errorinfo").html("验证码输入错误");
                    $("#errorinfo").show();
                } else {
                    $("#errorinfo").html("ok");
                    $("#errorinfo").hide();
                }
        });
        
        if ($("#errorinfo").html() == "ok") {
            $("#errorinfo").html("");
            return true;
        } else {
            return false;
        }
    }
}

function checkAndRegister() {    
    if ($("#errorinfo").html() != "") {
        $("#errorinfo").show();
        return;
    } else if (!checkUsername() || !checkPassword() || !checkConfirmPassword() || !checkCertCode()) {
        return;
    } else {
        $.post("<%=basePath%>user/register", 
            $("form").serialize(), 
		    function(data) {
		        if (data == "ok") {
		            window.location.href = "jump.jsp";
                } else {
                    $("#errorinfo").html("注册失败");
                    $("#errorinfo").show();
                }
        });
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
