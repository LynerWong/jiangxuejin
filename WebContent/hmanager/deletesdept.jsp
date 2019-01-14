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
    
    <title>My JSP 'deletesdept.jsp' starting page</title>
    
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
     <c:forEach var="xy" items="${sdept}">
     if(form.mana[i].checked){
       form.m.value="${xy.sdid}";
       alert("删除${xy.sdname}");
     }
     i++;
     </c:forEach>
  
  }
  </script>
  <body onload="init()" background="picture/ll.jpg"><strong><font size="5">删除专业<br></font></strong><form name="f1" action="/jiangxuejin1/Delete?id=2" method="post">
  <input type="hidden" name="m"> 
  <table border="1" style="width: 658px; height: 314px;">
<tbody><tr>
<td>&nbsp;<table border="0" style="width: 200px; height: 249px;">
<tbody><tr>
<td>&nbsp;</td>
<td>&nbsp;<input type="radio" checked="checked" value="1" name="type1">模糊查询</td></tr>
<tr>
<td>&nbsp;专业所属学院</td>
<td>&nbsp;<select name="xueyuan">
<c:forEach var="xy" items="${xueyuan}">
<option value="${xy.xueyuanid }">${xy.xueyuanname}</option>
</c:forEach>
</select>
</td></tr>
<tr>
<td><br></td>
<td>&nbsp;<input type="radio" name="type1" value="2"> 精确查询</td></tr>
<tr>
<td>&nbsp;专业号</td>
<td>&nbsp;<input type="text" maxlength="20" name="sdid" size="15"></td></tr>
<tr>
<td>&nbsp;<input type="submit" value="查  询" name="button8"></td>
<td>&nbsp;</td></tr>
</tbody></table></td>
<td><table width="479" border="0" height="305">
<tbody><tr>
<td align="center"><font size="5"><strong>&nbsp;专业信息</strong></font></td></tr>
<tr>
<td><table width="468" border="1" height="18">
<tbody><tr>
<td>&nbsp;是否删除</td>
<td>&nbsp;专业号</td>
<td>&nbsp;专业名称</td></tr>
<c:forEach var="xy" items="${sdept}">
<tr>
<td align="center"><input type="checkbox" name="mana" value="${xy.sdid}"/></td>
<td>${xy.sdid }</td>
<td>${xy.sdname}</td></tr>
</c:forEach>
</tbody></table></td></tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="确定删除" name="button9" onclick="check(f1)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="返   回" name="button10"></td></tr>
</tbody></table></td></tr>
</tbody></table><br>
   
  </form></body>
</html>
