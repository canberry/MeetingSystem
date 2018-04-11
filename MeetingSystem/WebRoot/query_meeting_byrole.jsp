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
									我的会议
								</li>
							</ol>
						</div>
						<!--//sub-heard-part-->

						<!-- content -->
						<div class="graph-visual tables-main">
							<h3 class="inner-tittle two">
								上传会议记录
							</h3>

							<!-- search -->
							<div>
								<form action="<%=basePath%>meetingDetail/queryMeetingDetailAlreadyHold" 
								      onsubmit="return check()" method="Post">
									<div class="input-group input-group-in">
										<input type="text" name="mName" id="mName"
											value="${md.meeting.mName}"
											style="width: 30%; margin-left: 5px" class="form-control"
											placeholder="按会议主题查询" title="按会议主题查询">
										<input type="text" name="no" id="no"
											value="${md.meeting.meetingRoom.no}"
											style="width: 30%; margin-left: 10px" class="form-control"
											placeholder="按会议室编号查询" title="按会议室编号查询">
										<input type="text" name="userName" id="userName"
											value="${md.meeting.scheduler.userName}"
											style="width: 30%; margin-left: 10px" class="form-control"
											placeholder="按预定人查询" title="按预定人查询">
										<span class="input-group-btn" style="width: 25%">
											<button class="btn btn-success" type="submit" title="按条件查询">
												<i class="fa fa-search"></i>
											</button>
										</span>
										<input type="hidden" name="pageIndex" value="1" id="pi" />
									</div>
									<div class="input-group input-group-in">
										<select name="cancel" id="cancel"
											style="width: 32%; height: 48px; margin-left: 5px" class="form-control"
											title="按会议状态查询">
											<option value="">按会议状态查询</option>
											<option value="no" id="cancelno">已经召开</option>
											<option value="yes" id="cancelyes">已经取消</option>
										</select>
										<input type="hidden" id="cancelid" value="${md.meeting.cancel}">
										<select name="role" id="role"
											style="width: 32%; height: 48px; margin-left: 10px" class="form-control"
											title="按参与角色查询">
											<option value="recorder" id="recorder" selected="selected">
											记录员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
										</select>
										<input type="hidden" id="roleid" value="${md.role}">
										<input name="scheduledTime" id="scheduledTime" placeholder="按预约时间查询" 
											class="laydate-icon timeUstyle stateUTime" 
											style="color: black; width: 30%; margin-left: 10px" 
											value="${md.meeting.scheduledTime}">
									</div>
									<div class="input-group input-group-in">
									    <select name="optional" id="optional"
											style="width: 30%; height: 48px; margin-left: 5px" class="form-control"
											title="按必须参与查询">
											<option value="">按重要性查询</option>
											<option value="no" id="optionalno">Required</option>
											<option value="yes" id="optionalyes">Optional</option>
										</select>
										<input type="hidden" id="optionalid" value="${md.optional}">
										<input name="startTime" id="startTime"  placeholder="按开始时间查询" 
											class="laydate-icon timeUstyle stateUTime" 
											style="color: black; width: 30%; margin-left: 10px" 
											value="${md.meeting.startTime}"> -
										<input name="endTime" id="endTime" placeholder="按结束时间查询" 
											class="laydate-icon timeUstyle stateUTime" 
											style="color: black; width: 30%; margin-left: 0px" 
											value="${md.meeting.endTime}">
									</div>
								</form>
								<div class="alert alert-danger" role="alert" id="error">
									<strong>Oh snap!</strong>
								</div>
<script type="text/javascript">
$("#error").hide();
function check() {
	var st = $("#startTime").val();
	var et = $("#endTime").val();
	if (st != "" && et != "") {
		if (st >= et) {
			$("#error").html("<strong>输入错误!</strong>开始时间要小于结束时间");
		    $("#error").show();
		    return false;
	    } else {
		    $("#error").html("");
		    $("#error").hide();
		    return true;
	    }
	}
}

var cancel = "#cancel" + $("#cancelid").val();
$(cancel).attr("selected", "selected");
var optional = "#optional" + $("#optionalid").val();
$(optional).attr("selected", "selected");

var scheduled = {  
    elem: '#scheduledTime',  
    format: 'YYYY-MM-DD hh:mm',  
    max: laydate.now(0,"YYYY-MM-DD hh:mm:ss"), //设定最大日期为当前日期  
    start: laydate.now(0,"YYYY-MM-DD hh:mm:ss"),
    istime: true,  
    istoday: true
};
laydate(scheduled); 

