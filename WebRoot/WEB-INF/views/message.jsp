<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'message.jsp' starting page</title>
<link rel="stylesheet" href="framework/css/bootstrap.css">
<link rel="stylesheet" href="framework/layui/css/layui.css"
	media="all">
</head>

<body>
	<div class="row">
		<div class="col-md-6 text-center">
			<font color="red"> <br />
				<h3>公告</h3></font><br />
			<p class="lead text-left">
				&nbsp;&nbsp;&nbsp;&nbsp;<strong>请勿谈论国家与政治有关话题，禁止透漏他人信息，谨防上当受骗。</strong>
			</p>
			<hr />
			<h3>广告位待出租</h3>
		</div>
		<div class="col-md-6 text-center">
			<br />
			<h3>
				<font color="turquoise">最新发帖</font><font color="red"><i
					class="layui-icon layui-icon-fire"></i></font>
			</h3>
			<table class="layui-table" lay-skin="nob">
				<thead>
					<tr>
						<th width="60%">&nbsp;&nbsp;帖名</th>
						<th>&nbsp;&nbsp;发表时间</th>
					</tr>
				</thead>
				<tr>
					<th>&nbsp;&nbsp;<a href="#">这里接入name</a></th>
					<th>&nbsp;&nbsp;<a href="#">这里接入time</a></th>
				</tr>
				<tr>
					<th></th>
					<th></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
