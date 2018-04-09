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

		<title>jump</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<meta http-equiv="refresh" content="3; url=<%=basePath%>meeting/queryMeetingDetailAndResourceById?meetingId=${param.mid}&action=4">
		
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
		<!--/404-->
		<div class="error_page error">
			<!--/error-top-->
			<div class="error-top error">
				<h3>
					<i class="fa fa-smile-o"></i>
				</h3>
				<span>预定成功</span><br/>
				<span>3秒后自动跳转详情页面</span>
				<p>
					如你的浏览器没有自动跳转，请点击这里
				</p>
				<div class="error-btn">
					<a class="read fourth" href="<%=basePath%>meeting/queryMeetingDetailAndResourceById?meetingId=${param.mid}&action=4">查看详情</a>
				</div>
			</div>
			<!--//error-top-->
		</div>

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
