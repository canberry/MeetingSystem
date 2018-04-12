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
		<!-- //time -->
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
									预约会议
								</li>
							</ol>
						</div>
						<!--//sub-heard-part-->

						<!-- content -->
						<!--/inbox-->
						<div class="inbox-mail">



							<div class="col-md-4 compose">

								<!-- search -->
								<div>
									<form onsubmit="return false" method="Post" id="roomform">
										<div class="input-group input-group-in">
											<input name="startTime" id="startTime" placeholder="请输入开始时间"
												class="laydate-icon timeUstyle stateUTime"
												style="color: black; width: 47%; margin-left: 5px" 
												title="请输入开始时间" onblur="changetime()">
											-
											<input name="endTime" id="endTime" placeholder="请输入结束时间"
												class="laydate-icon timeUstyle stateUTime"
												style="color: black; width: 47%; margin-left: 0px" 
												title="请输入结束时间" onblur="changetime()">
										</div>
										<div class="input-group input-group-in">
											<input type="text" name="cap" id="cap" class="form-control"
												placeholder="请输入期望会议室容量" title="请输入会议室容量">
											<span class="input-group-btn">
												<button class="btn btn-success" type="button" 
												        onclick="checkAndQueryMR()" title="按条件查询可用会议室">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</div>
									</form>
									<div class="alert alert-danger" role="alert" id="error">
										<strong>Oh snap!</strong>
									</div>
<script type="text/javascript">
$("#error").hide();
var meetingRooms;
function changetime() {
	var no = $("#no").val();
	if (no != null) {
		$("#mrId").val("");
		$("#no").val("");
	}
}

function check() {
	var st = $("#startTime").val();
	var et = $("#endTime").val();
	var tmessage = "";
	if (st != "" && et != "") {
		if (st >= et) {
			tmessage = "<strong>输入错误!</strong>开始时间要小于结束时间";
		} else {
			tmessage = "";
		}
	} else {
		tmessage = "<strong>输入错误!</strong>请输入会议时间";
	}
	
	var message = "";
	var capacity = $("#cap").val();
	var re = /^[0-9]*$/;
	if (capacity == "") {
		message = "<strong>输入错误!</strong>请输入会议室容量";
	} else if (!re.test(capacity)) {
    	message = "<strong>输入错误!</strong>会议室容量只能输入数字";
    } else {
    	message = "";
    }
	
	if (tmessage == "" && message == "") {
		$("#error").html("");
		$("#error").hide();
		return true;
	} else if (message == "") {
		$("#error").html(tmessage);
		$("#error").show();
		return false;
	} else {
		$("#error").html(message);
		$("#error").show();
		return false;
	}
}

function checkAndQueryMR() {
	if (!check()) {
		return;
	}
	
	$.ajax({
		url : "<%=basePath%>meetingRoom/queryMeetingRoomsToScheduled",
		data : $("#roomform").serialize(),
		dataType : 'json',
		type : "post",
		success : function(data) {
			if (data.length < 1) {
				$("#error").html("<strong>很抱歉！</strong>该时段或容量没有空闲的会议室，请选择其他时间段");
		    	$("#error").show();
		    } else {
		    	$("#error").html("");
		    	$("#error").hide();
		    	
		    	meetingRooms = data;
		    	var table = $("#mrtable").html("");
		    	for (var i = 0; i < data.length; i++) {
		    		var meetingRoom = data[i]; //用json数据形式
		    		var tr = "<tr><th scope='row' style='text-align: center'>" + eval(i + 1) + "</th>" + 
		    		         "<td style='text-align: center'>" + meetingRoom.no + "</td>" + 
							 "<td style='text-align: center'>" + meetingRoom.mrName + "</td>" + 
							 "<td style='text-align: center'>" + meetingRoom.capacity +"</td>" + 
							 "<td style='text-align: center'>" + 
							 "<button class='share__btn' style='background: #3B5999; float: right' " + 
							 "onclick='getroom(" + i + ")' data-dismiss='modal'>选择</button></td></tr>"
					
					var table = $("#mrtable").html();
					table += tr;
					var table = $("#mrtable").html(table);
		    	}
		    	
		    	$("#mr-modal-button").click();
		    }
        }
    });
}

function getroom(row) {
	if ($("#suberror").html() == "<strong>输入错误！</strong>请选择会议室") {
		$("#suberror").hide();
	}
	
	var mr = meetingRooms[row];
	$("#mrId").val(mr.mrId);
	$("#no").val(mr.no);
}

