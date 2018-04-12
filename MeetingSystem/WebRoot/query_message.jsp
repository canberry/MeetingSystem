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
								<li class="active">
									消息中心
								</li>
							</ol>
						</div>
						<!--/sub-heard-part-->
						<!--/inbox-->
						<div class="inbox-mail">
							<div class="col-md-4 compose">
								<form action="#" method="GET">
									<div class="input-group input-group-in">
										<input type="text" name="search"
											class="form-control2 input-search" placeholder="Search...">
										<span class="input-group-btn">
											<button class="btn btn-success" type="button">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
									<!-- Input Group -->
								</form>
								<h2>
									操作栏
								</h2>
								<nav class="nav-sidebar">
								<ul class="nav tabs">
									<li class="active">
										<a href="#tab1" data-toggle="tab"><i class="fa fa-inbox"></i> 收件箱
											<span>${unReadMessages.size()}</span>
										<div class="clearfix"></div>
										</a>
									</li>
									<li class="">
										<a href="#tab2" data-toggle="tab"><i
											class="fa fa-share-square-o"></i> 发件箱</a>
									</li>
									<li class="">
										<a href="#tab3" data-toggle="tab"><i class="fa fa-star-o"></i>去写信</a>
									</li>
									<li class="">
										<a href="#tab4" data-toggle="tab"><i
											class="fa fa-pencil-square-o"></i>草稿箱
										<div class="clearfix"></div>
										</a>
									</li>
									<li class="">
										<a href="#tab5" data-toggle="tab"><i class="fa fa-trash-o"></i>垃圾箱</a>
									</li>
								</ul>
								</nav>
								<div class="content-box">
									<ul>
										<li>
											<span>收藏夹</span>
										</li>
										<li>
											<a><i class="fa fa-folder-o"></i>任务</a>
										</li>
										<li>
											<a><i class="fa fa-folder-o"></i>标签</a>
										</li>
										<li>
											<a><i class="fa fa-folder-o"></i>日历</a>
										</li>
									</ul>
								</div>

							</div>
							<!-- tab content -->
							<div class="col-md-8 tab-content tab-content-in">
								<div class="tab-pane active text-style" id="tab1">
									<div class="inbox-right">

										<div class="mailbox-content">
											<div class="mail-toolbar clearfix">
												<div class="float-left">
													<div class="btn-group m-r-sm mail-hidden-options"
														style="display: inline-block;">
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-folder"></i> <span class="caret"></span>
															</a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a href="#tab11" data-toggle="tab">已读</a>
																</li>
																<li>
																	<a href="#tab12" data-toggle="tab">未读</a>
																</li>
																<li>
																	<a href="#tab1" data-toggle="tab">全部</a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-tags"></i> <span class="caret"></span>
															</a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a>Work</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="float-right">
													<div class="dropdown">
														<a href="#" title="" class="btn btn-default"
															data-toggle="dropdown" aria-expanded="false"> <i
															class="fa fa-cog icon_8"></i> <i
															class="fa fa-chevron-down icon_8"></i>
															<div class="ripple-wrapper"></div>
														</a>
														<ul class="dropdown-menu float-right">
															<li>
																<a title=""> <i
																	class="fa fa-pencil-square-o icon_9"></i> Edit </a>
															</li>
														</ul>
													</div>
												</div>

											</div>
											<table class="table">
												<tr class="table-row">
													<td class="table-img" style="width: 19%">
														<strong>#</strong>
													</td>
													<td class="table-text" style="width: 34%">
														<strong>发件人</strong>
													</td>
													<td style="width: 15%; text-align: center">
														<strong>是否已读</strong>
													</td>
													<td class="march" style="width: 23%; text-align: center">
														<strong>发送时间</strong>
													</td>
													<td>
														<strong>操作</strong>
													</td>
												</tr>
												<tbody>
													<c:forEach var="message" items="${messagesToMe}">
														<tr class="table-row">
															<td class="table-img" style="width: 19%">
																<img src="${message.sendUser.avatar}" alt="" />
															</td>
															<td class="table-text" style="width: 34%">
																<h6>
																	${message.sendUser.userName}
																</h6>
																<p>
																	${message.messageName}
																</p>
															</td>
															<td style="width: 15%">
																<c:choose>
																	<c:when test="${message.scan == 'no'}">
																		<span class="ur">未读</span>
																	</c:when>
																	<c:otherwise>
																		<span class="fam">已读</span>
																	</c:otherwise>
																</c:choose>
															</td>
															<fmt:parseDate var="startObj" value="${message.sendTime}"
																type="DATE" pattern="yyyy-MM-dd HH:mm" />
															<fmt:formatDate var="sendTime" value='${startObj}'
																pattern='yyyy-MM-dd HH:mm' />
															<td class="march" style="width: 23%">
																${sendTime}
															</td>
															<td>
																<h4>
																	<a class="label label-info" onclick="queryMsgById('${message.messageId}')">查看</a>
																</h4>
																<h4>
																	<a class="label label-warning" onclick="removeMessageToMe('${message.messageId}')">删除</a>
																</h4>
															</td>
														</tr>
													</c:forEach>
													<c:if test="${messagesToMe.isEmpty()}">
														<h5>
															<div class="alert alert-success" role="alert">
																<strong>未收到消息!</strong>
															</div>
														</h5>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
