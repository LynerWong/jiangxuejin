<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addxueyuan.jsp' starting page</title>
    
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
  function init(){
  if(${!empty info}) alert("${info}");}
  </script>
  <body onload="init()" background="picture/ll.jpg"> 
    <form method="post" name="f1" action="/jiangxuejin1/Add?id=5"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="27" width="31" border="0" src="picture/add.bmp"> <strong><font size="6">添加学院</font></strong><br></p><table width="285" height="242">
<tbody><tr>
<td>&nbsp;请输入学院号</td>
<td>&nbsp;<input type="text" maxlength="20" name="xueyuanid"></td></tr>
<tr>
<td>&nbsp;请输入学院名</td>
<td>&nbsp;<input type="text" maxlength="20" value="" name="xueyuanname"></td></tr>
<tr>
<td>&nbsp;&nbsp; <input type="submit" name="submit" value="提  交"></td>
<td>&nbsp; &nbsp; <input type="reset" value="重  置" name="button5"></td></tr>
</tbody></table><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></form>
  </body>
</html>
