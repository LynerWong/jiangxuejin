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
    
    <title>My JSP 'addmanager.jsp' starting page</title>
    
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
  <body onload="init()" background="picture/ll.jpg"> &nbsp; 
    <br><form method="post" action="/jiangxuejin1/Add?id=1" name="f1"><p>&nbsp; &nbsp; &nbsp;&nbsp; <img height="32" width="38" border="0" src="picture/add.bmp"><font size="6"><strong>添加管理员</strong></font></p><table width="295" border="0" align="left" height="235">
<tbody><tr><td valign="">&nbsp;&nbsp; 教职工号：<br></td><td valign=""><input type="text" maxlength="20" name="mid"></td></tr><tr>
<td>&nbsp;&nbsp; 姓&nbsp;&nbsp;&nbsp; 名：<br></td><td>&nbsp;<input type="text" maxlength="20" name="mname"></td></tr>
<tr><td valign="top">&nbsp;&nbsp; 学&nbsp;&nbsp;&nbsp; 院：<br></td><td valign="top"><select name="xueyuan">
<c:forEach var="xy" items="${xueyuan}">
<option value="${xy.xueyuanid }">${xy.xueyuanname }</option>
</c:forEach>
</select>
</td></tr><tr>
<td>&nbsp;&nbsp; 密 &nbsp;&nbsp; 码：</td>
<td>&nbsp;<input type="password" maxlength="20" name="password"></td></tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>
<tr>
<td>&nbsp;<input type="submit" value="提  交" name="button2"></td>
<td>&nbsp;<input type="reset" value="重  置" name="button3"></td></tr>
</tbody></table><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></form>
  </body>
</html>
