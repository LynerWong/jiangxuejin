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
    
    <title>My JSP 'upload.jsp' starting page</title>
    
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
   function init(form){
      if(${!empty info}) alert("${info}");
      }
    function back(){
      location.href("/jiangxuejin1/manager/right.jsp");
     }
  </script>
  <body background="picture/ll.jpg" onload="init()">
  <script type="text/javascript">
  function getPath(obj) {
  if (obj) {
  if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
  obj.select(); return document.selection.createRange().text;
  }
  else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
  if (obj.files) {
  return obj.files.item(0).getAsDataURL();
  }
  return obj.value;
  }
  return obj.value;
  }
  }  

  //以下即为完整客户端路径
  function check1(form){
    var filepath=getPath(document.getElementById("upfile"));
    form.file2.value=filepath;
  }
  
  
  </script><br><br><br><br>

  
    <form action="/jiangxuejin1/UpLoad" method="post"  name="f1">
            请选择要上传EXECEL表格<input type="file" name="upfile" size="50">
    <input type="hidden" name="file2"/><br/><br/>
        年级：
    
    <select name="xuenian">
    <option value="1">一 &nbsp; 年 &nbsp;级</option>
    <option value="2">二  &nbsp;年  &nbsp;级</option>
    <option value="3">三  &nbsp;年  &nbsp;级</option>
    </select> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
  
    <input type="submit" value="提交" onclick="check1(f1)"> &nbsp; &nbsp;&nbsp; <input type="button" value="返回" name="button2" onclick="back()">
</form>

  </body>
</html>
