<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.lxm.bean.MeetingRoom" %>
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
		
		<!-- time -->
		<script type="text/javascript" src="laydate/laydate.js"></script>
		<!-- //timessss -->
		
		<!-- upload -->
		<link href="fileupload/css/iconfont.css" rel="stylesheet" type="text/css"/>
        <link href="fileupload/css/fileUpload.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="fileupload/js/fileUpload.js"></script>
		<!-- //upload -->
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
</script>
							<!--/profile_details-->
							<div class="profile_details_left">
								<ul class="nofitications-dropdown">
									<li class="dropdown note">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											aria-expanded="false"><i class="fa fa-bell-o"></i> <span
											class="badge">5</span> </a>

										<ul class="dropdown-menu two">
											<li>
												<div class="notification_header">
													<h3>
														You have 5 new notification
													</h3>
												</div>
											</li>
											<li>
												<a href="#">
													<div class="user_img">
														<img src="images/in.jpg" alt="">
													</div>
													<div class="notification_desc">
														<p>
															Lorem ipsum dolor sit amet
														</p>
														<p>
															<span>1 hour ago</span>
														</p>
													</div>
													<div class="clearfix"></div> </a>
											</li>
											<li class="odd">
												<a href="#">
													<div class="user_img">
														<img src="images/in5.jpg" alt="">
													</div>
													<div class="notification_desc">
														<p>
															Lorem ipsum dolor sit amet
														</p>
														<p>
															<span>1 hour ago</span>
														</p>
													</div>
													<div class="clearfix"></div> </a>
											</li>
											<li>
												<a href="#">
													<div class="user_img">
														<img src="images/in8.jpg" alt="">
													</div>
													<div class="notification_desc">
														<p>
															Lorem ipsum dolor sit amet
														</p>
														<p>
															<span>1 hour ago</span>
														</p>
													</div>
													<div class="clearfix"></div> </a>
											</li>
											<li>
												<div class="notification_bottom">
													<a href="#">See all notification</a>
												</div>
											</li>
										</ul>
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
								<li>
									<c:if test="${param.action == 1}">
										<a href="<%=basePath%>meetingDetail/queryMeetingDetailToBeHold">即将召开</a>
									</c:if>
									<c:if test="${param.action == 2}">
										<a href="<%=basePath%>meetingDetail/queryMeetingDetailAlreadyHold">历史会议</a>
									</c:if>
									<c:if test="${param.action == 3}">
										<a href="<%=basePath%>meetingDetail/queryMeetingDetailByRole">上传记录</a>
									</c:if>
								</li>
								<li class="active">
									会议详情
								</li>
							</ol>
						</div>
						<!--//sub-heard-part-->

						<!-- content -->
						<!--/inbox-->
						<div class="inbox-mail">
							<div class="col-md-4 compose">

								<fmt:parseDate var="startObj"
									value="${meeting.startTime}" type="DATE"
									pattern="yyyy-MM-dd HH:mm" />
								<fmt:formatDate var="startTime" value='${startObj}'
									pattern='yyyy-MM-dd HH:mm' />
								<fmt:parseDate var="endObj"
									value="${meeting.endTime}" type="DATE"
									pattern="yyyy-MM-dd HH:mm" />
								<fmt:formatDate var="endTime" value='${endObj}'
									pattern='yyyy-MM-dd HH:mm' />
								<fmt:parseDate var="scheduledObj"
									value="${meeting.scheduledTime}" type="DATE"
									pattern="yyyy-MM-dd HH:mm" />
								<fmt:formatDate var="scheduledTime" value='${scheduledObj}'
									pattern='yyyy-MM-dd HH:mm' />
								<h2>
									会议基本信息
								</h2>
								<nav class="nav-sidebar">
								<ul class="nav tabs">
									<li class="">
										<a>
										    <strong>会议主题:&nbsp;&nbsp;&nbsp;&nbsp;</strong>${meeting.mName}
											<div class="clearfix"></div>
										</a>
									</li>
									<li class="">
										<a>
										    <strong>开始时间:&nbsp;&nbsp;&nbsp;&nbsp;</strong>${startTime}
										</a>
									</li>
									<li class="">
										<a>
										    <strong>结束时间:&nbsp;&nbsp;&nbsp;&nbsp;</strong>${endTime}
										</a>
									</li>
									<li class="">
										<a>
										    <strong>会议室:&nbsp;&nbsp;&nbsp;&nbsp;</strong>${meeting.meetingRoom.no}
										<div class="clearfix"></div>
										</a>
									</li>
									<li class="">
										<a>
										    <strong>会议状态:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
										    <c:choose>
										        <c:when test="${meeting.cancel == 'no'}">
										        正常
										        </c:when>
										        <c:otherwise>
										        已取消
										        </c:otherwise>
										    </c:choose>
										</a>
									</li>
									<li class="">
										<a>
										    <strong>预定人:&nbsp;&nbsp;&nbsp;&nbsp;</strong>${meeting.scheduler.userName}
										</a>
									</li>
									<li class="">
										<a>
										    <strong>预定时间:&nbsp;&nbsp;&nbsp;&nbsp;</strong>${scheduledTime}
										</a>
									</li>
								</ul>
								</nav>

								<c:if test="${param.action != 1}">
									<h2>
										会议记录
									</h2>
									<nav class="nav-sidebar">
									
									<form id="downform" method="post"></form>
									<ul class="nav tabs">
										<c:forEach var="document" items="${documents}"
											varStatus="status">
											<li class="" id="doc${document.docId}" 
											    onclick="down('${document.path}')" title="点击下载此文件">
												<a>${status.count}、${document.docName}</a>
											</li>
										</c:forEach>

										<c:if test="${documents.isEmpty()}">
										    <li class="">
												<a><i>未上传记录</i></a>
											</li>
										</c:if>
										
										<c:if test="${param.action != 1}">
											<c:if test="${md.role == 'recorder'}">
											    <li class="" data-toggle="modal" data-target="#myModal">
												    <a><i><strong>点击上传</strong></i></a>
											    </li>
											</c:if>
										</c:if>
									</ul>
									</nav>
								</c:if>
