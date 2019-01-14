<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>managerleft</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="css/font.css">
  </head>
  
  <body background="picture/left2.jpg">
    <table width="154" height="324">
    <tr><td><a href="" target="f3">审核申请书</a></td></tr>
    <tr><td><a href="manager/upload.jsp" target="f3">上传成绩</a></td></tr>
    <tr><td><a href="/jiangxuejin1/ModiffyM" target="f3">修改成绩</a></td></tr>
    <tr><td><a href="/jiangxuejin1/CaluScholar" target="f3">统计各专业获奖人员</a></td></tr>
    <tr><td><a href="/jiangxuejin1/QueryScholarship?id3=3">奖项查询</a></td></tr>
    <tr><td><a href="manager/modifypass.jsp"  target="f3">修改密码</a></td></tr>
    <tr><td><a href="register.jsp" target="_parent">退出系统</a></td></tr>
    </table>
  </body>
</html>
