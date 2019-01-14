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
    
    <title>My JSP 'deletemanager.jsp' starting page</title>
    
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
     <c:forEach var="xy" items="${manager}">
     if(form.mana[i].checked){
       form.m.value="${xy.mid}";
       alert("删除${xy.mname}");
     }
     i++;
     </c:forEach>
  
  }
  </script>
  <body onload="init()" background="picture/ll.jpg"> 
    <form method="post" action="/jiangxuejin1/Delete?id=1" name="f1"><p><font size="5"><strong>删除管理员</strong></font></p>
    <input type="hidden" name="m">
    <table width="485" border="1" height="70">
<tbody><tr>
<td align="center">&nbsp;是否删除</td>
<td align="center">&nbsp;管理员账号</td>
<td align="center">姓名 <br></td>
<td align="center">所属学院 <br></td></tr>
<c:forEach var="xy" items="${manager}">
<tr>
<td align="center"><input type="checkbox" name="mana" value="${xy.mid }"/></td>
<td>${xy.mid }</td>
<td>${xy.mname}</td>
<td>${xy.xueyuanid}</td></tr></c:forEach>
</tbody></table><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="确定删除" name="button11" onclick="check(f1)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="返   回" name="button15"></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></form> 
  </body>
</html>
