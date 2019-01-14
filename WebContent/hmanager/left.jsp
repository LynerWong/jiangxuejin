<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--Modify by visc.cn for cbiw.com.cn 2007-03-19-->

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left </title>
<style type="text/css">
body,td,th {font-size: 14px;}
.leftmenu1 {font-weight: bold; cursor: hand; padding-top: 4px; height: 29px; text-align: left;}
.leftmenu2 {PADDING-LEFT:15px; height: 21px;text-align: left;}
div{ margin-top:90px; width:100%; text-align:left; }
</style>

</head>
<body background="/jiangxuejin1/picture/left2.jpg">
<div>
<script language="JavaScript" type="text/javascript">
if(${!empty info}){
  alert("${info}");
}
function Show(id,i_id){
        var on_img="/jiangxuejin1/picture/folder2.gif";//打开时图片
        var off_img="/jiangxuejin1/picture/floder.gif";//隐藏时图片
        var obj=document.getElementById('c_'+id);
        if(obj.style.display=="none"){
                obj.style.display="";
        i_id.src=on_img;
        //将子菜单Id放入Cookies
        var curShow = readCookie('curShow');
        if(curShow!='')
        {
          var arr_curShow = curShow.split(',');
          var found = false;
          for(i=0;i<arr_curShow.length-1;i++)
          {
            if(arr_curShow[i].toString()==id) {found=true;}
          }
          if(!found){writeCookie('curShow',curShow+','+id,12)}
        }
        else {
          writeCookie('curShow',id,12)
        }
        //将子菜单Id放入Cookies End
        }else{
                obj.style.display="none";
        i_id.src=off_img;
        //将子菜单Id从Cookies中移除
        var curShow = readCookie('curShow');
        if(curShow!='')
        {
          var arr_curShow = curShow.split(',');
          for(i=0;i<arr_curShow.length;i++)
          {
            if(arr_curShow[i].toString()==id) {arr_curShow=arr_curShow.del(i--);}
          }
          curShow = arr_curShow.join(',');
          //alert(curShow);
          writeCookie('curShow',curShow,12)
        }
        //将子菜单Id从Cookies中移除 End
        }

}
function back(){
  window.open("register.jsp","_parent","");
}

function readCookie(name)

{

  var cookieValue = "";

  var search = name + "=";

  if(document.cookie.length > 0)

  { 

    offset = document.cookie.indexOf(search);

    if (offset != -1)

    { 

      offset += search.length;

      end = document.cookie.indexOf(";", offset);

      if (end == -1) end = document.cookie.length;

      cookieValue = unescape(document.cookie.substring(offset, end))

    }

  }

  return cookieValue;

}

function writeCookie(name, value, hours)

{

  var expire = "";

  if(hours != null)

  {

    expire = new Date((new Date()).getTime() + hours * 3600000);

    expire = "; expires=" + expire.toGMTString();

  }

  document.cookie = name + "=" + escape(value) + expire;

}
Array.prototype.del=function(n) {  //n表示第几项，从0开始算起。
//prototype为对象原型，注意这里为对象增加自定义方法的方法。
  if(n<0)  //如果n<0，则不进行任何操作。
    return this;
  else
    return this.slice(0,n).concat(this.slice(n+1,this.length));
}

window.onload = function a()
{
  var curShow = readCookie('curShow');
  var totalShow = 5;  //自己修改一共有多少个二级分类
  if(curShow!=''&&curShow!=null)
  {
    for(i=1;i<=totalShow;i++)
    {
      document.getElementById('c_'+i).display="none";
    }
    var arr_curShow;
    arr_curShow = curShow.split(',');
    for(i=0;i<=arr_curShow.length-1;i++)
    {
      if(arr_curShow[i]!=''){document.getElementById('c_'+arr_curShow[i]).style.display="";}
    }

  }
}
</script>
<table width="215" border="0" align="center" cellpadding="0" cellspacing="0" height="271">
<tbody>
  <tr>
    <td class="leftmenu1"> <a style="cursor: pointer" onclick=""><img 