$("#startTime").click(function() {
	var end = $("#endTime").val();
	var obj = {
		elem : '#startTime',
		format : 'YYYY-MM-DD hh:mm',
		min : laydate.now(0, "YYYY-MM-DD hh:mm:ss"), //设定最小日期为当前日期
		max : '2099-06-16 23:59:59', //最大日期 
		istime : true,
		istoday : false,
		start : laydate.now(0, "YYYY-MM-DD hh:mm:ss"),
		choose : function(datas) {
			end.min = datas; //开始日选好后，重置结束日的最小日期  
		    end.start = datas //将结束日的初始值设定为开始日  
	}
	};
	end && (obj.max = end);
	laydate(obj);
});
$("#endTime").click(function() {
	var start = $("#startTime").val();
	var obj = {
		elem : '#endTime',
		format : 'YYYY-MM-DD hh:mm',
		min : laydate.now(0, "YYYY-MM-DD hh:mm:ss"),
		max : '2099-06-16 23:59:59',
		istime : true,
		istoday : false,
		start : laydate.now(0, "YYYY-MM-DD hh:mm:ss"),
		choose : function(datas) {
			start.max = datas; //结束日选好后，重置开始日的最大日期  
	}
	};
	start && (obj.min = start);
	laydate(obj);
});
</script>
								</div>
								<!-- //search -->								

								<h2>
									会议基本信息
								</h2>
								<nav class="nav-sidebar">
								<ul class="nav tabs">
									<li class="">
										<a> <strong>会议主题:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
											<input type="text" name="mName" id="mName" class="form-control"
												style="margin-top: 10px" placeholder="请输入会议主题"
												title="请输入会议主题" onblur="checkMInfo()">
											<div class="clearfix"></div> </a>
									</li>
									<li class="">
										<a> <strong>会议室:&nbsp;&nbsp;&nbsp;&nbsp;</strong>
										    <input type="text" name="no" id="no" 
												class="form-control" style="margin-top: 10px"
												placeholder="会议室编号（请先选择时间与容量）" title="请点击选择会议室" readonly="readonly">
											<div class="clearfix"></div> </a>
									</li>
								</ul>
								</nav>
								<input type="hidden" id="mrId" name="mrId">
								
								<div class="alert alert-danger" role="alert" id="numerror"></div>
								<h2>
									借用资源
								</h2>
								<nav class="nav-sidebar">
								<ul class="nav tabs">
									<div class="tables">
										<table class="table table-bordered" id="rtable">
											<tr>
												<th style="text-align: center; width: 10%">
													<strong>#</strong>
												</th>
												<th style="text-align: center; width: 30%">
													<strong>名称</strong>
												</th>
												<th style="text-align: center; width: 30%">
													<strong>剩余数量</strong>
												</th>
												<th style="text-align: center; width: 30%">
													<strong>借用</strong>
												</th>
											</tr>
											<c:forEach var="resource" items="${resources}"
												varStatus="status">
												<tr id="${resource.rId}">
													<th scope="row" style="text-align: center">
														${status.count}
													</th>
													<td style="text-align: center">
														${resource.rName}
													</td>
													<td style="text-align: center" id="remain${resource.rId}">
														${resource.remain}
													</td>
													<td style="text-align: center">
														<input type="text" class="form-control"
															id="number${resource.rId}" placeholder="数量"
															title="输入借用数量" onblur="checkNumber('${resource.rId}')">
													</td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<c:if test="${resources.isEmpty()}">
										<li class="">
											<a><i>无可借资源</i>
											</a>
										</li>
									</c:if>
								</ul>
								</nav>
							</div>
<script type="text/javascript">
$("#numerror").hide();
function checkNumber(rid) {
	if ($("#suberror").html() == "<strong>输入错误！</strong>请正确填写借用资源") {
		$("#suberror").hide();
	}
	
	var remainid = "#remain" + rid;
	var remain = $(remainid).html();
	var nid = "#number" + rid;
	var number = $(nid);
	var num = number.val();
	
	var re = /^[0-9]*$/;
	if (num == "") {
		$("#numerror").html("");
		$("#numerror").hide();
		return true;
	} else if (!re.test(num)) {
		$("#numerror").html("<strong>输入错误！</strong>输入的数量必须是数字");
		$("#numerror").show();
		number.val("");
		return false;
	} else if (eval(num) > eval(remain)) {
		$("#numerror").html("<strong>输入错误！</strong>输入的数量不得大于其剩余数量");
		$("#numerror").show();
		number.val("");
		return false;
	} else {
		$("#numerror").html("");
		$("#numerror").hide();
		return true;
	}
}

