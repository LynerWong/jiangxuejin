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
    
    <title>My JSP 'updatecredit.jsp' starting page</title>
    
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
  function back(){
   window.open("forward/teacher.jsp","_parent","");
  }
  
  function forward(){
     if(${!empty type}) window.open("forward/teacher.jsp","_parent","");
  }
  function check(form){if(${!empty infom}) alert("${infom}");
    selected=form.course.value;
    form.classs.length=7;
    i=0;
    <c:forEach var="xy" items="${al2}">
    if(selected=="${xy.cid}"){ 
    if(${xy.cidd==classy}){form.classs.options[i].selected;}
    form.classs.options[i].value=${xy.cidd};
    form.classs.options[i].text=${xy.cidd}+"班";
    
    i++;
    }
    </c:forEach>
    form.classs.length=i;
  }
  
  </script>
  <body onload="check(f1)" background="picture/ll.jpg">
    <p><b>修改学生成绩</b></p>
    <form name="f1" action="/jiangxuejin1/UpdateCredit?page=1" method="post">
    <table><tr><td>
    <table width="177" height="341" framespacing="20">
    <tr><td>课程</td><td>
    <select name="course" onchange="check(f1)">
    <c:forEach var="xy" items="${al}">
      <c:forEach var="x" items="${al3}">
        <c:if test="${xy.cid==x.cid&&xy.cidd==x.cidd}">
        <option value="${ xy.cid}" <c:if test="${ xy.cid==course}">selected</c:if>>${x.cname}</option>
        </c:if>
     </c:forEach>
    </c:forEach>
    </select>
    </td></tr>
    <tr><td>教学班</td><td>
    <select name="classs">
      
    </select>
    </td></tr>
    <tr><td><input type="submit" value="录入"/></td><td>
    <input type="button" value="返回" onclick="back()"/>
    </td></tr>
    </table>
    </td>
    <td>
    <table width="" height="" border="1" cellspacing="10" cellpadding="3">
    <tr align="center" ><td><a href="/jiangxuejin1/UpdateCredit?classs=${classy}&&course=${course}&&page=1">首页</a></td>
    <td><a href="/jiangxuejin1/UpdateCredit?classs=${classy}&&course=${course}&&page=${page-1>0? page-1:1}">上   一  页</a></td>
    <td><a href="/jiangxuejin1/UpdateCredit?classs=${classy}&&course=${course}&&page=${page+1<pageCount? page+1:pageCount}">下一页</a></td>
    <td><a href="/jiangxuejin1/UpdateCredit?classs=${classy}&&course=${course}&&page=${pageCount}">尾页</a></td></tr>
    <tr align="center"><td>学号</td><td>姓名</td><td>平时成绩</td><td>期末成绩</td></tr>
    <c:forEach var="xy" items="${info}">
    <tr><td>${xy.sid}</td><td>${xy.sname}</td><td><input type="text" size="15" name="${xy.sid}" value="${xy.pscore}"/></td><td><input type="text" size="15" name="${xy.sid}" value="${xy.score}"/>
     <input type="hidden" name="sid" value="${xy.sid}"/></td><td><input type="submit" value="确认修改"/></td></tr>
    </c:forEach>
    <tr align="center"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
    <tr align="center"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
    <tr><td><input type="hidden" name="setup" value="${ss}"/></td>
    
    <td align="right">共计${pageCount}页</td><td>这是${page }页</td></tr>
    
    </table>
    </td>
    </tr>
    
    </table>
    </form>
  </body>
</html>
