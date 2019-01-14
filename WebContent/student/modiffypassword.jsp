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
    
    <title>My JSP 'modiffypassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 <script  language="javascript">
  function check(form){
   if(form.source.value!="${password}"){alert("原密码输入错误！${password}");return false;}
   if(isvalidate(form.source.value)&&isvalidate(form.first.value)&&isvalidate(form.second.value)){
   if(form.first.value==form.second.value) return true;
   else{alert("密码输入不一致！！");return false;}
   }
   else{alert("密码长度小于5！！");return false;}
   
   
}
 function back(){  
     location.href("/jiangxuejin1/student/right.jsp");
  }
  function isvalidate(str){
    if(str.length<5) return false;
    return true;
  }
   </script>
  <body background="picture/ll.jpg" topmargin="30" leftmargin="20">
  <form action="/jiangxuejin1/ModiffyServlet?type=1" method="post" name="f1" onsubmit="return check(f1)">
    <script>
    <c:if test="${!empty info}">
     alert("${info}");
    </c:if>
    </script>
    <table>
    <tr>
    <td>请输入原密码：</td><td><input type="password" name="source" size="20"/></td>
    </tr>
    <tr>
    <td>请输入改后密码：</td><td align="center"><input type="password" name="first" size="20"/></td>
    </tr>
    <tr>
    <td>请再次输入改后密码：</td><td><input type="password" name="second" size="20"/></td>
    </tr>
    
    <tr><td>&nbsp;</td></tr>
    <tr>
    <td align="right"><input type="submit" value="确  定"  onclick="aa(f1)"/>&nbsp; <br></td><td align="right"><input type="reset" value="重  置" size="20"/> &nbsp; <input type="button" value="返回" name="button1" onclick="back()"></td>
    </tr>
    </table>
    </form>
  </body>
</html>