<script type="text/javascript">
function down(filePath) {
	var ac = "<%=basePath%>document/downloadDocument?path=" + filePath;
	$("#downform").attr("action", ac);
	$("#downform").submit();
}
</script>

								<h2>
									借用资源
								</h2>
								<nav class="nav-sidebar">
								<ul class="nav tabs">
									<c:forEach var="meetingResource" items="${meetingResources}"
										varStatus="status">
										<li>
											<a>${status.count}、${meetingResource.resource.rName} <i
												style="float: right">数量：&nbsp;${meetingResource.number}</i>
											</a>
										</li>
									</c:forEach>
									<c:if test="${meetingResources.isEmpty()}">
										<li class="">
											<a><i>未借用</i>
											</a>
										</li>
									</c:if>
								</ul>
								</nav>
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
														
														<input id="mid" value="${meeting.mId}" type="hidden">
														<c:if test="${param.action != 1}">
															<c:if test="${md.role == 'recorder'}">
																<h4>
																	<a class="label label-warning" data-toggle="modal" data-target="#myModal">上传会议记录</a>
																</h4>
																<h4>
																	<a class="label label-info" data-toggle="modal" data-target="#deleteModal">删除会议记录</a>
																</h4>
																
																<div class="modal fade" id="deleteModal" tabindex="-1"
																	role="dialog" aria-labelledby="deleteModalLabel"
																	aria-hidden="true" style="display: none;">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<button type="button" class="close second"
																					data-dismiss="modal" aria-hidden="true">
																					×
																				</button>
																				<h2 class="modal-title">
																					删除会议记录
																				</h2>
																			</div>
																			<div class="modal-body">
																				<nav class="nav-sidebar">
																				<ul class="nav tabs">
																					<c:forEach var="document" items="${documents}"
																						varStatus="status">
																						<li class="" id="record${document.docId}">
																							<a>${status.count}、${document.docName}
																								<button class="share__btn"
																									style="background: #3B5999; float: right" 
																									onclick="remove('${document.docId}', '${document.path}')">
																									删除
																								</button> </a>
																						</li>
																					</c:forEach>
																					<c:if test="${documents.isEmpty()}">
																						<li class="">
																							<a><i>未上传记录</i></a>
																						</li>
																					</c:if>
																				</ul>
																				</nav>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-default"
																					data-dismiss="modal">
																					Close
																				</button>
																			</div>
