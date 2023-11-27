<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>download_xml</title>
</head>
<body>
<% 
  /*
    获取下载文件的名字和路径
  */
	String dir = "XmlData";
    String path = request.getServletContext().getRealPath(dir);
	String fileName = request.getParameter("xmlPath");
	
	path = path + fileName;
	
	File downloadFile = new File(path);
	if(!downloadFile.exists()){
		//文件不存在,转发JobStatus.jsp
		request.setAttribute("message", "下载失败");
		request.getRequestDispatcher("JobStatus.jsp").forward(request,response);
		return;
	}
	
	//下载
	FileInputStream fis = new FileInputStream(downloadFile);
	//byte[] buf = new byte[1024*10];
	//fis.read(buf);
	InputStreamReader isr = new InputStreamReader(fis,"UTF-8");
	BufferedReader br = new BufferedReader(isr);
	response.setCharacterEncoding("UTF-8");
	fileName = fileName.substring(1);
	System.out.println(fileName);
	response.setContentType("text/xml");
	response.addHeader("Content-Disposition","attachment; filename=\""+fileName + "\"");
	out.clear(); 
/*
	     
    out=pageContext.pushBody();
	ServletOutputStream sos = response.getOutputStream();
    sos.write(buf);
    sos.flush();
    sos.close();
    */
    String line = null;
    while((line=br.readLine())!=null){
    	out.println(line);
    }
    
   // out.close();
   // out.print(buf);
    //out.flush();
  //out.close();
    
    //下载完后转发
   // request.getRequestDispatcher("JobStatus.jsp").forward(request,response);
%>
</body>
</html>