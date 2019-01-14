<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'setupscholar.jsp' starting page</title>
    
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
  function back(){
    location.href("/jiangxuejin1/hmanager/right.jsp");
  }
  function isNumber( s ){   
    var regu = "^[0-9]$";  
    if (s.match(regu)) { 
    return true; 
    } else { 
    return false; 
   } 
}
  
  function check(form){
  if(form.yideng.value==""||form.erdeng.value==""||formsandeng.value==""){alert("不能输入空！！"); return false;}
  if(!isNumber(form.yideng.value)||!isNumber(form.erdeng.value)||!isNumber(form.sandeng.value)){alert("请输入数字！！"); return false;}
  return true;
  }
  </script>
  <body onload="init()" background="picture/ll.jpg"> 
    <form action="/jiangxuejin1/ScholatSetup" name="f1" method="post" onsubmit="return check(f1)">
    <strong><font size="5">设置奖学金专业分配名额</font></strong><br><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     优秀一等学生奖助学金比例：<input type="text" maxlength="5" name="yideng" size="3">%<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     优秀二等学生奖助学金比例：<input type="text" maxlength="5" size="3" name="erdeng">%<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     优秀三等学生奖助学金比例：<input type="text" maxlength="5" size="3" name="sandeng">%<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="submit" value="确定" name="button20"> &nbsp; 
      <input type="reset" value="重置" name="button21"> &nbsp;&nbsp; 
      <input type="button" value="返回" name="button22" onclick="back()"> &nbsp; &nbsp;
      </form>
  </body>
</html>
