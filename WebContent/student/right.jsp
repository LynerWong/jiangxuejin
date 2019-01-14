<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
  </script>
  <body background="picture/fff.jpg">&nbsp; <strong>登陆成功<br>&nbsp; <br>&nbsp; <br><br>&nbsp; 学号</strong>：${userid} &nbsp;  姓名：  ${name1 }<br><br>&nbsp; <strong>请您注意</strong><br><br>&nbsp; 1.&nbsp; 请节约时间<br><br>&nbsp; 2.&nbsp; 每次登陆时间为30分钟<br><br>&nbsp;</body>
</html>
