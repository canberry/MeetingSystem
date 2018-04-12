<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<!-- map -->
		<link href="css/jqvmap.css" rel='stylesheet' type='text/css' />
		<script src="js/jquery.vmap.js">
</script>
		<script src="js/jquery.vmap.sampledata.js" type="text/javascript">
</script>
		<script src="js/jquery.vmap.world.js" type="text/javascript">
</script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery('#vmap').vectorMap({
		    map: 'world_en',
		    backgroundColor: '#f4f4f4',
		    color: '#ffffff',
		    hoverOpacity: 0.7,
		    selectedColor: '#052963',
		    enableZoom: true,
		    showTooltip: true,
		    values: sample_data,
		    scaleColors: ['#052963', '#07A3B1'],
		    normalizeFunction: 'polynomial'
		});
	});
</script>
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


					<div class="outter-wp">
						<!--sub-heard-part-->
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li>
									<a href="index.jsp">主页</a>
								</li>
								<li class="active">
									我的
								</li>
							</ol>
						</div>
						<!--//sub-heard-part-->
						<!--/profile-->
						<h3 class="sub-tittle pro">
							个人中心
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
											<a title="" data-toggle="modal" data-target="#myinfoModal"> 
											<i class="fa fa-pencil-square-o icon_9"></i> 修改基本信息 </a>
										</li>
										<li>
											<a title="" data-toggle="modal" data-target="#myavatarModal">
											<i class="fa fa-download icon_9"></i> 修改头像 </a>
										</li>
										<li>
											<a href="query_myuserinfo.jsp" title="">
											<i class="fa fa-calendar icon_9"></i> 修改技能</a>
										</li>
										<li>
											<a href="modify_password.jsp" title=""> 
											<i class="fa fa-times"></i> 账户与安全 </a>
										</li>
									</ul>
								</div>
							</div>
						</h3>
						
                        <!-- modal-dialog -->
						<div class="modal fade" id="myinfoModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							style="display: none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close second" 
											data-dismiss="modal" aria-hidden="true" 
											onclick="cancelModify()">
											×
										</button>
										<h2 class="modal-title">
											基本信息修改
										</h2>
									</div>
									<div class="modal-body">
										<!--/set-1-->
										<div class="set-1">
										    <div id="errorinfo" style="font-size:12px; color:#FF0000"></div>
											<div class="grid-1">
												<div class="form-body">
													<form id="nodifyform" class="form-horizontal" action="#" onsubmit="return false" method="post">
														<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}">
														<div class="form-group">
															<label for="username" class="col-sm-2 control-label">
																用户名
															</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="username" name="userName" 
																	placeholder="${sessionScope.user.userName}"
																	readonly="readonly">
															</div>
														</div>
														<div class="form-group">
															<label for="nickname" class="col-sm-2 control-label">
																昵称
															</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" 
																	id="nickname" name="nickname" 
																	placeholder="${sessionScope.user.nickname}" >
															</div>
														</div>
														<div class="form-group">
														    <label for="sex" class="col-sm-2 control-label">
																性别
															</label>
															<input type="hidden" id="sex" value="${sessionScope.user.sex}">
															<div class="col-sm-9">
																<input type="radio" name="sex" value="male" checked>&nbsp;男&nbsp;&nbsp;
																<input type="radio" name="sex" value="female" checked>&nbsp;女&nbsp;&nbsp;
																<input type="radio" name="sex" value="secret" checked>&nbsp;保密
															</div>
														</div>
<script type="text/javascript">
var sex = $("#sex").val();
$("input:radio[value='"+ sex +"']").prop("checked", "true");
</script>
														<div class="form-group">
														    <label for="mobile" class="col-sm-2 control-label">
																手机
															</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" 
																	id="mobile" name="mobile" 
																	placeholder="${sessionScope.user.mobile}" 
																	onblur="checkMobile()">
															</div>
														</div>
														<div class="form-group">
														    <label for="email" class="col-sm-2 control-label">
																Email
															</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" 
																	id="email" name="email" 
																	placeholder="${sessionScope.user.email}" 
																	onblur="checkEmail()">
															</div>
														</div>
														<div class="form-group">
														    <label for="address" class="col-sm-2 control-label">
																工作地
															</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" 
																	id="address" name="address" 
																	placeholder="${sessionScope.user.address}">
															</div>
														</div>
														<div class="form-group">
														    <label for="signature" class="col-sm-2 control-label">
																&nbsp;&nbsp;&nbsp;&nbsp;个性签名
															</label>
															<div class="col-sm-9">
															    <textarea class="form-control" rows="5" cols="100" 
																	id="signature" name="signature" 
																	placeholder="${sessionScope.user.signature}"
																	wrap="virtual" maxlength="280"></textarea>
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
											data-dismiss="modal" onclick="cancelModify()">
											取消
										</button>
										<button type="button" class="btn btn-primary" onclick="checkAndModify()">
											保存修改
										</button>
									</div>
								</div>
