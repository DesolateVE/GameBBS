<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='user' value="${sessionScope.loginUser}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bbsuser.jsp' starting page</title>

  </head>
  
  <body>
   个人信息<br>
  昵称：${user.username}<br>
  邮箱：${user.email}<br>
  性别：${user.sex}<br>
  注册时间：${user.registertime}<br>
  个人签名：${user.underwrite}
  </body>
</html>
