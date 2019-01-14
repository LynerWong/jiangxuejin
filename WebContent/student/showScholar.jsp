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
    
    <title>My JSP 'showScholar.jsp' starting page</title>
    
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
  
  </script>
  <body background="picture/ll.jpg">
    <p align="center"><font size="15">获 奖 名 单</font> </p> 
    
    <br>
    <table border="1" align="center" cellspacing="" cellpadding=""  width="800">
    <tr align="center"><td>学号</td><td>姓名</td><td>学院</td><td>专业</td><td>班级</td><td>学年</td><td>奖项</td></tr>
    <c:forEach var="xy" items="${stu}">
      <c:forEach var="x" items="${xueyuan}">
      <c:forEach var="y" items="${sdept}">
      <c:if test="${xy.sdid==y.sdid}">
      <c:if test="${y.xueyuanid==x.xueyuanid}">
      
     <tr><td>${xy.sid }</td><td>${xy.sname}</td><td>${x.xueyuanname}</td><td>${y.sdname}</td><td>${xy.sno}班</td><td>第${xy.xuenian}学年</td><td>${xy.scholar}</td></tr>
     </c:if>
     </c:if>
      </c:forEach>
      </c:forEach>
    </c:forEach>
    </table>
      </body>
</html>
