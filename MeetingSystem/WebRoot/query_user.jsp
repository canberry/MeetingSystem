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
		<title>人员列表</title>
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
										<input type="text" name="userName" id="userName" value="${u.userName}" 
											style="width: 52%; margin-left: 5px" class="form-control"
											placeholder="按用户名查询" title="按用户名查询">
										<select name="sex" id="sex"
											style="width: 40%; height: 48px; margin-left: 15px" class="form-control"
											title="按性别查询">
											<option value="">按性别查询</option>
											<option value="man" id="man">男</option>
											<option value="female" id="female">女</option>
											<option value="secret" id="secret">保密</option>
										</select>
										<input type="hidden" id="sexid" value="${u.sex}">
										<span class="input-group-btn" style="width: 25%">
											<button class="btn btn-success" type="submit" title="按条件查询">
												<i class="fa fa-search"></i>
											</button>
										</span>
										<input type="hidden" name="pageIndex" value="1" id="pi" />
									</div>
									<div class="input-group input-group-in">
										<select name="position" id="position"
											style="width: 51%; height: 48px; margin-left: 5px" class="form-control"
											title="按职位查询">
											<option value="">按职位查询</option>
											<option value="Intern" id="Intern">Intern</option>
											<option value="Officer" id="Officer">Officer</option>
											<option value="Associate Manager" id="AssociateManager">Associate Manager</option>
											<option value="Manager" id="Manager">Manager</option>
											<option value="Director" id="Director">Director</option>
											<option value="Senior Director" id="SeniorDirector">Senior Director</option>
											<option value="Vice President" id="VicePresident">Vice President</option>
										    <option value="President" id="President">President</option>
										</select>
										<input type="hidden" id="positionid" value="${u.position}">
										<select name="userRole" id="userRole"
											style="width: 40%; height: 48px; margin-left: 10px" class="form-control"
											title="按用户角色查询">
											<option value="">按用户角色查询</option>
											<option value="ordinary" id="ordinary">普通用户</option>
											<option value="admin" id="admin">管理员</option>
										</select>
										<input type="hidden" id="roleid" value="${u.userRole}">
									</div>
								</form>
								<div class="alert alert-danger" role="alert" id="error">
									<strong>Oh snap!</strong>
								</div>
<script type="text/javascript">
$("#error").hide();

var sex = "#" + $("#sexid").val();
$(sex).attr("selected", "selected");
var positionvalue = $("#positionid").val();
var position;
if (positionvalue == "Associate Manager") {
	position = "#AssociateManager";
} else if (positionvalue == "Senior Director") {
	position = "#SeniorDirector";
} else if (positionvalue == "Vice President") {
	position = "#VicePresident";
} else {
	position = "#" + positionvalue;
}
$(position).attr("selected", "selected");
var role = "#" + $("#roleid").val();
$(role).attr("selected", "selected");