src="/jiangxuejin1/picture/floder.gif" width="16" height="16"  

id="img1"/><span class="ft_white"> 复核申请书</span></a></td></tr>
</tbody>
<tbody>
  <tr>
    <td class="leftmenu1"> <a style="cursor: pointer" onclick=""><img 

src="/jiangxuejin1/picture/floder.gif" width="16" height="16"  

id="img1"/><span class="ft_white"> 公示名单</span></a></td></tr>
</tbody>
<tbody>
  <tr>
    <td class="leftmenu1"> <a style="cursor: pointer" onclick=""><img 

src="/jiangxuejin1/picture/floder.gif" width="16" height="16"  

id="img1"/><span class="ft_white"> 审核申请书</span></a></td></tr>
</tbody>
<tbody id="c_1" style="display: none">
<tr>
  <td class="leftmenu2"><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Add?id=3" target="f3">学生</a></td></tr>
<tr>
  <td class="leftmenu2"><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Add?id=4" target="f3">教师</a></td></tr>
<tr>
  <td class="leftmenu2"><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Add?id=1" target="f3">管理员</a></td></tr>
<tr>
  <td class="leftmenu2"><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Add?id=2" target="f3">专业</a></td></tr>
<tr>
  <td class="leftmenu2"><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Add?id=5" target="f3">学院</a></td></tr>
</tbody>

<tbody>
  <tr>
    <td class="leftmenu1"> <a style="cursor: pointer" onclick="Show(2,img2)"><img 

src="/jiangxuejin1/picture/floder.gif" width="16" height="16" align="absmiddle" 

id="img2"/><span class="ft_white"> 删   除</span></a></td></tr>
</tbody>
<tbody id="c_2" style="display: none">
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Delete?id=3" target="f3">学生</a></td></tr>
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Delete?id=4" target="f3">教师</a></td></tr>
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Delete?id=1" target="f3">管理员</a></td></tr>
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Delete?id=2" target="f3">专业</a></td></tr>
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/Delete?id=5" target="f3">学院</a></td></tr>
</tbody>

<tbody>
  <tr>
    <td class="leftmenu1"> <a style="cursor: pointer" onclick="Show(3,img3)"><img 

src="/jiangxuejin1/picture/floder.gif" width="16" height="16" align="absmiddle" 

id="img3"/><span class="ft_white"> 奖学金设置</span></a></td></tr>
</tbody>
<tbody id="c_3" style="display: none">
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/hmanager/setupscholar.jsp" target="f3">专业名额分配</a></td></tr>
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/QueryScholarship?id3=4">查看获奖人员</a></td></tr>
</tbody>

<tbody>
  <tr>
    <td class="leftmenu1"> <a style="cursor: pointer" onclick="Show(4,img4)"><img 

src="/jiangxuejin1/picture/floder.gif" width="16" height="16"  

id="img4"/><span class="ft_white"> 修改密码</span></a></td></tr>
</tbody>
<tbody id="c_4" style="display: none">
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/hmanager/modifypass.jsp" target="f3">修改密码</a></td></tr>
</tbody>

<tbody>
  <tr>
    <td class="leftmenu1"> <a style="cursor: pointer" onclick="Show(5,img5)" ><img 

src="/jiangxuejin1/picture/floder.gif" width="16" height="16" align="absmiddle" 

id="img5"/><span class="ft_white"> 退出系统</span></a></td></tr>
</tbody>
<tbody id="c_5" style="display: none">
<tr>
  <td class="leftmenu2" ><img src="/jiangxuejin1/picture/file.bmp" width="9" 

height="9" /> <a href="/jiangxuejin1/register.jsp" target="_parent">退出</a></td></tr>

</tbody>
</table>
</div>
</body>
</html>
