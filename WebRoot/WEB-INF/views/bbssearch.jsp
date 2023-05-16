<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'bbssearch.jsp' starting page</title>
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
</style>
</head>

<body>
	<ol class="breadcrumb">
		<li><a>论坛首页</a></li>
		<li><a href="bbsboard">板块页面</a></li>
		<li><a>搜索页面</a></li>
	</ol>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>搜索-用户</legend>
	</fieldset>
	<div class="layui-collapse">
		<c:forEach items="${sessionScope.searchuserinfo}" var="suser">
			<div class="layui-colla-item">
				<h2 class="layui-colla-title">&nbsp;&nbsp;&nbsp;&nbsp;昵称：${suser.username}&nbsp;&nbsp;&nbsp;&nbsp;UID:${suser.uid}</h2>
				<div class="layui-colla-content layui-show">
					<table class="layui-table">
						<colgroup>
							<col width="100">
							<col>
						</colgroup>
						<tr>
							<th rowspan="2"><img
								src="framework/images/img_user/${suser.headphoto}"
								class="layui-nav-img"></th>
							<td>邮箱：${suser.email}&nbsp;&nbsp;会员等级：${suser.power}</td>
						</tr>
						<tr>
							<td>签名：${suser.underwrite}</td>
						</tr>
					</table>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr class="layui-bg-green">
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>搜索-帖子</legend>
	</fieldset>
	<table class="layui-table">
		<colgroup>
			<col width="250">
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<c:forEach items="${sessionScope.searchpostinfo}" var="spost">
			<tr>
				<th>${spost.posttitle}</th>
				<th>${spost.user.username}</th>
				<th>${spost.postheat}</th>
				<th>${spost.posttime}</th>
			</tr>
		</c:forEach>
	</table>

	<script src="framework/js/jquery-3.3.1.js"></script>
	<script src="framework/js/bootstrap.js"></script>
	<script src="framework/layui/layui.js"></script>

	<script>
		//注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;

			//…
		});
	</script>

</body>
</html>
