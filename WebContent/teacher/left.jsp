<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>left</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	

  </head>
  
  <body background="picture/left2.jpg">
  
    <table width="107" height="302">
    <tr><td>&nbsp;&nbsp;&nbsp;<a href="forward/teacher.jsp" target="_parent"><b>首页</b></a></td><td valign="top"><br></td></tr>
    <tr><td>&nbsp;&nbsp;&nbsp;<a href="/jiangxuejin1/InputScore" target="f3"><b>录入成绩</b></a></td><td valign="top"><br></td></tr>
    <tr><td>&nbsp;&nbsp;&nbsp;<a href="/jiangxuejin1/UpdateCredit" target="f3"><b>修改成绩</b></a></td><td valign="top"><br></td></tr>
    <tr><td>&nbsp;&nbsp;&nbsp;<a href="/jiangxuejin1/QueryScholarship?id3=2" target="f2"><b>奖项查询</b></a></td><td valign="top"><br></td></tr>
    <tr><td>&nbsp;&nbsp;&nbsp;<a href="teacher/modifypass.jsp" target="f3"><b>修改密码</b></a></td><td valign="top"><br></td></tr>
    <tr><td>&nbsp;&nbsp;&nbsp;<a href="register.jsp" target="_parent"><b>退出系统</b></a></td><td valign="top"><br></td></tr>
    </table>
  </body>
</html>