function checkMInfo() {
	var mn = $("#mName").val();
	var des = $("#description").val();
	
	if (mn != "" && des != "") {
		if ($("#suberror").html() == "<strong>输入错误！</strong>请选择会议信息") {
			$("#suberror").hide();
	    }
	}
}
</script>

							<button type="button" id="mr-modal-button"
								class="btn btn-primary btn-lg" data-toggle="modal"
								data-target="#meetingroomModal">
								Launch modal
							</button>
							<!-- meetingroom modal-dialog -->
							<div class="modal fade" id="meetingroomModal" tabindex="-1"
								role="dialog" aria-labelledby="meetingroomModalLabel"
								aria-hidden="true" style="display: none;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close second"
												data-dismiss="modal" aria-hidden="true">
												×
											</button>
											<h2 class="modal-title">
												选择可用会议室
											</h2>
										</div>
										<div class="modal-body">
											<div class="tables">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th style="text-align: center; width: 10%">
																<strong>#</strong>
															</th>
															<th style="text-align: center; width: 22%">
																<strong>编号</strong>
															</th>
															<th style="text-align: center; width: 38%">
																<strong>用途</strong>
															</th>
															<th style="text-align: center; width: 15%">
																<strong>容量</strong>
															</th>
															<th style="text-align: center; width: 15%">
																<strong>操作</strong>
															</th>
														</tr>
													</thead>
													<tbody id="mrtable"></tbody>
												</table>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">
												Close
											</button>
										</div>
<script type="text/javascript">
$("#mr-modal-button").hide();
</script>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							

							<!-- tab content -->
							<div class="col-md-8 tab-content tab-content-in">
								<div class="tab-pane active text-style" id="tab1">
									<div class="inbox-right">

										<div class="mailbox-content">
										
											<div class="float-left">
												<!-- search -->
												<div>
													<form onsubmit="return false" method="Post" id="userform">
														<div class="input-group input-group-in">
															<input type="text" name="uname" id="uname" 
																class="form-control" style="width: 40%; margin-left: 60%"
																placeholder="请输入用户名" title="请输入用户名">
															<span class="input-group-btn">
																<button class="btn btn-success" type="button"
																	onclick="checkAndQueryUser()" title="按条件查询用户">
																	<i class="fa fa-search"></i>
																</button> </span>
														</div>
													</form>
													<div class="alert alert-danger" role="alert" id="usererror">
														<strong>Oh snap!</strong>
													</div>
													<div class="alert alert-danger" role="alert" id="userscheckerror">
														<strong>Oh snap!</strong>
													</div>
<script type="text/javascript">
$("#usererror").hide();
var us;
function checkuser() {
	var userName = $("#uname").val();
	if (userName == "") {
		$("#usererror").html("<strong>输入错误！</strong>请输入用户名");
		$("#usererror").show();
		$("#userscheckerror").hide();
		return false;
	} else {
		$("#usererror").html("");
		$("#usererror").hide();
		return true;
	}
}

function checkAndQueryUser() {
	if (!checkuser()) {
		return;
	}
	
		$.ajax({
		url : "<%=basePath%>user/queryUsersByName",
		data : $("#userform").serialize(),
		dataType : 'json',
		type : "post",
		success : function(data) {
			if (data.length < 1) {
				$("#userscheckerror").hide();
				$("#usererror").html("<strong>很抱歉！</strong>不存在相关用户，请重新输入");
		    	$("#usererror").show();
		    } else {
		    	$("#usererror").html("");
		    	$("#usererror").hide();
		    	
		    	us = data;
		    	var table = $("#usertable").html("");
		    	for (var i = 0; i < data.length; i++) {
		    		var user = data[i]; //用json数据形式
		    		var sex = user.sex;
		    		if (sex == "man") {
		    			sex = "男";
		    		} else if (sex == "female") {
		    			sex = "女";
		    		} else {
		    			sex = "保密";
		    		}
		    		var tr = "<tr data-row=" + eval(i + 1) + ">" + 
		    		         "<th scope='row' style='text-align: center'>" + eval(i + 1) + "</th>" + 
		    		         "<td style='text-align: center'>" + user.userName + "</td>" + 
							 "<td style='text-align: center'>" + sex + "</td>" + 
							 "<td style='text-align: center'>" + user.position +"</td>" + 
							 "<td style='text-align: center'>" + 
							 "<button class='share__btn' style='background: #3B5999; float: right' " + 
							 "onclick='getuser(" + i + ")' data-dismiss='modal'>选择</button></td></tr>"
					
					var table = $("#usertable").html();
					table += tr;
					var table = $("#usertable").html(table);
		    	}
		    	
		    	$("#user-modal-button").click();
		    }
        }
    });
}

