<%@page import="org.dom4j.Element"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import=" java.net.URL "%>
<%@page import=" org.dom4j.Document "%>
<%@page import=" org.dom4j.DocumentHelper "%>
<%@page import=" org.dom4j.Document "%>
<%@page import=" org.dom4j.io.OutputFormat "%>
<%@page import=" org.dom4j.io.XMLWriter "%>
<%@page import=" ConXml.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.text.*"%>


<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    
  
     String taskXmlPath =  session.getAttribute("TaskXmlPath").toString();
     

     WriteXml   wx = new WriteXml();
     LinkedHashMap<String,String> map = new LinkedHashMap<String,String>();
    map.clear();
     
          String TimeInterval = request.getParameter("TimeInterval");
	       map.put("TimeInterval", TimeInterval);

		String Ncproda = request.getParameter("Ncproda");//1
		if( Ncproda !=null){
			map.put("Ncproda", Ncproda);
		}
		else{
			map.put("Ncproda", "0");
		}

		String Cgrain = request.getParameter("Cgrain");//2
		if( Cgrain !=null){
			map.put("Cgrain", Cgrain);
		}
		else{
			map.put("Cgrain", "0");
		}

		String Frstc = request.getParameter("Frstc");//3
		if( Frstc !=null){
			map.put("Frstc", Frstc);
		}
		else{
			map.put("Frstc", "0");
		}

		String Fsysc = request.getParameter("Fsysc");//4
		if( Fsysc !=null){
			map.put("Fsysc", Fsysc);
		}
		else{
			map.put("Fsysc", "0");
		}

		String somsc = request.getParameter("somsc");//5
		if( somsc !=null){
			map.put("somsc", somsc);
		}
		else{
			map.put("somsc", "0");
		}

		String somtc = request.getParameter("somtc");//6
		if( somtc !=null){
			map.put("somtc", somtc);
		}
		else{
			map.put("somtc", "0");
		}

		String Petann = request.getParameter("Petann");//7
		if( Petann !=null){
			map.put("Petann", Petann);
		}
		else{
			map.put("Petann", "0");
		}

		String ETann = request.getParameter("ETann");//8
		if( ETann !=null){
			map.put("ETann", ETann);
		}
		else{
			map.put("ETann", "0");
		}

		String asmos1 = request.getParameter("asmos1");//9
		if( asmos1 !=null){
			map.put("asmos1", asmos1);
		}
		else{
			map.put("asmos1", "0");
		}


		String stream1 = request.getParameter("stream1");//10
		if( stream1 !=null){
			map.put("stream1", stream1);
		}
		else{
			map.put("stream1", "0");
		}

		String profSOC = request.getParameter("profSOC");//11
		if( profSOC !=null){
			map.put("profSOC", profSOC);
		}
		else{
			map.put("profSOC", "0");
		}

		String Stem_P = request.getParameter("Stem_P");//12
		if( Stem_P !=null){
			map.put("Stem_P", Stem_P);
		}
		else{
			map.put("Stem_P", "0");
		}

		String nee = request.getParameter("nee");//13
		if( nee !=null){
			map.put("nee", nee);
		}
		else{
			map.put("nee", "0");
		}

		String totc = request.getParameter("totc");//14
		if( totc !=null){
			map.put("totc", totc);
		}
		else{
			map.put("totc", "0");
		}

		String CH4 = request.getParameter("CH4");//15
		if( CH4 !=null){
			map.put("CH4", CH4);
		}
		else{
			map.put("CH4", "0");
		}

		String CROOTC = request.getParameter("CROOTC");//16
		if( CROOTC !=null){
			map.put("CROOTC", CROOTC);
		}
		else{
			map.put("CROOTC", "0");
		}

		String FIPS = request.getParameter("FIPS");//17
		if( FIPS !=null){
			map.put("FIPS", FIPS);
		}
		else{
			map.put("FIPS", "0");
		}

		String Hwpraw = request.getParameter("Hwpraw");//18
		if( Hwpraw !=null){
			map.put("Hwpraw", Hwpraw);
		}
		else{
			map.put("Hwpraw", "0");
		}

		String LC_INPUT = request.getParameter("LC_INPUT");//19
		if( LC_INPUT !=null){
			map.put("LC_INPUT", LC_INPUT);
		}
		else{
			map.put("LC_INPUT", "0");
		}

		String METABC1 = request.getParameter("METABC1");//20
		if( METABC1 !=null){
			map.put("METABC1", METABC1);
		}
		else{
			map.put("METABC1", "0");
		}

		String RLWODC = request.getParameter("RLWODC");//21
		if( RLWODC !=null){
			map.put("RLWODC", RLWODC);
		}
		else{
			map.put("RLWODC", "0");
		}

		String STDEDC = request.getParameter("STDEDC");//22
		if( STDEDC !=null){
			map.put("STDEDC", STDEDC);
		}
		else{
			map.put("STDEDC", "0");
		}

		String STRUCC1 = request.getParameter("STRUCC1");//23
		if( STRUCC1 !=null){
			map.put("STRUCC1", STRUCC1);
		}
		else{
			map.put("STRUCC1", "0");
		}

		String tcrem = request.getParameter("tcrem");//24
		if( tcrem !=null){
			map.put("tcrem", tcrem);
		}
		else{
			map.put("tcrem", "0");
		}

		String WOOD2C = request.getParameter("WOOD2C");//25
		if( WOOD2C !=null){
			map.put("WOOD2C", WOOD2C);
		}
		else{
			map.put("WOOD2C", "0");
		}

		String Prcann = request.getParameter("Prcann");//26
		if( Prcann !=null){
			map.put("Prcann", Prcann);
		}
		else{
			map.put("Prcann", "0");
		}
		String lchout = request.getParameter("lchout");//27
		if( lchout !=null){
			map.put("lchout", lchout);
		}
		else{
			map.put("lchout", "0");
		}
		String evap = request.getParameter("evap");//28
		if( evap !=null){
			map.put("evap", evap);
		}
		else{
			map.put("evap", "0");
		}
		String tran = request.getParameter("tran");//29
		if( tran !=null){
			map.put("tran", tran);
		}
		else{
			map.put("tran", "0");
		}
		String asmos2 = request.getParameter("asmos2");//30
		if( asmos2 !=null){
			map.put("asmos2", asmos2);
		}
		else{
			map.put("asmos2", "0");
		}
		String asmos3 = request.getParameter("asmos3");//31
		if( asmos3 !=null){
			map.put("asmos3", asmos3);
		}
		else{
			map.put("asmos3", "0");
		}
		String asmos4 = request.getParameter("asmos4");//32
		if( asmos4 !=null){
			map.put("asmos4", asmos4);
		}
		else{
			map.put("asmos4", "0");
		}
		String asmos5 = request.getParameter("asmos5");//33
		if( asmos5 !=null){
			map.put("asmos5", asmos5);
		}
		else{
			map.put("asmos5", "0");
		}
		String asmos6 = request.getParameter("asmos6");//34
		if( asmos6 !=null){
			map.put("asmos6", asmos6);
		}
		else{
			map.put("asmos6", "0");
		}
		String asmos7 = request.getParameter("asmos7");//35
		if( asmos7 !=null){
			map.put("asmos7", asmos7);
		}
		else{
			map.put("asmos7", "0");
		}
		String asmos8 = request.getParameter("asmos8");//36
		if( asmos8 !=null){
			map.put("asmos8", asmos8);
		}
		else{
			map.put("asmos8", "0");
		}
		String asmos9 = request.getParameter("asmos9");//37
		if( asmos9 !=null){
			map.put("asmos9", asmos9);
		}
		else{
			map.put("asmos9", "0");
		}
		String asmos10 = request.getParameter("asmos10");//38
		if( asmos10 !=null){
			map.put("asmos10", asmos10);
		}
		else{
			map.put("asmos10", "0");
		}
		String stream2 = request.getParameter("stream2");//39
		if( stream2 !=null){
			map.put("stream2", stream2);
		}
		else{
			map.put("stream2", "0");
		}
		String stream3 = request.getParameter("stream3");//40
		if( stream3 !=null){
			map.put("stream3", stream3);
		}
		else{
			map.put("stream3", "0");
		}
		String stream5 = request.getParameter("stream5");//41
		if( stream5 !=null){
			map.put("stream5", stream5);
		}
		else{
			map.put("stream5", "0");
		}
		String stream6 = request.getParameter("stream6");//42
		if( stream6 !=null){
			map.put("stream6", stream6);
		}
		else{
			map.put("stream6", "0");
		}
		String stream7 = request.getParameter("stream7");//43
		if( stream7 !=null){
			map.put("stream7", stream7);
		}
		else{
			map.put("stream7", "0");
		}
		String profFastC = request.getParameter("profFastC");//44
		if( profFastC !=null){
			map.put("profFastC", profFastC);
		}
		else{
			map.put("profFastC", "0");
		}

		String AddedValues = request.getParameter("AddedValues");
	     if( AddedValues !=null){
	         map.put("AddedValues", AddedValues);     
	     }	    
	        
	  wx.WriteOutputVariables(taskXmlPath, map);
	  //插入记录，并检测启动任务
   
   
	  String createTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 
     