<script type="text/javascript">
$("#errorinfo").hide();
function checkMobile() {
	var mobilereg = /^1[3|4|5|7|8][0-9]{9}$/;
	var mobile = $("#mobile").val();
	var flag = false;
	var message;
	if (mobile == "") {
		flag = true;
	} else if (!mobilereg.test(mobile)) {
		message = "请输入有效的手机号码";
	} else {
		flag = true;
	}
	
	if (!flag) {
		$("#errorinfo").html(message);
		$("#errorinfo").show();
		return false;
	} else {
		$("#errorinfo").html("");
		$("#errorinfo").hide();
		return true;
	}
}

function checkEmail() {
	var emailreg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	var email = $("#email").val();
	var flag = false;
	var message;
	if (email == "") {
		//message = "邮箱输入不能为空";
		flag = true;
	} else if (!emailreg.test(email)) {
		message = "请输入有效的邮箱地址";
	} else {
		flag = true;
	}
	
	if (!flag) {
		$("#errorinfo").html(message);
		$("#errorinfo").show();
		return false;
	} else {
		$("#errorinfo").html("");
		$("#errorinfo").hide();
		return true;
	}
}

function checkAndModify() {
	if ($("#errorinfo").html() != "") {
        $("#errorinfo").show();
        return;
    } else if (!checkMobile() || !checkEmail()) {
        return;
    } else {
        $.post("<%=basePath%>user/modifyUser", 
            $("#nodifyform").serialize(), 
		    function(data) {
		        if (data == "ok") {
		            //修改session
		            var userId = $("#userId").val();
		            window.location.href = "<%=basePath%>user/changeUserSession?userId=" + userId;
                } else {
                    $("#errorinfo").html("修改失败");
                    $("#errorinfo").show();
                }
        });
    }
}

function cancelModify() {
	var sex = $("#sex").val();
    $("input:radio[value='"+ sex +"']").prop("checked", "true");
	$("#nickname").val("");
	$("#mobile").val("");
	$("#email").val("");
	$("#address").val("");
	$("#signature").val("");
	$("#errorinfo").html("");
	$("#errorinfo").hide();
}
</script>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						
					    <!-- avatar modal-dialog -->
						<div class="modal fade" id="myavatarModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							style="display: none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close second" 
											data-dismiss="modal" aria-hidden="true" 
											onclick="cancelAvatarModify()">
											×
										</button>
										<h2 class="modal-title">
											头像修改
										</h2>
									</div>

									<form action="<%=basePath%>user/uploadAvatar" method="post" enctype="multipart/form-data">
										<div class="modal-body">
										    <div id="imgerrorinfo" style="font-size:12px; color:#FF0000">请选择需要上传的图片</div>
											<div class="form-horizontal">
												<input type="hidden" id="avatar-value" 
													value="${sessionScope.user.avatar}">
												<div id="imgPreview" style="width: 100px; height: 100px">
													<img id="viewImg" src="${sessionScope.user.avatar}"
														alt="avatar/default_avatar.jpg" />
												</div>
												<div class="form-group"
													style="margin-top: 20px; margin-left: 1px">
													<input type="file" name="file" id="imgfile" onchange="previewImg(this)">													
												</div>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal" onclick="cancelAvatarModify()">
												取消
											</button>
											<button type="submit" class="btn btn-primary" onclick="return checkAndModifyAvatar()">
												保存修改
											</button>
										</div>
									</form>
								</div>