function getuser(row) {
	$("#userscheckerror").hide();
	if ($("#suberror").html() == "<strong>输入错误！</strong>请选择参与会议的人员") {
		$("#suberror").hide();
	}
	
	var u = us[row];
	
	var rowIndex = $("#mdtable tr:last").attr("data-row");
    if (rowIndex == "" || rowIndex == null) {
        rowIndex = parseInt(1);
    } else {
        rowIndex = parseInt(rowIndex) + 1;
    }
	
	var trstart = "<tr class='table-row' id='" + u.userId + "' data-row='" + rowIndex +"'>";
	var avatar = "<td class='table-img' style='width: 17%'><img src='" + u.avatar + "' alt='' /></td>";
	var username = "<td class='table-text' style='width: 31%'><h6>" + u.userName +"</h6><p>职位：&nbsp;" + u.position + "</p></td>";
	var role = "<td style='width: 17%'><select name='role' id='role' title='选择会议角色' style='height: 30px'>" + 
	           "<option value='participant' id='participant'>参与者</option>" + 
	           "<option value='recorder' id='recorder'>记录员</option>" + 
	           "<option value='master' id='master'>主持人</option></select></td>";
	var optional = "<td style='width: 17%'><select name='optional' id='optional'  title='选择是否必须参加' style='height: 30px'>" + 
	               "<option value='yes' id='optionalyes'>可选的</option>" + 
	               "<option value='no' id='optionalno'>必须</option></select></td>";
    var del = "<td style='width: 17%' class='rowDelete' data-row='" + rowIndex +"'>" + 
              "<h4><a class='label label-warning' title='删除此用户'>删除</a></h4></td>";
    var trend = "</tr>";
    
    var htmlList = trstart + avatar + username + role + optional + del + trend;
    $("#mdtable tr:last").after(htmlList);
    htmlList = "";
    
    clickDelete();
}

function clickDelete() {
    $('.rowDelete').click(function() {
        var dataRow = $(this).attr('data-row');
        $('tr[data-row=' + dataRow + ']').remove();
    });
};
</script>
												</div>
												<!-- //search -->
											</div>

											<button type="button" id="user-modal-button"
												class="btn btn-primary btn-lg" data-toggle="modal"
												data-target="#userModal">
												Launch modal
											</button>
											<!-- meetingroom modal-dialog -->
											<div class="modal fade" id="userModal" tabindex="-1"
												role="dialog" aria-labelledby="userModalLabel"
												aria-hidden="true" style="display: none;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close second"
																data-dismiss="modal" aria-hidden="true">
																×
															</button>
															<h2 class="modal-title">
																选择相关会议人员
															</h2>
														</div>
														<div class="modal-body">
															<div class="tables">
																<table class="table table-bordered">
																	<thead>
																		<tr>
																			<th style="text-align: center; width: 10%">
																				<strong>#</strong>
																			</th>
																			<th style="text-align: center; width: 32%">
																				<strong>用户名</strong>
																			</th>
																			<th style="text-align: center; width: 18%">
																				<strong>性别</strong>
																			</th>
																			<th style="text-align: center; width: 24%">
																				<strong>职位</strong>
																			</th>
																			<th style="text-align: center; width: 18%">
																				<strong>操作</strong>
																			</th>
																		</tr>
																	</thead>
																	<tbody id="usertable"></tbody>
																</table>
															</div>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">
																Close
															</button>
														</div>
<script type="text/javascript">
$("#user-modal-button").hide();
</script>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											
											<table class="table" id="mdtable">

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
														<strong>操作</strong>
													</td>
												</tr>
											</table>
										</div>

										<div class="content-box" style="margin-top: 45px;">
											<ul>
												<li>
													<span>会议描述</span>
												</li>
												<li>
													<a>${meeting.description}</a>
													<textarea class="form-control" rows="5" cols="100"
														id="description" name="description" placeholder="请输入会议描述"
														wrap="virtual" maxlength="280" title="请输入会议描述"
														onblur="checkMInfo()"></textarea>
												</li>
											</ul>
										</div>
									</div>

									<div class="alert alert-danger" role="alert" id="suberror" style="margin-top: 40px">
										<strong>Oh snap!</strong>
									</div>
									
									<div class="onoffswitch" style="float: left; margin-top: 20px; margin-left: 65%" title="ON:开启时间冲突检查">
										<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>
										<label class="onoffswitch-label" for="myonoffswitch">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>

									
									<button type="button" class="btn btn-lg btn-success warning_1" 
									        style="float: right; margin-top: 20px" onclick="checkAndSub()">
									确认提交
									</button>
