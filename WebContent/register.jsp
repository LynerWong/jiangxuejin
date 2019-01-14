<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="javascript">
function check(form){
name=form.username.value;
pass=form.password.value;
if(name.length<5){
alert("用户名长度小于5");return false;
}
if(pass.length<5){
alert("密码长度小于5");return false;
}
return true;
}
</script>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body bgcolor="#006666">
  
  <marquee direction="right" behavior="scroll" scrolldelay="100" scrollmount="30">欢迎进入奖助学金管理系统</marquee>
  
   <form action="/jiangxuejin1/LoginServlet" method="POST" name="form" onsubmit="return check(form)">
   <table width="800" height="550" border="0" align="center"  cellpadding="9">
   <tr>
     <td width="800" height="150" colspan="2" align="center"><font size="30" color="#FFFFFF"><B>奖助学金管理系统</B></font></td>
    
  </tr>
   <tr>
     <td width="400" height="30" align="right"><font color="#FFFFFF"><B>账      号：</B></font></td>
     <td width="400"><input type="text" height="25" name="username" size="20"/></td>
  </tr>
 <tr>
     <td height="30" align="right"><font color="#FFFFFF"><B>密     码：</B></font></td>
     <td><input type="password" height="25" name="password" size="22" /></td>
  </tr>
   <tr>
     <td height="22" align="right"><font color="#FFFFFF"><B>对    象：</B></font></td>
     <td>
     <select name="loginType" >
     <option value="1"> 学  生      </option>
     <option value="2"> 教  师     </option>
     <option value="3">辅  导  员</option>
     <option value="4">教  务  处</option>
     </select>
     </td>
   </tr>
   <tr>
     <td height="10" ></td>
     <td></td>
   </tr>
   <tr>
   <td  height="28" align="right"><input type="submit" value="登  录" ></td>
   
   <td align="left"><input type="reset" value="重  置"></td>
   
   </tr>
   <tr>
     <td height="230">&nbsp;</td>
     <td>&nbsp;</td>
   </tr>
</table>
</form>
  </body>
</html>
