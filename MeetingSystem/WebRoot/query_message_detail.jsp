<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<title>主页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}
</script>
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
		<script src="js/amcharts.js">
</script>
		<script src="js/serial.js">
</script>
		<script src="js/light.js">
</script>
		<script src="js/radar.js">
</script>
		<link href="css/barChart.css" rel='stylesheet' type='text/css' />
		<link href="css/fabochart.css" rel='stylesheet' type='text/css' />
		<!--clock init-->
		<script src="js/css3clock.js">
</script>
		<!--Easy Pie Chart-->
		<!--skycons-icons-->
		<script src="js/skycons.js">
</script>

		<script src="js/jquery.easydropdown.js">
</script>

		<!--//skycons-icons-->
	</head>

	<body>
		<div class="page-container">
			<!--/content-inner-->
			<div class="left-content">
				<div class="inner-content">
					<!-- header-starts -->
					<div class="header-section">
						<!--menu-right-->
						<div class="top_menu">
							<div class="main-search">
								<form>
									<input type="text" value="Search" onFocus="this.value = '';"
										onBlur="if (this.value == '') {this.value = 'Search';}"
										class="text" />
									<input type="submit" value="">
								</form>
								<div class="close">
									<img src="images/cross.png" />
								</div>
							</div>
							<div class="srch">
								<button></button>
							</div>
<script type="text/javascript">
$('.main-search').hide();
$('button').click(function() {
	$('.main-search').show();
	$('.main-search text').focus();
});
$('.close').click(function() {
	$('.main-search').hide();
});


var isLoaded = false;
function req() {
	$.ajax({
        type: "post",
        url: "<%=basePath%>message/queryUnReadMessage",
        dataType: "json",
        beforeSend: function() {
            isLoaded = false;
        },
        success: function(data) {
        	var num = data[0].msgNum;
        	$("#unreadnum").html(num);
        	
        	$("#unreadmsgs").html("");
        	var headerhtml = "<li><div class='notification_header'>" + 
        	                 "<h3>你有 " + num + " 条未读消息</h3></div></li>";
        	$("#unreadmsgs").append(headerhtml);
        	
        	var messages = data[0].messages;
        	for (var i = 0; i < messages.length; i++) {
        		var message = messages[i];
        		var msgId = message.messageId; // to query detail
        		var avatar = message.sendUser.avatar;
        		var sendUserName = message.sendUser.userName;
        		var msgName = message.messageName;
        		var sendTime = message.sendTime;
        		
        		var innerhtml = "<li><a onclick='queryMsgById(" + msgId + ")'><div class='user_img'>" + 
        		                "<img src='" + avatar + "' alt=''></div>" + 
        		                "<div class='notification_desc'><p>" + sendUserName + "</p><p>" + msgName + "</p>" + 
        		                "<p><span>" + sendTime + "</span></p>" + 
        		                "</div><div class='clearfix'></div></a></li>";
        		$("#unreadmsgs li:eq(" + i + ")").after(innerhtml);
        	}
        	
        	var footerhtml = "<li><div class='notification_bottom'>" + 
        	                 "<a href='<%=basePath%>message/queryMessageToMe'>查看更多>></a></div></li>";
        	$("#unreadmsgs li:eq(" + messages.length + ")").after(footerhtml);
        	
        },
        complete: function() {
            isLoaded = true;
        },
        error: function() {
            console.log('请求失败!');
        }
    });
}

req();
setInterval(function() {
	isLoaded && req();
}, 3000);

