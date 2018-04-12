<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.lxm.bean.MeetingRoom" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						<!--sub-heard-part-->
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li>
									<a href="index.jsp">主页</a>
								</li>
								<li class="active">
									人员管理
								</li>
							</ol>
						</div>
						<!--//sub-heard-part-->

						<!-- content -->
						<div class="graph-visual tables-main">
							<h3 class="inner-tittle two">
								人员列表
							</h3>

							<!-- search -->
							<div>
								<form action="<%=basePath%>user/queryUsers" method="Post" onsubmit="return check()">
									<div class="input-group input-group-in">
										<input type="text" name="userName" id="userName" value="${user.userName}" 
											style="width: 30%; margin-left: 5px" class="form-control"
											placeholder="按用户名查询" title="按用户名查询">
										<input type="text" name="mrName" id="mrName" value="${meetingRoom.mrName}" 
											style="width: 30%; margin-left: 10px" class="form-control"
											placeholder="按会议室用途查询" title="按会议室用途查询">
										<input type="text" name="capacity" id="capacity" value="${meetingRoom.capacity}"  
											style="width: 30%; margin-left: 10px" class="form-control"
											placeholder="按会议室容量查询" title="按会议室容量查询">
										<span class="input-group-btn" style="width: 25%">
											<button class="btn btn-success" type="submit" title="按条件查询">
												<i class="fa fa-search"></i>
											</button>
										</span>
										<input type="hidden" name="pageIndex" value="1" id="pi" />
									</div>
								</form>
								<div class="alert alert-danger" role="alert" id="error">
									<strong>Oh snap!</strong>
								</div>
<script type="text/javascript">
$("#error").hide();
function check() {
	var capacity = $("#capacity").val();
	
	var re = /^[0-9]*$/;
	if (capacity == "") {
		$("#capacity").val("0");
		return true;
	} else if (re.test(capacity)) {
		return true;
	} else {
		$("#error").html("<strong>输入错误!</strong>  容量只能是数字.");
		$("#error").show();
		return false;
	}
}
</script>
							</div>
							<!-- //search -->
							<c:if test="${sessionScope.user.userRole == 'admin'}">
								<h4 style="float: right; margin-top: 0px">
									<a class="label label-warning" title="添加会议室"
										href="add_meetingroom.jsp">添加</a>
								</h4>
								<div class="clearfix"></div>
							</c:if>

							<div class="graph">
								<div class="tables">
									<table class="table table-hover">
										<thead>
											<tr>
												<th width="15%">
													#
												</th>
												<th width="20%">
													编号
												</th>
												<th width="25%">
													名称
												</th>
												<th width="15%">
													容量
												</th>
												<th width="25%">
													操作
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="meetingRoom" items="${meetingRooms}"
												varStatus="status">
												<tr>
													<th scope="row">
														${status.count}
													</th>
													<td>
														${meetingRoom.no}
													</td>
													<td>
														${meetingRoom.mrName}
													</td>
													<td>
														${meetingRoom.capacity}
													</td>
													<td>
														<div class="share share_size_large share_type_twitter" 
															style="width: 50px">
															<a class="share__btn"
																href="query_mr_detail.jsp?mrId=${meetingRoom.mrId}&no=${meetingRoom.no}">查看</a>
														</div>

														<c:if test="${sessionScope.user.userRole == 'admin'}">
															<div class="share share_size_large share_type_facebook"
																style="width: 50px">
																<a class="share__btn"
																	href="<%=basePath%>meetingRoom/queryMeetingRoomById?mrId=${meetingRoom.mrId}">修改</a>
															</div>
															<div class="share share_size_large share_type_gplus"
																style="width: 50px">
																<a class="share__btn"
																	href="<%=basePath%>meetingRoom/removeMeetingRoom?mrId=${meetingRoom.mrId}">删除</a>
															</div>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="clearfix"></div>

							<div style="margin-left: 25%; text-align: center; float: left">
								<nav>
								<ul class="pagination">
									<c:if test="${pageIndex == 1}">
										<li class="disabled">
											<a>«首页</a>
										</li>
										<li class="disabled">
											<a aria-label="Previous"><span aria-hidden="true">&lt上一页</span>
											</a>
										</li>
									</c:if>
									<c:if test="${pageIndex > 1}">
										<li>
											<a onclick="jump('1')">«首页</a>
										</li>
										<li>
											<a onclick="jump(${pageIndex - 1})" aria-label="Previous"><span
												aria-hidden="true">&lt上一页</span> </a>
										</li>
									</c:if>
									<li class="active">
										<a>${pageIndex}<span class="sr-only">(current)</span> </a>
									</li>
									<c:if test="${pageIndex < totalPages}">
										<li>
											<a onclick="jump(${pageIndex + 1})" aria-label="Next"><span
												aria-hidden="true">下一页&gt</span> </a>
										</li>
										<li>
											<a onclick="jump(${totalPages})">末页»</a>
										</li>
									</c:if>
									<c:if test="${pageIndex >= totalPages}">
										<li class="disabled">
											<a aria-label="Next"><span aria-hidden="true">下一页&gt</span>
											</a>
										</li>
										<li class="disabled">
											<a>末页»</a>
										</li>
									</c:if>
								</ul>
								</nav>
							</div>

							
							<div style="margin: 18px 0 0 10%; width: 40px; height: 30px; float: left">
								<input type="text" class="form-control" id="inputpage"
									title="请输入页码">
							</div>
							<div class="share share_size_large share_type_facebook"
								style="margin: 24px 0 0 1%; width: 50px; float: left">
								<a class="share__btn" onclick="checkAndJmp('${totalPages}')">跳转</a>
							</div>
							<div style="margin: 32px 0 0 1%; width: 100px; float: left">
								第${pageIndex}页 / 共${totalPages}页
							</div>
							<div class="clearfix"></div>
							
							<div class="alert alert-danger" role="alert" id="errorinfo">
								<strong>Oh snap!</strong>
							</div>