<script type="text/javascript">
function queryMsgById(msgId) {
	window.location.href = "<%=basePath%>message/queryMessageById?msgId=" + msgId;
}

function removeMessageToMe(msgId) {
	window.location.href = "<%=basePath%>message/removeMessageToMe?msgId=" + msgId;
}
</script>
								<div class="tab-pane text-style" id="tab11">
									<div class="inbox-right">

										<div class="mailbox-content">
											<div class="mail-toolbar clearfix">
												<div class="float-left">
													<div class="btn-group m-r-sm mail-hidden-options"
														style="display: inline-block;">
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-folder"></i> <span class="caret"></span>
															</a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a>已读</a>
																</li>
																<li>
																	<a href="#tab12" data-toggle="tab">未读</a>
																</li>
																<li>
																	<a href="#tab1" data-toggle="tab">全部</a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-tags"></i> <span class="caret"></span>
															</a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a>Work</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="float-right">
													<div class="dropdown">
														<a href="#" title="" class="btn btn-default"
															data-toggle="dropdown" aria-expanded="false"> <i
															class="fa fa-cog icon_8"></i> <i
															class="fa fa-chevron-down icon_8"></i>
															<div class="ripple-wrapper"></div>
														</a>
														<ul class="dropdown-menu float-right">
															<li>
																<a title=""> <i
																	class="fa fa-pencil-square-o icon_9"></i> Edit </a>
															</li>
														</ul>
													</div>
												</div>

											</div>
											<table class="table">
												<tr class="table-row">
													<td class="table-img" style="width: 19%">
														<strong>#</strong>
													</td>
													<td class="table-text" style="width: 34%">
														<strong>发件人</strong>
													</td>
													<td style="width: 15%; text-align: center">
														<strong>是否已读</strong>
													</td>
													<td class="march" style="width: 23%; text-align: center">
														<strong>发送时间</strong>
													</td>
													<td>
														<strong>操作</strong>
													</td>
												</tr>
												<tbody>
													<c:forEach var="message" items="${alreadMessages}">
														<tr class="table-row">
															<td class="table-img" style="width: 19%">
																<img src="${message.sendUser.avatar}" alt="" />
															</td>
															<td class="table-text" style="width: 34%">
																<h6>
																	${message.sendUser.userName}
																</h6>
																<p>
																	${message.messageName}
																</p>
															</td>
															<td style="width: 15%">
																<c:choose>
																	<c:when test="${message.scan == 'no'}">
																		<span class="ur">未读</span>
																	</c:when>
																	<c:otherwise>
																		<span class="fam">已读</span>
																	</c:otherwise>
																</c:choose>
															</td>
															<fmt:parseDate var="startObj" value="${message.sendTime}"
																type="DATE" pattern="yyyy-MM-dd HH:mm" />
															<fmt:formatDate var="sendTime" value='${startObj}'
																pattern='yyyy-MM-dd HH:mm' />
															<td class="march" style="width: 23%">
																${sendTime}
															</td>
															<td>
																<h4>
																	<a class="label label-info" onclick="queryMsgById('${message.messageId}')">查看</a>
																</h4>
																<h4>
																	<a class="label label-warning" onclick="removeMessageToMe('${message.messageId}')">删除</a>
																</h4>
															</td>
														</tr>
													</c:forEach>
													<c:if test="${alreadMessages.isEmpty()}">
														<h5>
															<div class="alert alert-success" role="alert">
																<strong>没有已读消息!</strong>
															</div>
														</h5>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<div class="tab-pane text-style" id="tab12">
									<div class="inbox-right">

										<div class="mailbox-content">
											<div class="mail-toolbar clearfix">
												<div class="float-left">
													<div class="btn-group m-r-sm mail-hidden-options"
														style="display: inline-block;">
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-folder"></i> <span class="caret"></span> </a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a href="#tab11" data-toggle="tab">已读</a>
																</li>
																<li>
																	<a>未读</a>
																</li>
																<li>
																	<a href="#tab1" data-toggle="tab">全部</a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-tags"></i> <span class="caret"></span> </a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a>Work</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="float-right">
													<div class="dropdown">
														<a href="#" title="" class="btn btn-default"
															data-toggle="dropdown" aria-expanded="false"> <i
															class="fa fa-cog icon_8"></i> <i
															class="fa fa-chevron-down icon_8"></i>
															<div class="ripple-wrapper"></div> </a>
														<ul class="dropdown-menu float-right">
															<li>
																<a title=""> <i class="fa fa-pencil-square-o icon_9"></i>
																	Edit </a>
															</li>
														</ul>
													</div>
												</div>

											</div>
											<table class="table">
												<tr class="table-row">
													<td class="table-img" style="width: 19%">
														<strong>#</strong>
													</td>
													<td class="table-text" style="width: 34%">
														<strong>发件人</strong>
													</td>
													<td style="width: 15%; text-align: center">
														<strong>是否已读</strong>
													</td>
													<td class="march" style="width: 23%; text-align: center">
														<strong>发送时间</strong>
													</td>
													<td>
														<strong>操作</strong>
													</td>
												</tr>
												<tbody>
													<c:forEach var="message" items="${unReadMessages}">
														<tr class="table-row">
															<td class="table-img" style="width: 19%">
																<img src="${message.sendUser.avatar}" alt="" />
															</td>
															<td class="table-text" style="width: 34%">
																<h6>
																	${message.sendUser.userName}
																</h6>
																<p>
																	${message.messageName}
																</p>
															</td>
															<td style="width: 15%">
																<c:choose>
																	<c:when test="${message.scan == 'no'}">
																		<span class="ur">未读</span>
																	</c:when>
																	<c:otherwise>
																		<span class="fam">已读</span>
																	</c:otherwise>
																</c:choose>
															</td>
															<fmt:parseDate var="startObj" value="${message.sendTime}"
																type="DATE" pattern="yyyy-MM-dd HH:mm" />
															<fmt:formatDate var="sendTime" value='${startObj}'
																pattern='yyyy-MM-dd HH:mm' />
															<td class="march" style="width: 23%">
																${sendTime}
															</td>
															<td>
																<h4>
																	<a class="label label-info" onclick="queryMsgById('${message.messageId}')">查看</a>
																</h4>
																<h4>
																	<a class="label label-warning" onclick="removeMessageToMe('${message.messageId}')">删除</a>
																</h4>
															</td>
														</tr>
													</c:forEach>

													<c:if test="${unReadMessages.isEmpty()}">
														<h5>
															<div class="alert alert-success" role="alert">
																<strong>没有未读消息!</strong>
															</div>
														</h5>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<div class="tab-pane text-style" id="tab2">
									<div class="inbox-right">

										<div class="mailbox-content">
											<div class="mail-toolbar clearfix">
												<div class="float-left">
													<div class="btn-group m-r-sm mail-hidden-options"
														style="display: inline-block;">
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-folder"></i> <span class="caret"></span>
															</a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a>Social</a>
																</li>
																<li>
																	<a>Forums</a>
																</li>
															</ul>
														</div>
														<div class="btn-group">
															<a class="btn btn-default dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-tags"></i> <span class="caret"></span>
															</a>
															<ul class="dropdown-menu dropdown-menu-right" role="menu">
																<li>
																	<a>Work</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="float-right">
													<div class="dropdown">
														<a href="#" title="" class="btn btn-default"
															data-toggle="dropdown" aria-expanded="false"> <i
															class="fa fa-cog icon_8"></i> <i
															class="fa fa-chevron-down icon_8"></i>
															<div class="ripple-wrapper"></div>
														</a>
														<ul class="dropdown-menu float-right">
															<li>
																<a title=""> <i
																	class="fa fa-pencil-square-o icon_9"></i> Edit </a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											
											<table class="table">
												<tbody>
													<tr class="table-row">
														<td class="table-img"
															style="width: 19%">
															<strong>#</strong>
														</td>
														<td class="table-text"
															style="width: 34%">
															<strong>收件人</strong>
														</td>
														<td style="width: 15%; text-align: center">
															<strong>是否已读</strong>
														</td>
														<td class="march" style="width: 23%; text-align: center">
															<strong>发送时间</strong>
														</td>
														<td>
															<strong>操作</strong>
														</td>
													</tr>
													<c:forEach var="message" items="${messagesFromMe}">
														<tr class="table-row">
															<td class="table-img" style="width: 19%">
																<img src="${message.receiveUser.avatar}" alt="" />
															</td>
															<td class="table-text" style="width: 34%">
																<h6>
																	${message.receiveUser.userName}
																</h6>
																<p>
																	${message.messageName}
																</p>
															</td>
															<td style="width: 15%">
																<c:choose>
																	<c:when test="${message.scan == 'no'}">
																		<span class="ur">对方未读</span>
																	</c:when>
																	<c:otherwise>
																		<span class="fam">对方已读</span>
																	</c:otherwise>
																</c:choose>
															</td>
															<fmt:parseDate var="startObj" value="${message.sendTime}"
																type="DATE" pattern="yyyy-MM-dd HH:mm" />
															<fmt:formatDate var="sendTime" value='${startObj}'
																pattern='yyyy-MM-dd HH:mm' />
															<td class="march" style="width: 23%">
																${sendTime}
															</td>
															<td>
																<h4>
																	<a class="label label-info" 
																	   href="<%=basePath%>message/queryMessageFromMe?msgId=${message.messageId}">查看</a>
																</h4>
																<h4>
																	<a class="label label-warning" 
																	   href="<%=basePath%>message/removeMessageFromMe?msgId=${message.messageId}">删除</a>
																</h4>
															</td>
														</tr>
													</c:forEach>

													<c:if test="${messagesFromMe.isEmpty()}">
														<h5>
															<div class="alert alert-success" role="alert">
																<strong>未发送消息!</strong>
															</div>
														</h5>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<div class="tab-pane text-style" id="tab3">
									<div class="inbox-right">

										<div class="mailbox-content">
											<!--Compose New Message -->
											<div class="compose-mail-box">
												<div class="compose-bg">
													新建消息
												</div>
												<div class="panel-body">
													<div class="alert alert-info">
														请填写消息
													</div>
													<form class="com-mail">
														<input type="text" class="form-control1 control3" name="receiveUserId" 
															placeholder="To :">
														<input type="text" class="form-control1 control3" name="messageName" 
															placeholder="Subject :">
														<textarea rows="6" class="form-control1 control2" name="content" 
															placeholder="Message :"></textarea>
														<input type="submit" value="发送" style="float: right">
													</form>
												</div>
											</div>
											<!--//Compose New Message -->
										</div>
									</div>
								</div>
								
								<div class="tab-pane text-style" id="tab4">
									<div class="inbox-right">
										<div class="mailbox-content">
										
										</div>
									</div>
								</div>
								
								<div class="tab-pane text-style" id="tab5">
									<div class="inbox-right">
										<div class="mailbox-content">
										
										</div>
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