function check() {
	return true;
}
</script>
							</div>
							<!-- //search -->
							<c:if test="${sessionScope.user.userRole == 'admin'}">
								<h4 style="float: right; margin-top: 0px">
									<a class="label label-warning" title="添加用户"
										onclick="add()">添加</a>
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
												<th width="25%">
													用户名
												</th>
												<th width="11%">
													性别
												</th>
												<th width="11%">
													职位
												</th>
												<th width="13%">
													角色
												</th>
												<th width="37%" style="text-align: center">
													操作
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="ur" items="${users}">
												<tr class="table-row">
													<td class="table-img" style="width: 15%">
														<img src="${ur.avatar}" alt="" />
													</td>
													<td class="table-text" style="width: 25%">
														<h6>
															${ur.userName}
														</h6>
														<p>
															签名：&nbsp;${ur.signature}
														</p>
													</td>
													<td style="width: 11%">
														<c:choose>
															<c:when test="${ur.sex == 'man'}">
																<span class="work">男</span>
															</c:when>
															<c:when test="${ur.sex == 'female'}">
																<span class="ur">女</span>
															</c:when>
															<c:otherwise>
																<span class="fam">保密</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td style="width: 11%">
													${ur.position}
													</td>
													<td style="width: 13%">
														<c:choose>
															<c:when test="${ur.userRole == 'admin'}">
																<span class="label label-danger">&nbsp;管&nbsp;理&nbsp;员&nbsp;</span>
															</c:when>
															<c:otherwise>
																<span class="label label-success">普通用户</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td style="width: 37%">
														<div class="share share_size_large share_type_twitter" 
															style="width: 50px">
															<a class="share__btn" onclick="query('${ur.userId}')">查看</a>
														</div>

														<div class="share share_size_large share_type_facebook"
															style="width: 50px">
															<a class="share__btn" onclick="modify('${ur.userId}')">修改</a>
														</div>
														<div class="share share_size_large share_type_gplus"
															style="width: 50px">
															<a class="share__btn"
																href="<%=basePath%>user/removeUser?userId=${ur.userId}">删除</a>
														</div>
													</td>
												</tr>
												<input type="hidden" id="namevalue${ur.userId}" value="${ur.userName}">
												<input type="hidden" id="positionvalue${ur.userId}" value="${ur.position}">
												<input type="hidden" id="nicknamevalue${ur.userId}" value="${ur.nickname}">
												<input type="hidden" id="sexvalue${ur.userId}" value="${ur.sex}">
												<input type="hidden" id="mobilevalue${ur.userId}" value="${ur.mobile}">
												<input type="hidden" id="emailvalue${ur.userId}" value="${ur.email}">
												<input type="hidden" id="addressvalue${ur.userId}" value="${ur.address}">
												<input type="hidden" id="signaturevalue${ur.userId}" value="${ur.signature}">
												<input type="hidden" id="userrolevalue${ur.userId}" value="${ur.userRole}">
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
<script type="text/javascript">
function query(userId) {
	var username = $("#namevalue" + userId).val();
	var position = $("#positionvalue" + userId).val();
	var nickname = $("#nicknamevalue" + userId).val();
	var sex = $("#sexvalue" + userId).val();
	var mobile = $("#mobilevalue" + userId).val();
	var email = $("#emailvalue" + userId).val();
	var address = $("#addressvalue" + userId).val();
	var signature = $("#signaturevalue" + userId).val();
	var role = $("#userrolevalue" + userId).val();
	if (role == "admin") {
		role = "管理员";
	} else {
		role = "普通用户";
	}
	
	$("#unid").html(username);
	$("#pid").html(position);
	$("#rid").html(role);
	$("#nnid").html(nickname);
	$("#sid").val(sex);
	$("#mid").html(mobile);
	$("#eid").html(email);
	$("#aid").html(address);
	$("#signid").html(signature);
	$("input:radio[value='" + sex + "']").prop("checked", "true");
	
	$("#look").click();
}

function modify(userId) {
	var username = $("#namevalue" + userId).val();
	var position = $("#positionvalue" + userId).val();
	var role = $("#userrolevalue" + userId).val();
	
	$("#uid").val(userId);
	$("#usernameid").val(username);
	$("#userroleid").find("option[value='" + role + "']").prop("selected", "selected");
	$("#positid").find("option[value='" + position + "']").prop("selected", "selected");
	
	$("#modify").click();
}