<script type="text/javascript">
function remove(docId, path) {
	    if (!confirm("确认删除？")) {
	    	return false;
	    }
	
	    $.post("<%=basePath%>document/removeDocument", 
            {docId : docId,
	    	 path : path}, 
		    function(data) {
                if (data == "ok") {
                	var did = "#record" + docId;
                	var doc = "#doc" + docId;
                	$(did).html("");
                	$(doc).html("");
                } else {
                	alert("删除失败");
                }
		});
}
</script>
																		</div>
																		<!-- /.modal-content -->
																	</div>
																	<!-- /.modal-dialog -->
																</div>
																
																<div class="modal fade" id="myModal" tabindex="-1"
																	role="dialog" aria-labelledby="myModalLabel"
																	aria-hidden="true" style="display: none;">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<button type="button" class="close second"
																					data-dismiss="modal" aria-hidden="true">
																					×
																				</button>
																				<h2 class="modal-title">
																					上传会议记录
																				</h2>
																			</div>
																			<div class="modal-body">
																				<hr>

																				<div id="fileUploadContent" class="fileUploadContent"></div>
<script type="text/javascript">
var meetingId = $("#mid").val();
$("#fileUploadContent").initUpload(
		{
			"uploadUrl" : "<%=basePath%>document/addDocument?meetingId=" + meetingId, //上传文件信息地址
			"size" : 204800,//文件大小限制，单位kb,默认不限制
			"maxFileNumber" : 3,//文件个数限制，为整数
			"onUpload" : onUploadFun, //在上传后执行的函数
			"fileType" : [ 'png', 'jpg', 'docx', 'doc', 'pdf', 'ppt', 'pptx',
					'xlsx', 'xls', 'txt', 'vsdx' ] //文件类型限制，默认不限制，注意写的是文件后缀
		});

function onUploadFun(opt, data) {
	if (data == "ok") {
		uploadTools.uploadSuccess(opt);//显示上传成功
		clickDetail(clickDetail());
	} else {
		uploadTools.uploadError(opt);//显示上传错误
		alert("上传失败")
	}
}

function clickDetail() {
	var action = $("#action").val();
	var meetingId = $("#mid").val();
	window.location.href = "<%=basePath%>meeting/queryMeetingDetailAndResourceById?meetingId=" + meetingId + "&action=" + action;
}
</script>
																			</div>

																			<div class="modal-footer">
																				<button type="button" class="btn btn-default"
																					data-dismiss="modal">
																					Close
																				</button>
																			</div>
																		</div>
																		<!-- /.modal-content -->
																	</div>
																	<!-- /.modal-dialog -->
																</div>

															</c:if>
														</c:if>
														
														<input type="hidden" id="action" value="${param.action}"/>
														<c:if test="${param.action == 1}">
														    <h4 id="yes"><span class="label label-primary">已同意</span></h4>
														    <h4 id="no"><span class="label label-default">已拒绝</span></h4>
															<c:choose>
																<c:when test="${md.optional == 'no'}">
																	<span class="label label-danger">必须参加</span>
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${md.will == 'yes'}">
																			<h4><span class="label label-primary">已同意</span></h4>
																		</c:when>
																		<c:when test="${md.will == 'no'}">
																			<h4><span class="label label-default">已拒绝</span></h4>
																		</c:when>
																		<c:otherwise>
																			<a id="doyes" class="label label-primary" onclick="changeWill(${meeting.mId}, 'yes')">参加</a>
																			<a id="dono" class="label label-default" onclick="changeWill(${meeting.mId}, 'no')">不参加</a>
																		</c:otherwise>
																	</c:choose>
																</c:otherwise>
															</c:choose>
														</c:if>
