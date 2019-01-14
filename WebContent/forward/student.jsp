<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="javascript">


  setTimeout("ss()",1800000);
  
  function ss(){
     alert("已经到30分钟，请重新登陆");
     location.href="register.jsp"
  }
  
  </script>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>奖助学金管理系统学生端</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    
  </head>
  <frameset rows=18%,* frameborder="no">
    <frame name=f1 src="student/top.jsp"/>
    <frameset cols=20%,*>
    <frame name=f2 src="student/left.jsp"/>
    <frame name=f3 src="student/right.jsp"/>
    </frameset>
    </frameset>
  <body >
 
  </body>
</html>