<script type="text/javascript">
$("#suberror").hide();
$("#userscheckerror").hide();
function checkUsers() {
	$("#mdtable tr:gt(0)").each(function(i) {
		$(this).children("td:eq(4)").find("span").remove();
		$(this).css("background-color", "white");
	});
	
	
	$.ajax({
		url : "<%=basePath%>user/queryAvailableUsersByIds",
		data : 
		    {"uids" : JSON.stringify(uids),
			 "startTime" : $("#startTime").val(),
			 "endTime": $("#endTime").val()},
		type : "post",
		dataType: "json",
		async : false, 
		success : function(data) {
			var size = $("#mdtable tr").length - 1;
			
			if (data.length >= eval(size / 2)) {
				$("#mdtable tr:gt(0)").each(function(i) {
					var uid = $(this).attr("id");
					
					for (var i = 0; i < data.length; i++) {
						var user = data[i];
						if (user.userId == uid) {
							var errorinfo = "<span class='alert alert-danger' role='alert' style='margin-top: 50px'>" + 
							                "<strong>时间冲突</strong></span>";
							$("#userscheckerror").html("<strong>请注意！</strong>大部分与会人员日程与会议时间存在冲突，您可以重新选择时间或者更换人员");
							$("#userscheckerror").show();
							$(this).css("background-color", "#FFC1C1");
							$(this).children("td:eq(4)").append(errorinfo);
						}
					}
				});
				
				return false;
			} else {
				$("#userscheckerror").html("");
				$("#userscheckerror").hide();
				
				return true;
			}
        }
    });
	
	if ($("#userscheckerror").html() == "") {
		return true;
	} else {
		return false;
	}
}

var uids = [];
function getUIds() {
	uids = [];
	$("#mdtable tr:gt(0)").each(function(i) {
		var uid = $(this).attr("id");
		var ujson = {
			userId : uid
		};
		uids.push(ujson);
	});
}

var mds = [];
function getMDs() {
	mds = [];
	$("#mdtable tr:gt(0)").each(function(i) {
		var uid = $(this).attr("id");
		var urole = $(this).children("td:eq(2)").find("select").val();
		var uoptional = $(this).children("td:eq(3)").find("select").val();
		var ujson = {
			userId : uid,
			role : urole,
			optional : uoptional
		};
		mds.push(ujson);
	});
}

var mrs = [];
function getMRs() {
	mrs = [];
	$("#rtable tr:gt(0)").each(function(i) {
		var rid = $(this).attr("id");
		var num = $(this).children("td:eq(2)").find("input").val();
		if (num != "" && eval(num) > 0) {
			var ujson = {
				rId : rid,
				number : num
			};
			mrs.push(ujson);
		}
	});
}

function checkAndSub() {
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var mName = $("#mName").val();
	var description = $("#description").val();
	var mrId = $("#mrId").val();
	
	if (startTime == "" || endTime == "") {
		$("#suberror").html("<strong>输入错误！</strong>请输入会议时间");
		$("#suberror").show();
		return;
	} else if (mrId == "") {
		$("#suberror").html("<strong>输入错误！</strong>请选择会议室");
		$("#suberror").show();
		return;
	} else if (mName == "" || description == "") {
		$("#suberror").html("<strong>输入错误！</strong>请输入会议信息");
		$("#suberror").show();
		return;
	} else if ($("#numerror").html() != "") {
		$("#suberror").html("<strong>输入错误！</strong>请正确填写借用资源");
		$("#suberror").show();
		return;
	}
	
	getUIds();
	if (uids.length < 1) {
		$("#suberror").html("<strong>输入错误！</strong>请选择参与会议的人员");
		$("#suberror").show();
		return;
	}
	
	if ($("input[type='checkbox']").is(":checked")) {
		if (!checkUsers()) {
			return;
		}
	}
	
	getMDs();
	getMRs();
	
	$.ajax({
		url : "<%=basePath%>meeting/addMeeting",
		data : 
		    {"mds" : JSON.stringify(mds),
			 "mrs" : JSON.stringify(mrs),
			 "startTime" : startTime,
			 "endTime" : endTime,
			 "mName" : mName,
			 "description" : description,
			 "mrId" : mrId
			 },
		type : "post",
		success : function(data) {
			if (data == "fail") {
				alert("fail");
			} else {
				var mid = data;
				window.location.href = "jumpto_meeting_detail.jsp?mid=" + mid;
			}
		}
    });
		
}
</script>
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