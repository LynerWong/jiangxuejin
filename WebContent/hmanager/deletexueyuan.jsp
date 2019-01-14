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
    
    <title>My JSP 'deletexueyuan.jsp' starting page</title>
    
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
  function check(form){
     var i=0;
     <c:forEach var="xy" items="${xueyuan}">
     if(form.mana[i].checked){
       form.m.value="${xy.xueyuanid}";
       alert("删除${xy.xueyuanname}");
     }
     i++;
     </c:forEach>
  
  }
  </script>
  <body onload="init()" background="picture/ll.jpg"> 
   <form name="f1" action="/jiangxuejin1/Delete?id=5" method="post">
   <input type="hidden" name="m">
    <strong><font size="5">删除学院</font></strong><br><table width="384" border="1" height="52">
<tbody><tr>
<td>&nbsp;是否删除</td>
<td>&nbsp;学院号</td>
<td>&nbsp;学院名称</td></tr>
<c:forEach var="xy" items="${xueyuan}">
<tr>
<td align="center"><input type="checkbox" name="mana" value="${xy.xueyuanid}"/></td>
<td>${xy.xueyuanid }</td>
<td>${xy.xueyuanname}</td></tr>
</c:forEach>
</tbody></table><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="确定删除" name="button12" onclick="check(f1)"> &nbsp; &nbsp; &nbsp;&nbsp; <input type="button" value="返   回" name="button13">
</form>
  </body>
</html>
