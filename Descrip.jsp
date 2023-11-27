<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html >
	<head>
		<title></title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
		<script type="text/javascript" src="js/jquery-1.6.js" ></script>
		<script type="text/javascript" src="js/cufon-yui.js"></script>
		<script type="text/javascript" src="js/cufon-replace.js"></script>  
		<script type="text/javascript" src="js/Vegur_300.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_700.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_400.font.js"></script>
		<script type="text/javascript" src="js/atooltip.jquery.js"></script>
		<!--[if lt IE 9]>
		<script type="text/javascript" src="js/html5.js"></script>
		<link rel="stylesheet" href="css/ie.css" type="text/css" media="all">
		<![endif]-->
		<!--[if lt IE 7]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a>
			</div>
		<![endif]-->
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
						
						<li class="active"><a href="Descrip.jsp"><span>Model Setting Wizard</span></a></li>
						<li><a href="JobStatus.jsp"><span>Job Status Report</span></a></li>
						<li class="last"><a href="MyFile.jsp"><span>My Profile</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->
<!--content -->
			<article style="height:1000px">
				
                <table width="100%">
                <tr>
                <td><h3>Welcome</h3></td>
                </tr>
                <tr>
                <td><form id="ContactForm" method="post" action="Description.jsp">
						
							<div  class="textarea_box">
							<div><b>This wizard will produce a GEMS control file for the template version 2.0.0<br>
                            Comments:Type any comments in the text area that you would like included in the control file for this model run.</b></div><br>
								<p><div class="bg"><textarea name="textarea" cols="1" rows="5"></textarea></p>			
											                            
						</div>
                      <p align="right" style="margin-top:10px"><input type="button" value="Clear"  class="button1" onclick="document.getElementById('ContactForm').reset()">   
                        <input type="submit" value="Next"  class="button1" onclick="window.dataform.submit()">               </p>
					</form></td>
            
                </table>
                
			</article>		
<!--content end-->
<!--footer -->
			<footer class="color2">
				<div align="center">西安交通大学人居环境与建筑工程学院<br>地址：西安交通大学曲江校区西一楼</div>
			</footer>
<!--footer end-->
		</div>
		<script type="text/javascript"> Cufon.now(); </script>
	</body>
</html>