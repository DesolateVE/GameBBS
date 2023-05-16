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

<title>My JSP 'bbsnewpost.jsp' starting page</title>

<link rel="stylesheet" href="framework/css/bootstrap.css">
<link rel="stylesheet" href="framework/layui/css/layui.css" media="all">
<style type="text/css">
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

select option {
	font-size: 20px;
}
</style>
</head>

<body>
	<ol class="breadcrumb">
		<li><a>论坛首页</a></li>
		<li><a href="bbsboard">板块页面</a></li>
		<li><a href="javascript:history.go(-1)">贴吧页面</a></li>
		<li><a>发布新贴</a></li>
	</ol>


	<form class="form-horizontal" action="createpost" role="form"
		method="post">
		<div class="form-group">
			<label class="col-sm-2 control-label">标题</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="posttitle"
					placeholder="请输入将要发布的标题">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">所属分类</label>
			<div class="col-sm-10">
				<select class="form-control" name="posttype">
					<option value="1">请选择分类</option>
					<c:choose>
						<c:when test="${user.power==0}">
							<option value="0">公告</option>
						</c:when>
						<c:otherwise>
							<optgroup label="公告"></optgroup>
						</c:otherwise>
					</c:choose>
					<option value="1">杂谈</option>
					<option value="2">开黑</option>
					<option value="3">原创</option>
					<option value="4">活动</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label class="col-sm-2 control-label"></label>
				<textarea name="floorcontent" id="textareaofnewpost"
					class="form-control" rows="3"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="buttonofnewpost" type="submit" class="btn btn-info">提交</button>
			</div>
		</div>

		<input type="hidden" name="board_id" value="${sessionScope.bid}" /> 
		<input type="hidden" name="floornum" value="1" /> 
		<input type="hidden" name="user_id" value="${user.uid}" />
	</form>
	<script src="framework/js/jquery-3.3.1.js"></script>
	<script src="framework/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			if (${user.uid==null}) {
				var btn = document.getElementById("buttonofnewpost");
				$("#textareaofnewpost").attr("placeholder", "游客请先登录");
				btn.disabled = true;
			}
		});
	</script>
</body>
</html>