//	     String SQLUrl = "jdbc:mysql://localhost:3306/model";
	     String SQLUrl = "jdbc:mysql://10.181.6.69/model";
		   String myDriver = "com.mysql.jdbc.Driver";
		   
		 //  String SqlUser ="root";  
		 //   String SqlPwd = "a820517";
		//  String SqlPwd = session.getAttribute("pwd").toString();
		//  System.out.println("current user's password is:   "+SqlPwd);
		    QueueManage qm = new QueueManage();
		//   String SqlPwd = qm.getPassword(sUserName);
		   String taskID = session.getAttribute("myTaskName").toString();
	 
		   String xmlPath = session.getAttribute("xmlUrl").toString();
		   Class.forName(myDriver).newInstance();//指定连接类型  
		   
//	            Connection  sqlConn = DriverManager.getConnection(SQLUrl, "root", "123456");//获取连接
	            Connection  sqlConn = DriverManager.getConnection(SQLUrl, "root", "a820517");//获取连接

	            Statement   stmt = sqlConn.createStatement();
	            
	            String   insertSql = "INSERT INTO  tasks  (Status,TaskID,User,CreateTime,XMLPath ) VALUES ('3','"+taskID+"','"+sUserName+"','"+createTime+"','"+ xmlPath+"' )";
		        System.out.print("The create task sql  is :"+insertSql);
		        boolean isInsert  = stmt.execute(insertSql);    
	          /*   if(isInsert){
	               System.out.println(taskID+"   has  inserted  susessfully" );
	            }  
	            else{ 
	             System.out.println(taskID+"  has  inserted  unsusessfully" );
	            
	            }*/
	                      
	              Statement   stmt1 = sqlConn.createStatement();
	              String RunningSql = "select TaskID  from tasks where Status='1'";
	           	  ResultSet RunningRs = stmt1.executeQuery(RunningSql);
	              RunningRs.last();
	     	      int count = RunningRs.getRow();

	              if(count>0){
	                      response.sendRedirect ( "JobStatus.jsp" );
	                
	              }
	              else if (count==0){   
	    /*         QueueManage qm = new QueueManage();
           qm.startAutoWork(basePath); */
	             response.sendRedirect ( "JobStatus.jsp" );
	        
	           }          
	           if(!sqlConn.isClosed()){
	                sqlConn.close();}
	          %>
  </body>
</html>
