
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import=" java.net.URL "%>
<%@page import=" org.dom4j.Document "%>
<%@page import=" org.dom4j.DocumentException "%>
<%@page import=" org.dom4j.io.SAXReader "%>
<%@page import=" ConXml.* "%>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>index</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
       <%
    //获取用户名
    String sUserName = request.getParameter ( "txusername" );
  
   // System.out.println(sUserName);
    //获取密码
    String sPasswd = request.getParameter ( "txpwd" );
 //    System.out.println(sPasswd);
 //String userxml = request.getRealPath("/")+"XmlData\\user.xml";   
// String userxml = request.getRealPath("/")+"/XmlData/user.xml";
 CheckUser  check = new CheckUser();
   Boolean sucsess = check.CheckUser(sUserName, sPasswd);
    if (sucsess){
	     response.sendRedirect ( "Home.jsp" );
	     session.setAttribute("username",sUserName);
	        session.setAttribute("pwd",sPasswd);
             session.setMaxInactiveInterval(300);
    }
    else{
        response.sendRedirect("LogError.jsp");
    }
 
    %>
  </body>
</html>