<script type="text/javascript">
$("#errorinfo").hide();
function checkAndJmp(totalPages) {
	var pageIndex = $("#inputpage").val();
	var re = /^[0-9]*$/;
	if (pageIndex == "") {
		$("#errorinfo").html("<strong>输入错误!</strong>  请输入页码.");
		$("#errorinfo").show();
		return false;
	} else if (!re.test(pageIndex)) {
		$("#errorinfo").html("<strong>输入错误!</strong>  请输入数字.");
		$("#errorinfo").show();
		return false;
	} else if (eval(pageIndex) < eval(1)) {
		$("#errorinfo").html("<strong>输入错误!</strong>  请输入1-" + totalPages + "的数字.");
		$("#errorinfo").show();
		return false;
	} else if (eval(pageIndex) > eval(totalPages)) {
		$("#errorinfo").html("<strong>输入错误!</strong>  请输入1-" + totalPages + "的数字.");
		$("#errorinfo").show();
		return false;
	} else {
		$("#errorinfo").html("");
		$("#errorinfo").hide();
		jump(pageIndex);
	}
}

function jump(pageIndex) {
	$("#pi").val(pageIndex);
	$("form").submit();
}
</script>
						</div>
						<!-- //content -->

						<!--//outer-wp-->
					</div>
				</div>
			</div>
			<!--//content-inner-->


			<!--/sidebar-menu-->
			<c:choose>
				<c:when test="${sessionScope.user.userRole == 'admin'}">
					<div class="sidebar-menu">
						<header class="logo">
						<a class="sidebar-icon"> <span class="fa fa-bars"></span>
						</a>
						<a href="index.jsp"> <span id="logo">
								<h1>
									MMS
								</h1> </span> <!--<img id="logo" src="" alt="Logo"/>--> </a>
						</header>
						<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
						<!--/down-->
						<div class="down">
							<a href="query_myuserinfo.jsp" title="更换头像"><img
									src="${sessionScope.user.avatar}"
									alt="avatar/default_avatar.jpg"> </a>
							<a href="query_myuserinfo.jsp" title="修改昵称"><span
								class=" name-caret">${sessionScope.user.nickname}</span> </a>
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
									<a><i class="fa fa-table"></i> <span>会议室查询</span>
										<span class="fa fa-angle-right" style="float: right"></span> </a>
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
									<a><i class="fa fa-file-text-o"></i> <span>会议查询</span> <span
										class="fa fa-angle-right" style="float: right"></span> </a>
									<ul id="menu-academico-sub">
										<li id="menu-academico-avaliacoes">
											<a href="query_meetingtobehold_view.jsp">会议日程</a>
										</li>
										<li id="menu-academico-avaliacoes">
											<a
												href="<%=basePath%>meetingDetail/queryMeetingDetailToBeHold?pageIndex=1">即将召开</a>
										</li>
										<li id="menu-academico-boletim">
											<a
												href="<%=basePath%>meetingDetail/queryMeetingDetailAlreadyHold?pageIndex=1">历史会议</a>
										</li>
										<li id="menu-academico-avaliacoes">
											<a
												href="<%=basePath%>meetingDetail/queryMeetingDetailByRole?pageIndex=1">上传记录</a>
										</li>
									</ul>
								</li>
								<li id="menu-academico">
									<a><i class="lnr lnr-book"></i> <span>会议预约</span>
										<span class="fa fa-angle-right" style="float: right"></span> </a>
									<ul id="menu-academico-sub">
										<li id="menu-academico-avaliacoes">
											<a
												href="<%=basePath%>meeting/queryMeetingByMyScheduled?pageIndex=1">我的预约</a>
										</li>
										<li id="menu-academico-boletim">
											<a href="<%=basePath%>resource/queryAvailableResources">新建预约</a>
										</li>
									</ul>
								</li>
								<li id="menu-academico">
									<a><i class="lnr lnr-layers"></i> <span>人员管理</span>
										<span class="fa fa-angle-right" style="float: right"></span> </a>
									<ul id="menu-academico-sub">
										<li id="menu-academico-avaliacoes">
											<a href="query_user.jsp">查询修改</a>
										</li>
										<li id="menu-academico-boletim">
											<a href="add_user.jsp">添加人员</a>
										</li>
									</ul>
								</li>
								<li id="menu-academico">
									<a><i class="lnr lnr-chart-bars"></i> <span>资源管理</span>
										<span class="fa fa-angle-right" style="float: right"></span> </a>
									<ul id="menu-academico-sub">
										<li id="menu-academico-avaliacoes">
											<a href="query_resource.jsp">查询修改</a>
										</li>
										<li id="menu-academico-boletim">
											<a href="add_resource.jsp">添加设备</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="<%=basePath%>message/queryMessageToMe"><i
										class="lnr lnr-envelope"></i> <span>消息中心</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="sidebar-menu">
						<header class="logo">
						<a class="sidebar-icon"> <span class="fa fa-bars"></span>
						</a>
						<a href="index.jsp"> <span id="logo">
								<h1>
									MMS
								</h1> </span> <!--<img id="logo" src="" alt="Logo"/>--> </a>
						</header>
						<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
						<!--/down-->
						<div class="down">
							<a href="query_myuserinfo.jsp" title="更换头像"><img
									src="${sessionScope.user.avatar}"
									alt="avatar/default_avatar.jpg"> </a>
							<a href="query_myuserinfo.jsp" title="修改昵称"><span
								class=" name-caret">${sessionScope.user.nickname}</span> </a>
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
									<a><i class="fa fa-table"></i> <span>会议室查询</span> <span
										class="fa fa-angle-right" style="float: right"></span> </a>
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
									<a><i class="fa fa-file-text-o"></i> <span>我的会议</span> <span
										class="fa fa-angle-right" style="float: right"></span> </a>
									<ul id="menu-academico-sub">
										<li id="menu-academico-avaliacoes">
											<a href="query_meetingtobehold_view.jsp">会议日程</a>
										</li>
										<li id="menu-academico-avaliacoes">
											<a
												href="<%=basePath%>meetingDetail/queryMeetingDetailToBeHold?pageIndex=1">即将召开</a>
										</li>
										<li id="menu-academico-boletim">
											<a
												href="<%=basePath%>meetingDetail/queryMeetingDetailAlreadyHold?pageIndex=1">历史会议</a>
										</li>
										<li id="menu-academico-avaliacoes">
											<a
												href="<%=basePath%>meetingDetail/queryMeetingDetailByRole?pageIndex=1">上传记录</a>
										</li>
									</ul>
								</li>
								<li id="menu-academico">
									<a><i class="lnr lnr-book"></i> <span>会议预约</span> <span
										class="fa fa-angle-right" style="float: right"></span> </a>
									<ul id="menu-academico-sub">
										<li id="menu-academico-avaliacoes">
											<a
												href="<%=basePath%>meeting/queryMeetingByMyScheduled?pageIndex=1">我的预约</a>
										</li>
										<li id="menu-academico-boletim">
											<a href="<%=basePath%>resource/queryAvailableResources">新建预约</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="<%=basePath%>message/queryMessageToMe"><i
										class="lnr lnr-envelope"></i> <span>消息中心</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			
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