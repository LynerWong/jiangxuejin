<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryschoolarship.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript" language="javascript">
  function back(){
     <c:if test="${id==\"1\"}">
     location.href("student/left.jsp");
     </c:if>
      <c:if test="${id==\"2\"}">
     location.href("teacher/left.jsp");
     </c:if>
      <c:if test="${id==\"3\"}">
     location.href("manager/left.jsp");
     </c:if>
      <c:if test="${id==\"4\"}">
     location.href("hmanager/left.jsp");
     </c:if>
     
  }
   
  function check(){
    window.open("student/showScholar.jsp","f3","");
  }
  function init(){ 
      <c:if test="${!empty type}">
      check();
      </c:if>
      
    }
  </script>
  <body background="picture/left2.jpg" onLoad="init()">
    <script type="text/javascript">
    
    function checkx(form){
     selected=form.xueyuan.value;
     i=0;
     form.sdept.length="${ssize}";
     <c:forEach var="xy" items="${sdept}">
     if(selected=="${xy.xueyuanid}"){
     i++;
     form.sdept.options[i].value="${xy.sdid}";
     form.sdept.options[i].text="${xy.sdname}";
     }
     </c:forEach>
     form.sdept.length=i+1;
     }
    function checkb(form){
     selected=form.sdept.value;
     i=0;
     form.banji.length=7;
     <c:forEach var="xy" items="${sdept}">
     if(selected=="${xy.sdid}"){
       for(d=0;d<"${xy.classcount}";d++){
        i++;
         form.banji.options[i].value=i;
         form.banji.options[i].text=i+" 班";
         }
     }
     </c:forEach>
     form.banji.length=i+1;
     }
    </script>
    <form name="f1" action="/jiangxuejin1/QueryScholarship" method="post">
    <table cellspacing="10">
    <tr><td align="right"><input type="radio" name="ra" value="1" checked/></td><td align="left">模糊查询</td></tr>
    <tr><td align="right">年级：</td>
    <td align="left">
    <select name="xuenian">
    <option value="" selected>全    部</option>
    <option value="1">一 &nbsp; 年 &nbsp;级</option>
    <option value="2">二  &nbsp;年  &nbsp;级</option>
    <option value="3">三  &nbsp;年  &nbsp;级</option>
    </select></td>
    </tr>
    <tr><td align="right">学院：</td><td align="left"><select name="xueyuan" onChange="checkx(f1)"><option value="" >全  部   </option>
    <c:forEach var="xy" items="${xueyuan}">
    <option value="${xy.xueyuanid}" <c:if test="${xy1==xy.xueyuanid}">selected</c:if>>${xy.xueyuanname}</option>
    </c:forEach>
    </select></td></tr>
    <tr><td align="right">专业：</td><td align="left" width="10"><select name="sdept" onChange="checkb(f1)">
    <option value="" selected>全  部</option>
    <c:forEach var="xy" items="${sdept}">
    <option value="${xy.sdid}" <c:if test="${sd==xy.sdid}">selected</c:if>>${xy.sdname}</option>
    </c:forEach>
    </select><input type="hidden" name="id3" value="${id }"/></td></tr>
    <tr><td align="right">班级：</td><td align="left"><select name="banji"><option value="" selected>全  部</option></select></td></tr>
    <tr><td align="right"><input type="radio" name="ra" value="2"/></td><td align="left">精确查询</td></tr>
    <tr><td align="right">学号：</td><td align="left"><input type="text" name="id" size="10"></td></tr>
    <tr><td align="right"><input type="submit" value="查询" size="20" ></td><td align="left"><input type="button" value="返回" onClick="back()"></td></tr>
    
    </table>
    </form>
  </body>
</html>