<script type="text/javascript">
$("#yes").hide();
$("#no").hide();
function changeWill(mId, will) {
	$.post("<%=basePath%>meetingDetail/modifyWill", {
		"mId" : mId,
		"will" : will
	}, function(data) {
		if (data == "ok") {
			if (will == "yes") {
			    $("#yes").show();
				$("#doyes").hide();
				$("#dono").hide();
			} else {
				$("#no").show();
				$("#doyes").hide();
				$("#dono").hide();
			}
		} else {
			alert("操作失败!");
		}
	});
}
</script>
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
																<a href="#" title=""> <i
																	class="fa fa-pencil-square-o icon_9"></i> Edit </a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<table class="table">
												<tbody>
												<tr class="table-row">
														<td class="table-img" style="width: 17%">
														    <strong>#</strong>
														</td>
														<td class="table-text" style="width: 31%">
															<strong>人员信息</strong>
														</td>
														<td style="width: 17%">
															<strong>会议角色</strong>
														</td>
														<td style="width: 17%">
															<strong>重要性</strong>
														</td>
														<td style="width: 17%">
														    <strong>意愿</strong>
														</td>
														<c:forEach var="meetingDetail" items="${meetingDetails}">
														<tr class="table-row">
															<td class="table-img" style="width: 17%">
																<img src="${meetingDetail.user.avatar}" alt="" />
															</td>
															<td class="table-text" style="width: 31%">
																<h6>
																	${meetingDetail.user.userName}
																</h6>
																<p>
																	职位：&nbsp;${meetingDetail.user.position}
																</p>
															</td>
															<td style="width: 17%">
															    <c:choose>
															        <c:when test="${meetingDetail.role == 'recorder'}">
															            <span class="work">记录员</span>
															        </c:when>
															        <c:when test="${meetingDetail.role == 'master'}">
															            <span class="ur">主持人</span>
															        </c:when>
															        <c:otherwise>
															            <span class="fam">参与者</span>
															        </c:otherwise>
															    </c:choose>
															</td>
															<td style="width: 17%">
															    <c:choose>
															        <c:when test="${meetingDetail.optional == 'no'}">
															            <span class="label label-danger">必须参加</span>
															        </c:when>
															        <c:otherwise>
															            <span class="label label-success">&nbsp;可选的&nbsp;</span>
															        </c:otherwise>
															    </c:choose>
															</td>
															<td style="width: 17%">
															    <c:choose>
															        <c:when test="${meetingDetail.will == 'no'}">
															            <span class="label label-default">已拒绝</span>
															        </c:when>
															        <c:when test="${meetingDetail.will == 'yes'}">
															            <span class="label label-primary">已同意</span>
															        </c:when>
															        <c:otherwise>
															            <i class="fa fa-star-half-o icon-state-warning">不确定</i>
															        </c:otherwise>
															    </c:choose>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

										<div class="content-box" style="margin-top: 45px;">
											<ul>
												<li>
													<span>会议描述</span>
												</li>
												<li>
													<a>${meeting.description}</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
				
							</div>
							<div class="clearfix"></div>
						</div>
						<!-- //content -->

						<!--//outer-wp-->
					</div>
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
									<a href="<%=basePath%>meetingRoom/queryMeetingRoom?pageIndex=1">会&nbsp;议&nbsp;室</a>
								</li>
								<li id="menu-academico-boletim">
									<a href="query_mr_monthview.jsp">月&nbsp;视&nbsp;图</a>
								</li>
							</ul>
						</li>
						<li id="menu-academico">
							<a href="#"><i class="fa fa-file-text-o"></i> <span>我的会议</span> 
							<span class="fa fa-angle-right" style="float: right"></span>
							</a>
							<ul id="menu-academico-sub">
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
									<a href="query_myreservedmeeting.jsp">我的预约</a>
								</li>
								<li id="menu-academico-boletim">
									<a href="add_meeting.jsp">新建预约</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#"><i class="lnr lnr-envelope"></i> <span>消息中心</span>
							<span class="fa fa-angle-right" style="float: right"></span>
							</a>
							<ul>
								<li>
									<a href="inbox.jsp"><i class="fa fa-inbox"></i>&nbsp;&nbsp;收件箱</a>
								</li>
								<li>
									<a href="compose.jsp"><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;已发送</a>
								</li>
								<li>
									<a href="add_message.jsp"><span class="lnr lnr-highlight"></span>&nbsp;&nbsp;写&nbsp;&nbsp;信</a>
								</li>

							</ul>
						</li>
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