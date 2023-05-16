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

<title>My JSP 'bbspost.jsp' starting page</title>


<link rel="stylesheet" href="framework/css/bootstrap.min.css">
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

.pagenum {
	width: 100%;
	padding: 10px 20px;
	text-align: center;
}
</style>
</head>

<body>
	<ol class="breadcrumb">
		<li><a>论坛首页</a></li>
		<li><a href="bbsboard">板块页面</a></li>
		<li><a>贴吧页面</a></li>
	</ol>
	<button onclick="window.location.href = 'bbsnewpost'" type="button"
		class="btn btn-success">
		<i class="layui-icon layui-icon-tabs"></i>&nbsp;&nbsp;New Post
	</button>
	<table class="table table-hover">
		<thead>
			<tr>
				<th width="40%">标题</th>
				<th width="20%">发帖人</th>
				<th width="10%">热度</th>
				<th width="10%">话题</th>
				<th>发帖时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${posts}" var="post">
				<tr>
					<td><a href="showfloors.action?pid=${post.pid}">${post.posttitle}</a></td>
					<td><a href="showuser.action?uid=${post.user.uid}">${post.user.username}</a></td>
					<td><a>${post.postheat}</a></td>
					<td><a>${post.posttype}</a></td>
					<td><a>${post.posttime}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagenum">
		<ul class="pagination pagination-lg">
			<li><a href="pagenum.action?pageNow=1">&laquo;</a></li>
			<c:forEach var="i" begin="1" end="${page.totalPageCount}">
				<c:choose>
					<c:when test="${i==page.pageNow}">
						<li class="active"><a href="pagenum.action?pageNow=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="pagenum.action?pageNow=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li><a href="pagenum.action?pageNow=${page.totalPageCount}">&raquo;</a></li>
		</ul>
	</div>

	<script src="framework/js/jquery-3.3.1.js"></script>
	<script src="framework/js/bootstrap.min.js"></script>
</body>
</html>
