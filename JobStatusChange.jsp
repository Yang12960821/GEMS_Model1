<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%> 
<%@ page import=" java.io.File"%> 
<%@page import=" ConXml.* "%>
<%@page import ="java.sql.*"%>
<%@ page import="java.text.*"%> 
<%
	String tid = request.getParameter("tid");
System.out.println("get tid = " + tid);
	Connection sql_conn = null;
	Statement stmt = null;
	try{
		String SQLUrl = "jdbc:mysql://10.181.6.69/model";
		//String SQLUrl = "jdbc:mysql://localhost:3306/model";
		String myDriver = "com.mysql.jdbc.Driver";
	    Class.forName(myDriver).newInstance();
	    sql_conn = DriverManager.getConnection(SQLUrl, "root", "a820517");
	   // sql_conn = DriverManager.getConnection(SQLUrl, "root", "123456");
	    stmt= sql_conn.createStatement();
	}catch (Exception e){
		e.printStackTrace();
	}
	
	String select_sql = "select Status from tasks where TaskID = '" + tid+"'";
	System.out.println("select_sql = " + select_sql);
	ResultSet rs =null;
	String status = "";
	try{
		rs =stmt.executeQuery(select_sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(rs==null){
		out.print("=null=");
		return;
	}
	if(rs.next()){
		status = rs.getString(1);
	}
	
	String update_sql = "";
	String resData = "";
	if(status.equals("0")){
		update_sql = "update tasks set Status='3' where TaskID = '" + tid+"'";
		resData = "=3=";
	}else if(status.equals("3")){
		update_sql = "update tasks set Status='0' where TaskID = '" + tid+"'";
		resData = "=0=";
	}
	System.out.println("update_sql = " + update_sql);
	int res = stmt.executeUpdate (update_sql);
	if(sql_conn!=null && !sql_conn.isClosed()){
		sql_conn.close();
	}
	
	if(res>0){
		out.print(resData);
	}else{
		out.print("=n=");
	}
	
	
%>
     
