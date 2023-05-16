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

<title>My JSP 'bbsboard.jsp' starting page</title>


<link rel="stylesheet" href="framework/css/bootstrap.css">
<link rel="stylesheet" href="framework/layui/css/layui.css"
	media="all">
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
		<li><a>板块页面</a></li>
	</ol>

	<table class="layui-table" lay-skin="line">
		<colgroup>
			<col width="150">
			<col width="300">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>主机游戏</th>
				<th></th>
				<th></th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td></td>
				<td>板块</td>
				<td>板块热度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最后发表</td>
			</tr>
			<c:forEach items="${boards}" var="board">
				<c:if test="${board.boardclassfication==0}">
					<tr>
						<td><img
							src="framework/images/img_board/${board.boardimage}"
							class="img-thumbnail" /></td>
						<td>板块名称： <a href="showposts.action?bid=${board.bid}">《${board.boardname}》</a><br>版主：${board.user.username}<br>板块简介：${board.boardintroduction}
						</td>
						<td>总帖数：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;帖名：<br>今日发表：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

	<table class="layui-table" lay-skin="line">
		<colgroup>
			<col width="150">
			<col width="300">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>热门手游</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td></td>
				<td>板块</td>
				<td>板块热度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最后发表</td>
			</tr>
			<c:forEach items="${boards}" var="board">
				<c:if test="${board.boardclassfication==1}">
					<tr>
						<td><img
							src="framework/images/img_board/${board.boardimage}"
							class="img-thumbnail" /></td>
						<td>板块名称： <a href="showposts.action?bid=${board.bid}">《${board.boardname}》</a><br>版主：${board.user.username}<br>板块简介：${board.boardintroduction}
						</td>
						<td>总帖数：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;帖名：<br>今日发表：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

	<table class="layui-table" lay-skin="line">
		<colgroup>
			<col width="150">
			<col width="300">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>单机攻略</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td></td>
				<td>板块</td>
				<td>板块热度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最后发表</td>
			</tr>
			<c:forEach items="${boards}" var="board">
				<c:if test="${board.boardclassfication==2}">
					<tr>
						<td><img
							src="framework/images/img_board/${board.boardimage}"
							class="img-thumbnail" /></td>
						<td>板块名称： <a href="showposts.action?bid=${board.bid}">《${board.boardname}》</a><br>版主：${board.user.username}<br>板块简介：${board.boardintroduction}
						</td>
						<td>总帖数：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;帖名：<br>今日发表：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

	<script src="framework/layui/layui.js"></script>


</body>
</html>