function queryMsgById(msgId) {
	window.location.href = "<%=basePath%>message/queryMessageById?msgId=" + msgId;
}
</script>
							<!--/profile_details-->
							<div class="profile_details_left">
								<ul class="nofitications-dropdown">
									<li class="dropdown note">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											aria-expanded="false"><i class="fa fa-bell-o"></i> <span
											class="badge" id="unreadnum">0</span> </a>

										<ul class="dropdown-menu two" id="unreadmsgs"></ul>
									</li>
									<div class="clearfix"></div>
								</ul>
							</div>


							<div class="clearfix"></div>
							<!--//profile_details-->
						</div>
						<!--//menu-right-->
						<div class="clearfix"></div>
					</div>
					<!-- //header-ends -->


					<!--//outer-wp-->
					<div class="outter-wp">
						<!--/sub-heard-part-->
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li>
									<a href="index.jsp">首页</a>
								</li>
								<li>
									<a href="<%=basePath%>message/queryMessageToMe">消息中心</a>
								</li>
								<li class="active">
									消息详情
								</li>
							</ol>
						</div>
						<!--/sub-heard-part-->
						<!--/inbox-->
						<div class="inbox-mail">
							<!-- tab content -->

							<div class="tab-pane active text-style" id="tab3">
								<div class="inbox-right">

									<div class="mailbox-content">
										<!--Compose New Message -->
										<div class="compose-mail-box">
											<div class="compose-bg">
												消息内容
											</div>
											<div class="panel-body">
												<fmt:parseDate var="startObj" value="${message.sendTime}"
													type="DATE" pattern="yyyy-MM-dd HH:mm" />
												<fmt:formatDate var="sendTime" value='${startObj}'
													pattern='yyyy-MM-dd HH:mm' />
												<form class="com-mail">
													<strong>发件人： </strong><input type="text" class="form-control1 control3"
														value="${message.sendUser.userName}" placeholder="From :">
													<strong>收件人： </strong><input type="text" class="form-control1 control3"
														value="${message.receiveUser.userName}" placeholder="To :">
													<strong>发送时间： </strong><input type="text" class="form-control1 control3"
														value="${sendTime}" placeholder="Subject :">
													<strong>主题： </strong><input type="text" class="form-control1 control3"
														value="${message.messageName}" placeholder="Subject :">
													<strong>内容： </strong><textarea rows="6" class="form-control1 control2"
														placeholder="Message :">${message.content}</textarea>
												</form>
											</div>
										</div>
										<!--//Compose New Message -->
									</div>
								</div>
							</div>

							<div class="clearfix">
							</div>
						</div>

					</div>
					<!--//outer-wp-->
										
										
				</div>
			</div>
			<!--//content-inner-->


			<!--/sidebar-menu-->
			<div class="sidebar-menu">
				<header class="logo">
				<a class="sidebar-icon"> <span class="fa fa-bars"></span></a>
				<a href="index.jsp"> <span id="logo">
						<h1>
							MMS
						</h1> </span> <!--<img id="logo" src="" alt="Logo"/>--> </a>
				</header>
				<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
				<!--/down-->
				<div class="down">
					<a href="query_myuserinfo.jsp" title="更换头像"><img src="${sessionScope.user.avatar}" alt="avatar/default_avatar.jpg"> </a>
					<a href="query_myuserinfo.jsp" title="修改昵称"><span class=" name-caret">${sessionScope.user.nickname}</span> </a>
					<p>
					    ${sessionScope.user.signature}
					</p>
					<ul>
						<li>
							<a class="tooltips" href="query_myuserinfo.jsp"><span>我的</span><i
								class="lnr lnr-user"></i> </a>
						</li>
						<li>
							<a class="tooltips" href="query_myuserinfo.jsp"><span>设置</span><i
								class="lnr lnr-cog"></i> </a>
						</li>
						<li>
							<a class="tooltips" href="<%=basePath%>user/loginout"><span>退出</span><i
								class="lnr lnr-power-switch"></i> </a>
						</li>
					</ul>
				</div>
				<!--//down-->
				<div class="menu">
					<ul id="menu">
						<li id="menu-academico">
							<a href="#"><i class="fa fa-table"></i> <span>会议室查询</span> 
							<span class="fa fa-angle-right"
								style="float: right"></span> </a>
							<ul id="menu-academico-sub">
								<li id="menu-academico-avaliacoes">
									<a href="<%=basePath%>meetingRoom/queryMeetingRoom">会&nbsp;议&nbsp;室</a>
								</li>
								<li id="menu-academico-boletim">
									<a href="query_mr_monthview.jsp">月&nbsp;视&nbsp;图</a>
								</li>
							</ul>
						</li>
						<li id="menu-academico">
							<a><i class="fa fa-file-text-o"></i> <span>我的会议</span> 
							<span class="fa fa-angle-right" style="float: right"></span>
							</a>
							<ul id="menu-academico-sub">
							    <li id="menu-academico-avaliacoes">
									<a href="query_meetingtobehold_view.jsp">会议日程</a>
								</li>
								<li id="menu-academico-avaliacoes">
									<a href="<%=basePath%>meetingDetail/queryMeetingDetailToBeHold?pageIndex=1">即将召开</a>
								</li>
								<li id="menu-academico-boletim">
									<a href="<%=basePath%>meetingDetail/queryMeetingDetailAlreadyHold?pageIndex=1">历史会议</a>
								</li>
								<li id="menu-academico-avaliacoes">
									<a href="<%=basePath%>meetingDetail/queryMeetingDetailByRole?pageIndex=1">上传记录</a>
								</li>
							</ul>
						</li>
						<li id="menu-academico">
							<a href="#"><i class="lnr lnr-book"></i> <span>会议预约</span> 
							<span class="fa fa-angle-right" style="float: right"></span> </a>
							<ul id="menu-academico-sub">
								<li id="menu-academico-avaliacoes">
									<a href="<%=basePath%>meeting/queryMeetingByMyScheduled?pageIndex=1">我的预约</a>
								</li>
								<li id="menu-academico-boletim">
									<a href="<%=basePath%>resource/queryAvailableResources">新建预约</a>
								</li>
							</ul>
						</li>
						<li><a href="<%=basePath%>message/queryMessageToMe"><i class="lnr lnr-envelope"></i> <span>消息中心</span></a></li>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<script>
var toggle = true;

$(".sidebar-icon").click(
		function() {
			if (toggle) {
				$(".page-container").addClass("sidebar-collapsed").removeClass(
						"sidebar-collapsed-back");
				$("#menu span").css( {
					"position" : "absolute"
				});
			} else {
				$(".page-container").removeClass("sidebar-collapsed").addClass(
						"sidebar-collapsed-back");
				setTimeout(function() {
					$("#menu span").css( {
						"position" : "relative"
					});
				}, 400);
			}

			toggle = !toggle;
		});
</script>
		<!--js -->
		<link rel="stylesheet" href="css/vroom.css">
		<script type="text/javascript" src="js/vroom.js"></script>
		<script type="text/javascript" src="js/TweenLite.min.js"></script>
		<script type="text/javascript" src="js/CSSPlugin.min.js"></script>
		<!-- <script src="js/jquery.nicescroll.js"></script> -->
		<script src="js/scripts.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js">
</script>
	</body>
</html>