function add() {
	$("#alertinfo").html("请输入信息");
	$("#alertinfo").hide();
	
	$("#add").click();
}
</script>
							<div class="clearfix"></div>
							
							<!-- modal-dialog -->
							<div id="adddiv"><button id="add" data-toggle="modal" data-target="#addModal"></button></div>
							<div class="modal fade" id="addModal" tabindex="-1"
								role="dialog" aria-labelledby="addModalLabel" aria-hidden="true"
								style="display: none;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close second"
												data-dismiss="modal" aria-hidden="true" 
												onclick="cancel()">
												×
											</button>
											<h2 class="modal-title">
												人员添加
											</h2>
										</div>
										<div class="modal-body">
											<!--/set-1-->
											<div class="set-1">
												<div id="alertinfo" style="font-size: 12px; color: #FF0000">请输入信息</div>
												<div class="grid-1">
													<div class="form-body">
														<form id="addform" class="form-horizontal" 
														      onsubmit="return false" method="post">
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	用户名
																</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="addnameid"
																		name="userName"
																		placeholder="请输入用户名" onblur="checkUserName()">
																</div>
															</div>
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	职位
																</label>
																<div class="col-sm-9">
																	<select name="position" id="addpid" 
																	    style="height: 48px" 
																		class="form-control" title="请选择职位" onblur="checkPosition()">
																		<option value="">请选择职位</option>
																		<option value="Intern">
																			Intern
																		</option>
																		<option value="Officer">
																			Officer
																		</option>
																		<option value="Associate Manager"
																			id="AssociateManagerid">
																			Associate Manager
																		</option>
																		<option value="Manager">
																			Manager
																		</option>
																		<option value="Director">
																			Director
																		</option>
																		<option value="Senior Director"">
																			Senior Director
																		</option>
																		<option value="Vice President">
																			Vice President
																		</option>
																		<option value="President">
																			President
																		</option>
																	</select>
																</div>
															</div>
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	角色
																</label>
																<div class="col-sm-9">
																	<select name="userRole" id="addrid"
																		style="height: 48px" class="form-control"
																		title="请选择用户角色" onblur="checkUserRole()">
																		<option value="">请选择用户角色</option>
																		<option value="ordinary">
																			普通用户
																		</option>
																		<option value="admin" >
																			管理员
																		</option>
																	</select>
																</div>
															</div>
														</form>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
											<!--//set-1-->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" 
											    data-dismiss="modal" onclick="cancel()">
												取消
											</button>
											<button type="button" class="btn btn-primary"
												onclick="checkAndAdd()">
												保存修改
											</button>
										</div>
									</div>
<script type="text/javascript">
$("#alertinfo").hide();

$.ajaxSetup({
    async : false
});

function checkUserName() {
	var name = $("#addnameid").val();
	if (name == "") {
		$("#alertinfo").html("请输入用户名");
		$("#alertinfo").show();
		return false;
	} else {
		 $.post("<%=basePath%>user/queryUserName", 
            {userName : name}, 
		    function(data) {
                if (data == "ok") {
                	$("#alertinfo").html("");
                    $("#alertinfo").hide();
                } else {
                    $("#alertinfo").html("此用户名已存在");
                    $("#alertinfo").show();
                }
		});
		
		if ($("#alertinfo").html() == "") {
		    return true;
		} else {
		    return false;
		}
	}
}

function checkPosition() {
	var position = $("#addpid").val();
	if (position == "") {
		$("#alertinfo").html("请选择职位信息");
		$("#alertinfo").show();
		return false;
	} else {
		$("#alertinfo").html("");
		$("#alertinfo").hide();
		return true;
	}
}

function checkUserRole() {
	var role = $("#addrid").val();
	if (role == "") {
		$("#alertinfo").html("请选择用户角色");
		$("#alertinfo").show();
		return false;
	} else {
		$("#alertinfo").html("");
		$("#alertinfo").hide();
		return true;
	}
}

function cancel() {
	$("#addnameid").val("");
	$("#addpid").val("");
	$("#addrid").val("");
}

