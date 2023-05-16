<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='user' value="${sessionScope.loginUser}" />
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

<title>My JSP 'bbsfloor.jsp' starting page</title>
<link rel="stylesheet" href="framework/css/bootstrap.css">
<link rel="stylesheet" href="framework/layui/css/layui.css" media="all">
<style>
.breadcrumb>li+li:before {
	color: #CCCCCC;
	content: "/ ";
	padding: 0 5px;
}

a {
	text-decoration: none;
	color: #000000;
	font-weight: bold;
}

a:hover {
	text-decoration: none;
	color: lightseagreen;
	font-weight: bold;
}

body {
	background: #F2F2F2;
}
</style>

</head>

<body>

	<ol class="breadcrumb">
		<li><a>论坛首页</a></li>
		<li><a href="bbsboard">板块页面</a></li>
		<li><a href="javascript:history.back(1)">贴吧页面</a></li>
		<li><a>内容页面</a></li>
	</ol>

	<ul class="layui-timeline">
		<c:forEach items="${floors}" var="floor" varStatus="floorstatus">
			<li class="layui-timeline-item"><i
				class="layui-icon layui-timeline-axis">&#xe63f;</i>
				<div class="layui-timeline-content layui-text">
					<h2 class="layui-timeline-title">${floor.floornum}楼&nbsp;&nbsp;&nbsp;${floor.floortime}</h2>

					<div class="layui-card">
						<div class="layui-card-header">
							<a href="javascript:;"> <img
								src="framework/images/img_user/${floor.user.headphoto}"
								class="layui-nav-img"> ${floor.user.username}
							</a>
						</div>
						<div class="layui-card-body">
							${floor.floorcontent}&nbsp;&nbsp;&nbsp; <a style="font-size: 15;">回复</a>

							<form class="layui-form" action="floorreply" method="post"
								style="display: none;">
								<input type="text" name="refloorcontent"
									placeholder="把你想要回复的写在这···" class="layui-input"> <input
									type="hidden" name="reuser_id" value="${floor.user.uid}">
								<input type="hidden" name="user_id" value="${user.uid}">
								<input type="hidden" name="floor_id" value="${floor.fid}">
								<button class="layui-btn layui-btn-sm" type="submit">发表</button>
							</form>
						</div>
					</div>
					<fieldset class="layui-elem-field">
						<legend>回复</legend>

						<div class="layui-field-box">
							<c:forEach items="${refloors}" var="refloor">
								<c:if test="${refloor.floor_id==floor.fid}">
									<a>${refloor.user.username}</a>&nbsp;&nbsp;回复&nbsp;&nbsp;
										<a>${refloor.reuser.username}</a>：${refloor.refloorcontent} <br> 回复时间：${refloor.refloortime}&nbsp;&nbsp;

										<a>回复</a>

									<form class="layui-form" action="floorreply" method="post"
										style="display: none;">
										<input type="text" name="refloorcontent"
											placeholder="把你想要回复的写在这···" class="layui-input"> <input
											type="hidden" name="user_id" value="${user.uid}"> <input
											type="hidden" name="reuser_id" value="${refloor.user.uid}">

										<input type="hidden" name="floor_id"
											value="${refloor.floor_id}">
										<button type="submit" class="layui-btn layui-btn-sm">发表</button>
									</form>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</fieldset>
				</div></li>
			<c:if test="${floorstatus.last==true}">
				<form action="postreply" method="post">
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label"><h3>回帖</h3></label>
						<div class="layui-input-block">
							<textarea id="textareaoflast" placeholder="请文明回帖" class="layui-textarea" name="floorcontent"></textarea>
							<input type="hidden" name="user_id" value="${user.uid}">
							<input type="hidden" name="post_id" value="${floor.post_id}">
							<input type="hidden" name="floornum" value="${floor.floornum+1}">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn " type="submit">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</c:if>
		</c:forEach>
	</ul>

	<script src="framework/js/jquery-3.3.1.js"></script>
	<script src="framework/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("div").find('a').click(function() {
			$(this).next().toggle();

		})
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			if (${user.uid==null}) {
				var btns = document.getElementsByTagName("button");
				$("#textareaoflast").attr("placeholder","游客请先登录");
				for (var i = 0; i < btns.length; i++) {
					btns[i].disabled = true;
					btns[i].classList.add("layui-btn-disabled");
				}
			}
		});
	</script>
</body>
</html>
