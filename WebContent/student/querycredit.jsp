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

    <title>My JSP 'querycredit.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body background="picture/ll.jpg">
     <form action="/jiangxuejin1/QueryScore" name="f">
     <table align="center" cellspacing="20"><tr><td>
     <select name="type">
     <option value="1">第 一 学 年</option>
     <option value="2">第 二 学 年</option>
     <option value="3">第 三 学 年</option>
     </select></td>
     <td>
     <input type="submit" value="查    询"/> </td>
     </tr></table>
     </form>
     <P align="center"><b>智育成绩</b></P>
     <table align="center" border="1">
     <tr><td>科目</td><td>平时成绩</td><td>考试成绩</td><td>学年</td></tr>
     <c:forEach var="xy" items="${al2}">
     <c:forEach var="x" items="${al3}">
     <c:if test="${xy.cid==x.cid&&xy.cidd==x.cidd}">
     <tr><td>${x.cname}</td><td>${xy.pscore}</td><td>${xy.score}</td><td>${xy.xuenian}</td></tr>
     </c:if>
     </c:forEach>
     </c:forEach>
     
     </table>
     <p align="center"><b>非智育成绩</b></p>
     <table align="center" border="1">
     <tr><td>思想道德素质基础分</td><td>思想道德素质加分</td><td>身心素质基础分</td><td>身心素质加分</td><td>科技人文素质基础分</td><td>科技人文素质加分</td></tr>
     <c:forEach var="xy" items="${al}">
     <tr><td>${xy.sixiangbase}</td><td>${xy.sixiangjiafen}</td><td>${xy.shenxinbase}</td><td>${xy.shenxinjiafen}</td><td>${xy.kejibase}</td><td>${xy.kejijiafen}</td></tr>
     </c:forEach>
     </table>
     <p align="center"><b>综合测评成绩</b></p>
     <table align="center" border="1">
     <tr><td>智育成绩</td><td>非智育成绩</td><td>综合成绩</td><td>专业名次</td></tr>
     <c:forEach var="xy" items="${al}">
     <tr><td>${xy.zyscore}</td><td>${xy.nozyscore}</td><td>${xy.caluscore}</td><td>${xy.sdeptsore}</td></tr>
     </c:forEach>
     </table>
  </body>
</html>
