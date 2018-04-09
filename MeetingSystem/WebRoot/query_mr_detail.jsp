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

		<!-- fullcalendar -->
		<link href='css/fullcalendar.css' rel='stylesheet' />
		<script src='js/moment.min.js'>
</script>
		<script src='js/fullcalendar.min.js'>
</script>
		<!-- //fullcalendar -->
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


					<div class="outter-wp">

						<!--sub-heard-part-->
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li>
									<a href="index.jsp">主页</a>
								</li>
								<li>
									<a href="<%=basePath%>meetingRoom/queryMeetingRoom">会议室</a>
								</li>
								<li class="active">
									会议室详情
								</li>
							</ol>
						</div>
						<!--//sub-heard-part-->

						<!--calender-->
						<div class="cal-main">
							<div class="calender graph-form">
							    <input type="hidden" id="mrId" value="${param.mrId}" >
								<h2 class="inner-tittle" id="h2title">
									${param.no} 占用情况
								</h2>
								
								<div id="calendar"></div>
								
							</div>
						</div>
						<!--//calender-->
<script type="text/javascript">
var getAjaxFun = function(url, data, method) {
	$.ajax({
		async: false,
	    cache: false,
	    type: 'POST',
	    dataType: "json",
	    url: url,
	    data: data,
	    success: function(data) {
		    method(data);
	    },
	    error: function() {
	    	alert("请求失败");
	    }
	});
};

(function ($) {
	var calendar;
	function calendarInit() {
		calendar = $("#calendar").fullCalendar({
			firstDay: 1,
		    isRTL: false,
		    weekends: true,
		    defaultView: "month",
		    allDaySlot: true,
		    allDayText: "今日",
		    slotMinutes: 30,
		    defaultEventMinutes: 120,
		    eventLimit: true,
		    allDayDefault: false,
		    header: {
			    left: "prevYear,nextYear today",
			    center: "prev title next",
			    right: "month,agendaWeek,agendaDay"
		    },
		    timeFormat: 'H:mm',
		    editable: false,
		    droppable: false,   //这允许事情被扔到日历上！！！  
            selectable: true,   //是否选中对应元素  
            selectHelper: false,  
            events: calendearSelect,//初始化日程表  
            eventClick: calendearSelectEdit
		});
	}
	
	function calendearSelect(start, end, timezone, callback) {
		var fstart = $.fullCalendar.formatDate(start, "YYYY-MM-DD HH:mm:ss");
		var fend = $.fullCalendar.formatDate(end, "YYYY-MM-DD HH:mm:ss");
		var mrId = $("#mrId").val();
	    getAjaxFun(
	    	"<%=basePath%>meeting/queryMeetingByTime",
	    	{
	    		"startTime": fstart,
	    		"endTime": fend,
	    		"mrId": mrId
	    	},
	    	function (reData) {
	    		var events = [];
	    		for (var i = 0; i < reData.length; i++) {
	    			var meeting = reData[i];
	    			var title = meeting.mName;
	    			if (meeting != null) {
	    				var color;
	    				var hold = meeting.hold;
	    				var cancel = meeting.cancel;
	    				if (hold == "no" && cancel == "no") {
	    					color = "red";
	    				} else if (cancel != "no") {
	    					color = "grey";
	    				} else {
	    					color = "green";
	    				}
	    				
	    				var tjson = {
	    					id: meeting.mId,
	    					title: title,
	    					start: meeting.startTime,
	    					end: meeting.endTime,
	    					color: color
	    				};
	    				events.push(tjson);
	    			}
	    		}
	    		callback(events); 
	    	});
	}
	
	function calendearSelectEdit(calEvent, jsEvent, view) {
		getAjaxFun(
	    	"<%=basePath%>/meeting/queryMeetingById",
	    	{
	    		"meetingId": calEvent.id,
	    	},
	    	function (reData) {
	    		
	    		if (reData.length == 1) {
	    			var meeting = reData[0];
	    			if (meeting != null) {
	    				var fstart =  $.fullCalendar.formatDate(calEvent.start, "YYYY-MM-DD HH:mm:ss");
	    				var fend = $.fullCalendar.formatDate(calEvent.end, "YYYY-MM-DD HH:mm:ss");
	    				var hold;
	    				if (meeting.hold == "no") {
	    					hold = "未召开";
	    				} else {
	    					hold = "已召开"
	    				}
	    				var cancel;
	    				if (meeting.cancel == "no") {
	    					cancel = "正常";
	    				} else {
	    					cancel = "已取消";
	    				}
	    				
	    				$("#m-name").html(meeting.mName);
	    				$("#starttime").html(fstart);
	    				$("#endtime").html(fend);
	    				$("#mr-no").html(meeting.meetingRoom.no);
	    				$("#s-name").html(meeting.scheduler.userName);
	    				$("#s-time").html(meeting.scheduledTime);
	    				$("#status").html(cancel + " / " + hold);
	    				$("#description").html(meeting.description);
	    			}
	    		}
	        }
	    );
		
		$("#modal-button").click();
	}
	
	calendarInit(); 
})(window.jQuery);


</script>

						<button type="button" id="modal-button" class="btn btn-primary btn-lg" 
							data-toggle="modal" data-target="#eventModal">
							Launch modal
						</button>
						<!-- event modal-dialog -->
						<div class="modal fade" id="eventModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
							style="display: none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close second"
											data-dismiss="modal" aria-hidden="true">
											×
										</button>
										<h2 class="modal-title">
											会议摘要
										</h2>
									</div>


									<div class="modal-body">
										<!--content-->
										<div class="profile-section-inner">
											<div class="col-md-6 profile-info">
												<div class="main-grid3">
													<div class="p-20">
														<div class="about-info-p">
															<strong>会议主题</strong>
															<br>
															<p class="text-muted" id="m-name">
																*
															</p>
														</div>
														<div class="about-info-p">
															<strong>开始时间</strong>
															<br>
															<p class="text-muted" id="starttime">
																*
															</p>
														</div>
														<div class="about-info-p">
															<strong>结束时间</strong>
															<br>
															<p class="text-muted" id="endtime">
																*
															</p>
														</div>
														<div class="about-info-p m-b-0">
															<strong>会议室</strong>
															<br>
															<p class="text-muted" id="mr-no">
																*
															</p>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6 profile-info two">
												<div class="main-grid3 p-skill">
													<div class="p-20">
														<div class="about-info-p">
															<strong>预定人</strong>
															<br>
															<p class="text-muted" id="s-name">
																*
															</p>
														</div>
														<div class="about-info-p">
															<strong>预定时间</strong>
															<br>
															<p class="text-muted" id="s-time">
																*
															</p>
														</div>
														<div class="about-info-p">
															<strong>状态</strong>
															<br>
															<p class="text-muted" id="status">
																*
															</p>
														</div>
														<div class="about-info-p">
															<strong>&nbsp;</strong>
															<br>
															<p class="text-muted">
																&nbsp;
															</p>
														</div>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
											<div class="clearfix"></div>
											<h3 class="my-inner-tittle" style="font-size: 20px">
													会议描述
												</h3>
												<div class="main-grid3 p-skill">
													<p id="description">
														*
													</p>
												</div>
											<div class="clearfix"></div>
										</div>
										<!--//content-->
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">
											取消
										</button>
									</div>
								</div>
<script type="text/javascript">
$("#modal-button").hide();
</script>
								<!-- /.modal-content -->
							</div>
							<!-- /.event modal-dialog -->
						</div>


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
									<a href="<%=basePath%>meetingRoom/queryMeetingRoom">会&nbsp;议&nbsp;室</a>
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