<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showinput.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="picture/ll.jpg">
    <form name="f1" action="/jiangxuejin1/InputScore2" method="post">
    <table>
    <tr align="center"><td>学号</td><td>姓名</td><td>平时成绩</td><td>期末成绩</td></tr>
    <c:forEach var="xy" items="${sc}">
    <tr><td>${xy.sid}</td><td>${xy.sname}</td><td><input type="text" size="15" name="pscore"/></td><td><input type="text" size="15" name="score"/></td></tr>
    </c:forEach>
    <tr><td><input type="submit" value="提    交"/></td><td><input type="reset" value="重    置"/></td></tr>
    </table>
    </form>
  </body>
</html>
