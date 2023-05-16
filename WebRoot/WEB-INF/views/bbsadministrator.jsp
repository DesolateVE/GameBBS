<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bbsadministrator.jsp' starting page</title>
    
	

  </head>
  
  <body>
    <c:forEach items="${allusers}" var="alluser">
    <table>
    <tr>
    
    </tr>
    </table>
    </c:forEach>
    
    
  </body>
</html>
