<%@page import="org.dom4j.Element"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import=" java.net.URL "%>
<%@page import=" org.dom4j.Document "%>
<%@page import=" org.dom4j.DocumentHelper "%>
<%@page import=" org.dom4j.Document "%>
<%@page import=" org.dom4j.io.OutputFormat "%>
<%@page import=" org.dom4j.io.XMLWriter "%>
<%@page import=" ConXml.*"%>

<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.text.*"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
  </head>
  
  <body>
    <%
    //获取用户名
   
     String sUserName = session.getAttribute("username").toString();
     if(sUserName.equals("")){
           response.sendRedirect ( "Logout.jsp" );     
     }

 //      String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 
     String datetime1=new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime()); 
     String  ControlFileName = sUserName+datetime1+".xml";
        String myTaskName = sUserName+datetime1;
     String realPath = request.getRealPath("/")+"XmlData/"+ControlFileName;
    // System.out.println("realXmlPath is:"+realPath);
     String MyXmlFolder = request.getRealPath("/")+"XmlData";
       String url = basePath +"XmlData/"+ControlFileName;
     session.setAttribute("TaskXmlPath",realPath);
  //   session.setAttribute("TaskStartTime",datetime);
     session.setAttribute("myTaskName",myTaskName);
     session.setAttribute("ControlFileName",ControlFileName); 
     session.setAttribute("xmlUrl",url);
     response.sendRedirect ( "Config.jsp" );
     WriteXml   wx = new WriteXml();
     String description = request.getParameter("textarea");
     wx.WriteDescription(realPath, description);
     String fileName = "ToRunTasks_"+sUserName+".xml";
     
    %>
  </body>
</html>
