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
    
    <title>My JSP 'addstu.jsp' starting page</title>
    
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
  function init(form){
  if(${!empty info}) alert("${info}");
  selected=form.sdept.value;
     i=0;
     form.banji.length=7;
     <c:forEach var="xy" items="${sdept}">
     if(selected=="${xy.sdid}"){
       for(d=0;d<"${xy.classcount}";d++){
         i++;
         form.banji.options[i-1].value=i;
         form.banji.options[i-1].text=i+" 班";
         }
     }
     </c:forEach>
     form.banji.length=i;
  }
  function checkx(form){
     selected=form.xueyuan.value;
     i=0;
     form.sdept.length="${ssize}";
     <c:forEach var="xy" items="${sdept}">
     if(selected=="${xy.xueyuanid}"){
     i++;
     form.sdept.options[i-1].value="${xy.sdid}";
     form.sdept.options[i-1].text="${xy.sdname}";
     }
     </c:forEach>
     form.sdept.length=i;
     checkb(form);
     }
    function checkb(form){
     selected=form.sdept.value;
     i=0;
     form.banji.length=7;
     <c:forEach var="xy" items="${sdept}">
     if(selected=="${xy.sdid}"){
       for(d=0;d<"${xy.classcount}";d++){
         i++;
         form.banji.options[i-1].value=i;
         form.banji.options[i-1].text=i+" 班";
         }
     }
     </c:forEach>
     form.banji.length=i;
     }
  </script>
  <body  onload="init(f1)" background="picture/ll.jpg">
    <form name="f1" action="/jiangxuejin1/Add?id=3" method="post">
    <table align="left" width="505" height="427">
    <tr><td valign="top"><br></td><td valign="top"><br></td><td colspan="5" align="center"><img src="picture/add.bmp" width="40" height="37"/><font size="7"><b>添加学生</b></font></td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td>&nbsp;</td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td>&nbsp;</td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td align="right">请输入学号：</td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td><input type="text" name="sid"/></td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td align="right">请输入姓名：</td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td><input type="text" name="sname"/></td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td align="right">请输入密码：</td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td><input type="text" name="password"/></td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td align="right">请选择学院：</td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td><select name="xueyuan" onChange="checkx(f1)">
    <c:forEach var="xy" items="${xueyuan}">
    <option value="${xy.xueyuanid}">${xy.xueyuanname}</option>
    </c:forEach>
    </select></td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td align="right">请选择专业：</td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td><select name="sdept" onChange="checkb(f1)">
    <c:forEach var="xy" items="${sdept}">
    <option value="${xy.sdid}" >${xy.sdname}</option>
    </c:forEach>
    </select><input type="hidden" name="id3" value="${id }"/></td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td align="right">请选择班级：</td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td><select name="banji"></select></td></tr>
    <tr><td valign="top"><br></td><td valign="top"><br></td><td valign="top" align="left"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td></tr><tr><td valign="top"><br></td><td valign="top"><br>
    </td><td align="right"><input type="submit" value="提    交"/></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td align="left">
    <input type="reset" value="重     置"/></td></tr>
    </table>
    </form>
  </body>
</html>
