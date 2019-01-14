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
  
  <body background="picture/ll.jpg" onload="init(f1)">
    <script type="text/javascript">
    function modify1(form){
      form.modify.value="sdi";
    }
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
     form.sdept.options[i].value="${xy.sdid}";
     form.sdept.options[i].text="${xy.sdname}";
     }
     </c:forEach>
     form.sdept.length=i+1;
     }
     function back(){
      location.href("manager/right.jsp");
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
    <form name="f1" action="/jiangxuejin1/ModiffyM" method="post">
    <input type="hidden" name="modify"/>
    <table align="left"><tr><td>
    <table cellspacing="10" width="226" height="322">
    
    <tr><td align="right">年级：</td>
    <td align="left">
    <select name="xuenian">
    <option value="1">一 &nbsp; 年 &nbsp;级</option>
    <option value="2">二  &nbsp;年  &nbsp;级</option>
    <option value="3">三  &nbsp;年  &nbsp;级</option>
    </select></td>
    </tr>
    <tr><td align="right"><input type="radio" name="ra" value="1" checked/></td><td align="left">模糊查询</td></tr>
    <tr><td align="right">专业：</td><td align="left" width="10"><select name="sdept" onChange="checkb(f1)">
    
    <c:forEach var="xy" items="${sdept}">
    <option value="${xy.sdid}" <c:if test="${sd==xy.sdid}">selected</c:if>>${xy.sdname}</option>
    </c:forEach>
    </select><input type="hidden" name="id3" value="${id }"/></td></tr>
    <tr><td align="right">班级：</td><td align="left"><select name="banji"></select></td></tr>
    <tr><td align="right"><input type="radio" name="ra" value="2"/></td><td align="left">精确查询</td></tr>
    <tr><td align="right">学号：</td><td align="left"><input type="text" name="id" size="10"></td></tr>
    <tr><td align="right"><input type="submit" value="查询" size="20" ></td><td align="left"><input type="button" value="返回" onClick="back()"></td></tr>
    
    </table>
    </td>
    <td>
    <table border="0" width="741" height="160">
    <tr align="center">
    <td>姓名</td><td>学号</td><td>思想道德素质基础分</td><td>加分</td><td>身心素质基础分</td><td>加分</td><td>科技人文素质基础分</td><td>加分</td>
    </tr>
    <c:forEach var="xy" items="${stu}">
    <tr align="center">
    <td>${xy.sname }</td><td>${xy.sid }<input type="hidden" value="${xy.sid }" name="if"/></td><td><input type="text" value="${xy.sixiangbase }" name="${xy.sid }" size="4"/>
    </td><td><input type="text" value="${xy.sixiangjiafen} " name="${xy.sid }" size="4"/></td>
    <td><input type="text" value="${xy.shenxinbase }" name="${xy.sid }" size="4"/></td><td><input type="text" value="${xy.shenxinjiafen }" name="${xy.sid }" size="4"/></td>
    <td><input type="text" value="${xy.kejibase}" name="${xy.sid }" size="4"/></td>
    <td><input type="text" value="${xy.kejijiafen}" name="${xy.sid }" size="4"/></td>
    </tr>
    </c:forEach>
    <tr><td>&nbsp;</td><td><input type="submit" value="确定修改" onclick="modify1(f1)"/></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
    </table>
    </td></tr>
    </table>
    </form>
  </body>
</html>
