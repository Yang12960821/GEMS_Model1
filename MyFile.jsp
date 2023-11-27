<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%> 
<%@ page import=" java.io.File"%> 
<%@page import=" ConXml.* "%>
<%@page import ="java.sql.*"%>
<%@ page import="java.text.*"%> 
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", -10);
%>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
		<script type="text/javascript" src="js/jquery.js" ></script>
			<script type="text/javascript" src="js/jquery.dataTables.js" ></script>
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
		<script type="text/javascript" src="js/cufon-yui.js"></script>
		<script type="text/javascript" src="js/cufon-replace.js"></script>  
		<script type="text/javascript" src="js/Vegur_300.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_700.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_400.font.js"></script>
		<script type="text/javascript" src="js/atooltip.jquery.js"></script>
        <script type="text/javascript" src="js/fenye.js"></script>
         <script type="text/javascript" src="js/Tab.js"></script>
         <script type="text/javascript"> Cufon.now(); </script>
       <script type="text/javascript">

 
$(document).ready( function () {

$('#mytask').DataTable( {
     "bAutoWidth": false,
     "order": [[ 2, "desc" ]],
    "aoColumns": [                          //设定各列宽度   
                            {"sWidth": "15%"},   
                            {"sWidth": "10%"},   
                            {"sWidth": "15%"},   
                            {"sWidth": "15%"},   
                            {"sWidth": "15%"},   
                            {"sWidth": "15%"},  
                            {"sWidth": "15%"}

                           
]
} );
           
    
} );

  </script>           
 
  
	</head>
	<body id="page5">
		<div class="main">
<!--header -->
			<header>
				<div class="wrapper">
					<h1><a href="Home.jsp" id="logo">西安交通大学人居工程环境与建筑工程学院</a></h1>
                                   <br>
					<br>
					<%
 if(session.getAttribute("username")!=null){
%>
<div align="center"  ><h4>Welcome: <%=session.getAttribute("username")%>,  &nbsp&nbsp&nbsp<a href="Logout.jsp"> Logout</a></h4> </div>
<%
 }else{
%>
<h3>请先进行系统的<a href="Login.html">登录</a></h3>
<%
 }
%>
				</div>
					<nav>
					<ul id="menu">
						<li ><a href="Home.jsp"><span>Home</span></a></li>
						
						<li><a href="Descrip.jsp"><span>Model Setting Wizard</span></a></li>
						<li><a href="JobStatus.jsp"><span>Job Status Report</span></a></li>
						<li class="active"><a href="MyFile.jsp"><span>My Profile</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->
<!--content -->
<% 
           String TableContent ="";
           String logUser =session.getAttribute("username").toString();
   
           if(logUser!=null)
           {
           
               try{
                   //  QueueManage qm = new QueueManage();
                   SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
//                   String SQLUrl = "jdbc:mysql://localhost:3306/model";
                   String SQLUrl = "jdbc:mysql://10.181.6.69/model";
		           String myDriver = "com.mysql.jdbc.Driver";
		             String SqlUser = logUser;
		          // String SqlPwd = qm.getPassword(logUser);
		           Class.forName(myDriver).newInstance();//指定连接类型  
//	                java.sql.Connection  sqlConn = DriverManager.getConnection(SQLUrl, "root", "123456");//获取连接
	                java.sql.Connection  sqlConn = DriverManager.getConnection(SQLUrl, "root", "a820517");//获取连接
	               Statement   stmt = sqlConn.createStatement();
	                String  querySql = "select * from tasks  where User='"+logUser+"'";
	                ResultSet  rs =  stmt.executeQuery(querySql);
	                   String  myStatus ="";
	                while (rs.next()){
	                        
	                         String  status = rs.getString(1);
	                          String  taskID =  rs.getString(2);
	                            String  submitTime  = rs.getString(4);
                               String  xmlPath  = rs.getString(8);
	                             long    startTimelong = rs.getLong(5);
	                              String   startTime  =sdf.format(startTimelong);
	                                  long  longEndTime  = rs.getLong(6);
	                                  long  longTimeUsed  = rs.getLong(7);
	                                  String endTime = sdf.format(longEndTime);
	                                  long   temp =longTimeUsed;
	                                        long temp2 = temp % (1000 * 3600);
								            long hours = temp / 1000 / 3600;   
								            long mins = temp2 / 1000 / 60;    
								            long temp3 = temp2% (1000*60);
								           long seconds = temp3/ 1000;   
						           String timeUsed = hours + "Hr-"+ mins + "Min-"+seconds+"Sec";
	                              
	                       if (status.equals("0")){
	                             myStatus="ToRun";
	                             	                         }
	                      else if (status.equals("1")){
	                       myStatus="Running";
	                       }
	                       else if (status.equals("2")){
	                       myStatus="Completed";
	                       }
	                      String  resultPath  =rs.getString(9);
	                                  
	                    TableContent+= "<tr><td align='center' ><a href ='"+xmlPath+"'>"+ taskID+"</a></td><td align='center'>"+myStatus+"</td><td align='center'>"+submitTime+"</td.><td align='center'>"+startTime+ "</td><td align='center'>"+endTime+"</td><td align='center'>"+ timeUsed+"</td><td  align='center'><a  href='"+resultPath+"'>Download</a></td></tr>";
	                
	                    
              }
               if(!sqlConn.isClosed()){
	            sqlConn.close();
	            
	            }
               
               }
              catch (Exception e){
            e.printStackTrace();
              }
	                                  
	        }                  


 %>

			<article style="height:1000px">
          <br>
          <br>
	<table width="100%" border="1" class="JobTable" id="mytask">
	
   <thead>
  <tr>
    <th>Job ID</th>
    <th>Status</th>
    <th>Submit Time</th>
     <th>Start Time</th>
      <th>End  Time</th>
          <th>Time Used</th>
  <th>Check Result</th>
  </tr>
  </thead>
  <tbody>
 <%=TableContent %>
  
  </tbody>
</table>
			</article>	

<!--content end-->
<!--footer -->
			<footer class="color2">
				<div align="center">西安交通大学人居环境与建筑工程学院<br>地址：西安交通大学曲江校区西一楼</div>
			</footer>
<!--footer end-->

		<script type="text/javascript"> Cufon.now(); </script>
	</body>
</html>