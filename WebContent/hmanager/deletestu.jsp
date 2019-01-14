<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deletestu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript">
  function init(){
    if(${!empty info}) alert("${info}");
  }
  function back(){
    location.href("hmanager/right.jsp");
  }
  </script>
  <body onload="init()" background="picture/ll.jpg"> 
  <form name="f1" action="/jiangxuejin1/Delete?id=3" method="post">
    <strong><font size="5">删除学生</font></strong><br><br><br>请输入学生学号：<input type="text" maxlength="20" name="sid"><br><br>&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="确定删除" name="button18"> &nbsp; &nbsp;&nbsp; <input type="button" value="返   回" name="button19" onclick="back()">
    </form>
  </body>
</html>