$("#startTime").click(function(){  
    var end=$("#endTime").val();  
    var obj={
    	elem: '#startTime',
    	format: 'YYYY-MM-DD hh:mm',
    	max: laydate.now(0,"YYYY-MM-DD hh:mm:ss"), //设定最小日期为当前日期
    	min: '1900-01-01 00:00:00', //最大日期 
    	istime: true,
    	istoday: false,
    	start: laydate.now(0,"YYYY-MM-DD hh:mm:ss"), 
    	choose: function(datas) {
    	    end.min = datas; //开始日选好后，重置结束日的最小日期  
    	    end.start = datas //将结束日的初始值设定为开始日  
        }  
    };
    
    //end&&(obj.max=end);
    if (end != "") {
    	if (end < obj.max) {
    		obj.max=end;
    	}
    }
    
    laydate(obj);  
});  
$("#endTime").click(function(){  
    var start=$("#startTime").val();  
    var obj={
    	elem: '#endTime',
    	format: 'YYYY-MM-DD hh:mm',
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: false,
        start: laydate.now(0,"YYYY-MM-DD hh:mm:ss"),
        choose: function(datas){  
            start.max = datas; //结束日选好后，重置开始日的最大日期  
        } 
    };
    start&&(obj.min=start);
    laydate(obj);  
});  
</script>
							</div>
							<!-- //search -->

							<!--/Accordion-->
							<div class="accordion">
								<div class="panel-group tool-tips graph-form" id="accordion"
									role="tablist" aria-multiselectable="true">

									<c:forEach var="meetingDetail" items="${meetingDetails}"
										varStatus="status">
										<fmt:parseDate var="startObj" value="${meetingDetail.meeting.startTime}" type="DATE"
											pattern="yyyy-MM-dd HH:mm" />
										<fmt:formatDate var="startTime" value='${startObj}'
											pattern='yyyy-MM-dd HH:mm' />
										<fmt:parseDate var="endObj" value="${meetingDetail.meeting.endTime}" type="DATE"
											pattern="yyyy-MM-dd HH:mm" />
										<fmt:formatDate var="endTime" value='${endObj}'
											pattern='yyyy-MM-dd HH:mm' />
										<fmt:parseDate var="scheduledObj" value="${meetingDetail.meeting.scheduledTime}" type="DATE"
											pattern="yyyy-MM-dd HH:mm" />
										<fmt:formatDate var="scheduledTime" value='${scheduledObj}'
											pattern='yyyy-MM-dd HH:mm' />
										<div class="panel-default">
											<div class="panel-heading" role="tab"
												id="heading${status.count}">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapse${status.count}"
														aria-expanded="false"
														aria-controls="collapse${status.count}">
														#${status.count}&nbsp;&nbsp;${meetingDetail.meeting.mName}
														<span style="float: right">${startTime} ~ ${endTime}</span></a>
												</h4>
											</div>
											<div id="collapse${status.count}"
												class="panel-collapse collapse" role="tabpanel"
												aria-labelledby="heading${status.count}"
												aria-expanded="false" style="height: 0px;">
												<div class="panel-body">

													<!-- meeting-content -->
													<div class="but_list">
														<div class="col-md-6 page_1" style="width: 78%">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th width="50%">
																			<code>
																				<strong>会议主题：</strong>&nbsp;${meetingDetail.meeting.mName}
																			</code>
																		</th>
																		<th width="50%">
																			<code>
																				<strong>状&nbsp;&nbsp;态：</strong>&nbsp;
																				<c:choose>
																					<c:when
																						test="${meetingDetail.meeting.cancel == 'no'}">
																				    正常
																				    </c:when>
																					<c:otherwise>
																				    已取消
																				    </c:otherwise>
																				</c:choose>
																			</code>
																		</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>
																			<code>
																				<strong>开始时间：</strong>&nbsp;${startTime}
																			</code>
																		</td>
																		<td>
																			<code>
																				<strong>结束时间：</strong>&nbsp;${endTime}
																			</code>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<code>
																				<strong>会&nbsp;议&nbsp;室：</strong>&nbsp;${meetingDetail.meeting.meetingRoom.no}
																			</code>
																		</td>
																		<td>
																			<code>
																				<strong>会议角色：</strong>&nbsp;
																				<c:choose>
																					<c:when test="${meetingDetail.role == 'recorder'}">
																				    记录员
																				    </c:when>
																					<c:when test="${meetingDetail.role == 'master'}">
																				    主持人
																				    </c:when>
																					<c:otherwise>
																				    参与者
																				    </c:otherwise>
																				</c:choose>
																			</code>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<code>
																				<strong>预定人：</strong>&nbsp;${meetingDetail.meeting.scheduler.userName}
																			</code>
																		</td>
																		<td>
																			<code>
																				<strong>预定时间：</strong>&nbsp;${scheduledTime}
																			</code>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
														
														<div class="col-md-6 page_1" style="width: 15%">
															<div class="list-group list-group-alternate">
																<c:if test="${meetingDetail.role == 'recorder'}">
																	<button type="button" class="btn btn-lg btn-info">上传会议记录</button>
																</c:if>
																<button type="button" class="btn btn-link" onclick="clickDetail(${meetingDetail.meeting.mId})">
																查看详情
																</button>
															</div>
														</div>
														<div class="clearfix">
														</div>
<script type="text/javascript">
function clickDetail(meetingId) {
	window.location.href = "<%=basePath%>meeting/queryMeetingDetailAndResourceById?meetingId=" + meetingId + "&action=3";
}
</script>
													</div>
													<!-- //meeting-content -->

												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
							<!--//Accordion-->

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
									<a href="<%=basePath%>meeting/queryMeetingByMyScheduled?pageIndex=1">我的预约</a>
								</li>
								<li id="menu-academico-boletim">
									<a href="<%=basePath%>resource/queryAvailableResources">新建预约</a>
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