function checkAndAdd() {
	if ($("#alertinfo").html() != "") {
		$("#alertinfo").show();
		return;
	} else if (!checkUserName() || !checkPosition() || !checkUserRole()) {
		return;
	} else {
		 $.post("<%=basePath%>user/addUser", 
            $("#addform").serialize(), 
		    function(data) {
		        if (data == "ok") {
		        	window.location.href = "<%=basePath%>user/queryUsers";
                } else {
                    $("#alertinfo").html("添加失败");
                    $("#alertinfo").show();
                }
        });
		return;
	}
}
</script>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>

							<!-- modal-dialog -->
							<div id="modifydiv"><button id="modify" data-toggle="modal" data-target="#modifyModal"></button></div>
							<div class="modal fade" id="modifyModal" tabindex="-1"
								role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true"
								style="display: none;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close second"
												data-dismiss="modal" aria-hidden="true">
												×
											</button>
											<h2 class="modal-title">
												基本信息修改
											</h2>
										</div>
										<div class="modal-body">
											<!--/set-1-->
											<div class="set-1">
												<div id="einfo" style="font-size: 12px; color: #FF0000"></div>
												<div class="grid-1">
													<div class="form-body">
														<form id="nodifyform" class="form-horizontal" 
														      onsubmit="return false" method="post">
															<input type="hidden" id="uid" name="userId">
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	用户名
																</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="usernameid"
																		name="userName"
																		placeholder="请输入用户名" 
																		readonly="readonly">
																</div>
															</div>
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	职位
																</label>
																<div class="col-sm-9">
																	<select name="position" id="positid" 
																	    style="height: 48px" 
																		class="form-control" title="请选择职位">
																		<option value="Intern" id="Internid">
																			Intern
																		</option>
																		<option value="Officer" id="Officerid">
																			Officer
																		</option>
																		<option value="Associate Manager"
																			id="AssociateManagerid">
																			Associate Manager
																		</option>
																		<option value="Manager" id="Managerid">
																			Manager
																		</option>
																		<option value="Director" id="Directorid">
																			Director
																		</option>
																		<option value="Senior Director" id="SeniorDirectorid">
																			Senior Director
																		</option>
																		<option value="Vice President" id="VicePresidentid">
																			Vice President
																		</option>
																		<option value="President" id="Presidentid">
																			President
																		</option>
																	</select>
																</div>
															</div>
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	角色
																</label>
																<div class="col-sm-9">
																	<select name="userRole" id="userroleid"
																		style="height: 48px" class="form-control"
																		title="请选择用户角色">
																		<option value="ordinary" id="ordinaryid">
																			普通用户
																		</option>
																		<option value="admin" id="adminid">
																			管理员
																		</option>
																	</select>
																</div>
															</div>
														</form>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
											<!--//set-1-->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">
												取消
											</button>
											<button type="button" class="btn btn-primary"
												onclick="checkAndModify()">
												保存修改
											</button>
										</div>
									</div>
<script type="text/javascript">
$("#einfo").hide();
function checkAndModify() {
	$.post("<%=basePath%>user/modifyUser", 
            $("#nodifyform").serialize(), 
		    function(data) {
		        if (data == "ok") {
		            window.location.href = "<%=basePath%>user/queryUsers";
                } else {
                    $("#einfo").html("修改失败");
                    $("#einfo").show();
                }
    });
}
</script>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>

							<!-- modal-dialog -->
							<div id="lookdiv"><button id="look" data-toggle="modal" data-target="#myinfoModal"></button></div>
							<div class="modal fade" id="myinfoModal" tabindex="-1"
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
												用户基本信息
											</h2>
										</div>
										<div class="modal-body">
											<!--/set-1-->
											<div class="set-1">
												<div class="grid-1">
													<div class="form-body">
														<form class="form-horizontal" action="#"
															onsubmit="return false" method="post">
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	用户名
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="unid">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	职位
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="pid">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="username" class="col-sm-2 control-label">
																	角色
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="rid">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="nickname" class="col-sm-2 control-label">
																	昵称
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="nnid">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="sex" class="col-sm-2 control-label">
																	性别
																</label>
																<input type="hidden" id="sid">
																<div class="col-sm-9">
																	<input type="radio" name="sex" value="man"
																		disabled="disabled">
																	&nbsp;男&nbsp;&nbsp;
																	<input type="radio" name="sex" value="female"
																		disabled="disabled">
																	&nbsp;女&nbsp;&nbsp;
																	<input type="radio" name="sex" value="secret"
																		disabled="disabled">
																	&nbsp;保密
																</div>
															</div>
															<div class="form-group">
																<label for="mobile" class="col-sm-2 control-label">
																	手机
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="mid">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="email" class="col-sm-2 control-label">
																	Email
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="eid">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="address" class="col-sm-2 control-label">
																	工作地
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="aid">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="signature" class="col-sm-2 control-label">
																	&nbsp;&nbsp;&nbsp;&nbsp;个性签名
																</label>
																<div class="col-sm-9">
																	<div class="form-control" id="signid">
																	</div>
																</div>
															</div>
														</form>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
											<!--//set-1-->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">
												取消
											</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>


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

$("#lookdiv").hide();
$("#modifydiv").hide();
$("#adddiv").hide();
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
									<a href="<%=basePath%>user/queryUsers"><i
										class="lnr lnr-layers"></i><span>人员管理</span>
									</a>
								</li>
								<li id="menu-academico">
									<a href="<%=basePath%>resource/queryResources"><i
										class="lnr lnr-chart-bars"></i><span>资源管理</span>
									</a>
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