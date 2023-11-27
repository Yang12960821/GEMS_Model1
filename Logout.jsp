<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    

  
  <body>
<%
 response.setHeader("refresh","1;url=Login.html");//定时跳转
 session.invalidate();//注销
%>
<h3>You have logouted,wait for one seconds</h3>
<h3>if  you have been redirected ,please click <a href="Login.html">here</a>
  </body>
</html>