<script type="text/javascript">
$("#imgerrorinfo").hide();
function cancelAvatarModify() {
	$("#imgfile").val("");
	var imgsrc = $("#avatar-value").val();
	$("#viewImg").attr("src", imgsrc);
	$("#imgerrorinfo").html("请选择需要上传的图片");
	$("#imgerrorinfo").hide();
}

function previewImg(imgFile) {
	var imgreg = /\.(jpg|jpeg|png|JPG|PNG)$/;
	if (imgFile.value == "") {
		var imgsrc = $("#avatar-value").val();
	    $("#viewImg").attr("src", imgsrc);
		$("#imgerrorinfo").html("请选择需要上传的图片");
		$("#imgerrorinfo").show();
		return false;
	} else if (!imgreg.test(imgFile.value)) {
		$("#imgerrorinfo").html("不支持的图片格式!图片类型必须是.jpeg,jpg,png格式!")
		$("#imgerrorinfo").show();
		return false;
	} else {
		var path;
		if (document.all) {
			path = document.selection.createRange().text;
			document.getElementById("imgPreview").innerHTML="";
			document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
		} else {
			path = URL.createObjectURL(imgFile.files[0]);
			$("#viewImg").attr("src", path);
		}
		
		$("#imgerrorinfo").html("");
		$("#imgerrorinfo").hide();
		return true;
	}
}

