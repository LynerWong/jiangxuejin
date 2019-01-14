<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="/jiangxuejin1/picture/bg4.jpg" onLoad="startclock()">
  
  <table width="863" height="61"><tr valign="bottom"><td width="300" align="center" valign="middle"><strong><font size="7" color="white">大学 </font></strong><br></td><td width="300">&nbsp;<font size="5" color="white">&mdash;奖助学金评定系统</font></td>
    <td><form name="clock" onSubmit="0" >&nbsp; &nbsp; &nbsp; 
        <input    type=button value="Time" size=12 onClick="showtime()">
        <input    type=button value="Date" size=12 onClick="gettheDate()">
        <input type="text" name="face" size=12 value="" >
    </form></td></tr>
</table>
    <script Language="JavaScript">


function goback(){

alert("Good Bye!");

history.go(-1);

}

function getname(str) {

        alert("Hi, "+ str+"!");

}

function gettheDate() {

stopclock();

Todays = new Date();

TheDate = "" + (Todays.getMonth()+ 1) +" / "+ Todays.getDate() + " / " + 

Todays.getYear() 

document.clock.face.value = TheDate;

}

function showit () {

        var now = new Date();

        var hours = now.getHours();

        var minutes = now.getMinutes();

        var seconds = now.getSeconds();

          stopclock();

          TotalTime = (minutes > GetTotal)? (minutes-GetTotal):TotalTime;

        document.clock.face.value = TotalTime + " in minutes ";

}

// Navigation - Stop

// Netscapes Clock - Start

// this code was taken from Netscapes JavaScript documentation at

// www.netscape.com on Jan.25.96



var timerID = null;

var TotalTime = 0;

var GetTotal = 0;

var timerRunning = false;

function stopclock (){

        if(timerRunning)

                clearTimeout(timerID);

        timerRunning = false;

}



function startclock () {

        // Make sure the clock is stopped

        var now = new Date();

        stopclock();

          GetTotal=now.getMinutes();

        gettheDate();

        showtime();

}

function showtime () {

        var now = new Date();

        var hours = now.getHours();

        var minutes = now.getMinutes();

        var seconds = now.getSeconds()

        var timeValue = "" + ((hours >12) ? hours -12 :hours)

        timeValue += ((minutes < 10) ? ":0" : ":") + minutes

        timeValue += ((seconds < 10) ? ":0" : ":") + seconds

        timeValue += (hours >= 12) ? " P.M." : " A.M."

        document.clock.face.value = timeValue;

        timerID = setTimeout("showtime()",1000);

        timerRunning = true;

}

function showtimer () {

        var now = new Date();

        var hours = now.getHours();

        var minutes = now.getMinutes();

        var seconds = now.getSeconds()

        var timeValue = "" + ((hours >12) ? hours -12 :hours)

        timeValue += ((minutes < 10) ? ":0" : ":") + minutes

        timeValue += ((seconds < 10) ? ":0" : ":") + seconds

        timeValue += (hours >= 12) ? " P.M." : " A.M."

          document.clock.Tspent.value = timeValue;

        timerID = setTimeout("showtime()",1000);

        timerRunning = true;

}

// Netscapes Clock - Stop



// end Helpers -->
</script>
  </body>
</html>
