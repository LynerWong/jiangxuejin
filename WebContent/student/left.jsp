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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link rel="stylesheet" type="text/css" href="css/font.css"/>
  </head>
  
  <body background="picture/left2.jpg">
    <table cellspacing="12" width="114" height="316">
    <tr>
    <td><font color="red" size="5"><a href="forward/student.jsp" target="_parent">首页</a></font></td>
    </tr>
    <tr>
    <td><a href="" target="f3"><b>申请书管理</b></a></td>
    </tr>
    <tr>
    <td><a href="student/querycredit.jsp" target="f3"><b>成绩查询</b></a></td>
    </tr>
    <tr>
    <td>
    <a href="/jiangxuejin1/QueryScholarship?id3=1" target="f2"><b>奖项查询</b></a>
    </td>
    </tr>
    <tr>
    <td>
    <a href="student/modiffypassword.jsp" target="f3"><b>修改密码</b></a>
    </td>
    </tr>
    <tr>
    <td>
    <a href="register.jsp" target="_parent"><b>退出系统</b></a>
    </td>
    </tr>
    </table>
  </body>
</html>