function checkAndModifyAvatar() {
	if ($("#imgerrorinfo").html() != "") {
		$("#imgerrorinfo").show();
		return false;
	} else {
		return true;
	}
}
</script>
								<!-- /.modal-content -->
							</div>
							<!-- /.avatar modal-dialog -->
						</div>
						

						<div class="profile-widget">
							<img src="${sessionScope.user.avatar}"
								alt="avatar/default_avatar.jpg" />
							<h2>
								${sessionScope.user.userName}
							</h2>
							<p>
								${sessionScope.user.position}
							</p>
						</div>
						
						<!--/profile-inner-->
						<div class="profile-section-inner">
							<div class="col-md-6 profile-info">
								<h3 class="inner-tittle">
									个人信息
								</h3>
								<div class="main-grid3">
									<div class="p-20">
										<div class="about-info-p">
											<strong>昵称</strong>
											<br>
											<p class="text-muted">
												${sessionScope.user.nickname}
											</p>
										</div>
										<div class="about-info-p">
											<strong>性别</strong>
											<br>
											<p class="text-muted">
											    <c:choose>
											      <c:when test="${sessionScope.user.sex eq 'man'}">
											          男
											      </c:when>
											      <c:when test="${sessionScope.user.sex eq 'female'}">
											          女
											      </c:when>
											      <c:otherwise>
											          保密
											      </c:otherwise>
											    </c:choose>
											</p>
										</div>
										<div class="about-info-p">
											<strong>手机</strong>
											<br>
											<p class="text-muted">
												${sessionScope.user.mobile}
											</p>
										</div>
										<div class="about-info-p">
											<strong>Email</strong>
											<br>
											<p class="text-muted">
											    <c:choose>
											      <c:when test="${sessionScope.user.email eq '请添加个人邮箱地址'}">
											        ${sessionScope.user.email}
											      </c:when>
											      <c:otherwise>
											        <a href="mailto:${sessionScope.user.email}" style="text-decoration:underline; color=#0066FF">
											        ${sessionScope.user.email}</a>
											      </c:otherwise>
											    </c:choose>
											</p>
										</div>
										<div class="about-info-p m-b-0">
											<strong>工作地点</strong>
											<br>
											<p class="text-muted">
												${sessionScope.user.address}
											</p>
										</div>
									</div>
								</div>
								<h3 class="inner-tittle">
									个人签名
								</h3>
								<div class="main-grid3 p-skill">
									<p>${sessionScope.user.signature}</p>
								</div>
								<h3 class="inner-tittle two">
									技能
								</h3>
								<div class="main-grid3">
									<div class="bar">
										<p>
											Java
										</p>
									</div>
									<div class="skills">
										<div class="skill1" style="width: 98%">
										</div>
									</div>
									<div class="bar">
										<p>
											HTML / CSS3 / SASS
										</p>
									</div>
									<div class="skills">
										<div class="skill2" style="width: 90%">
										</div>
									</div>
									<div class="bar">
										<p>
											Javascript
										</p>
									</div>
									<div class="skills">
										<div class="skill3" style="width: 75%">
										</div>
									</div>
									<div class="bar">
										<p>
											Spring / SpringMVC / MyBatis
										</p>
									</div>
									<div class="skills">
										<div class="skill4" style="width: 80%">
										</div>
									</div>
									<div class="bar">
										<p>
											UI/UX
										</p>
									</div>
									<div class="skills">
										<div class="skill1" style="width: 78%">
										</div>
									</div>
									<div class="bar">
										<p>
											Wordpress
										</p>
									</div>
									<div class="skills">
										<div class="skill1" style="width: 85%">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 profile-info two">
								<h3 class="inner-tittle">
									动态
								</h3>
								<div class="main-grid3 p-skill">

									<ul class="timeline">
										<li>
											<div class="timeline-badge info">
												<i class="fa fa-smile-o"></i>
											</div>
											<div class="timeline-panel">
												<div class="timeline-heading">
													<h4 class="timeline-title">
														<a href="profile.html">叶鹏霄</a>
													</h4>
												</div>
												<div class="timeline-body">
													<p class="time">
														2 分钟前
													</p>
													<p>
														上传 2 张照片
														<i class="fa fa-picture-o"></i>
													</p>
												</div>
											</div>
										</li>
										<li>
											<div class="timeline-badge primary">
												<i class="fa fa-star-o"></i>
											</div>
											<div class="timeline-panel">
												<div class="timeline-heading">
													<h4 class="timeline-title">
														<a href="profile.html">邹圆圆</a>
													</h4>
												</div>
												<div class="timeline-body">
													<p class="time">
														5 分钟前
													</p>
													<p>
														发表新动态
													</p>
												</div>
											</div>
										</li>
										<li>
											<div class="timeline-badge danger">
												<i class="fa fa-times-circle-o"></i>
											</div>
											<div class="timeline-panel">
												<div class="timeline-heading">
													<h4 class="timeline-title">
														<a href="profile.html">郭文婷</a>
													</h4>
												</div>
												<div class="timeline-body">
													<p class="time">
														10 分钟前
													</p>
													<p>
														发表了新动态
													</p>
												</div>
											</div>
										</li>
										<li>
											<div class="timeline-badge success">
												<i class="fa fa-check-circle-o"></i>
											</div>
											<div class="timeline-panel">
												<div class="timeline-heading">
													<h4 class="timeline-title">
														<a href="profile.html">曾玥</a>
													</h4>
												</div>
												<div class="timeline-body">
													<p class="time">
														15 分钟前
													</p>
													<p>
														上传 3 张新照片
														<i class="fa fa-picture-o"></i>
													</p>
												</div>
											</div>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
							</div>
							<!--/map-->
							<div class="col-md-6 profile-info two">
								<h3 class="inner-tittle two">
									办公点
								</h3>
								<div class="main-grid3 map">
										<div class="map_container">
											<div id="vmap" style="width: 100%; height: 280px;"></div>
										</div>
									<div class="gmap-info">
										<h4>
											<i class="fa fa-map-marker"></i>
											<b><a href="query_myuserinfo.jsp" class="text-dark">${sessionScope.user.address}</a> </b>
										</h4>
									</div>
								</div>
								<!--//map-->
							</div>
							<div class="clearfix"></div>
						</div>
						<!--//profile-inner-->
						<!--//profile-->
						<!--//outer-wp-->
					</div>
				</div>
			</div>
			<!--//content-inner-->


			<!--/sidebar-menu-->
			<div class="sidebar-menu">
				<header class="logo">
				<a class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
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
							<a href="#"><i class="fa fa-table"></i> <span>会议室查询</span> <span
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
							<a href="#"><i class="lnr lnr-book"></i> <span>会议预约</span> <span
								class="fa fa-angle-right" style="float: right"></span> </a>
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
								<span class="fa fa-angle-right" style="float: right"></span> </a>
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
		<script src="js/datamaps-all.js">
</script>
		<script src="js/map.js">
</script>

		<script type="text/javascript" src="js/vroom.js">
</script>
		<script type="text/javascript" src="js/TweenLite.min.js">
</script>
		<script type="text/javascript" src="js/CSSPlugin.min.js">
</script>
		<!-- <script src="js/jquery.nicescroll.js"></script> -->
		<script src="js/scripts.js">
</script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js">
</script>
	</body>
</html>