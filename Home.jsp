<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >
	<head>
		<title>首页</title>
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
	<body id="page3">
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
						<li class="active"><a href="Home.jsp"><span>Home</span></a></li>
						
						<li><a href="Descrip.jsp"><span>Model Setting Wizard</span></a></li>
						<li><a href="JobStatus.jsp"><span>Job Status Report</span></a></li>
						<li class="last"><a href="MyFile.jsp"><span>My Profile</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->
<!--content -->
			<article height="400px" style="color:#fff">
				
						<h2>About </h2>
						
					
                    <table>
                    <tr>
                    <td><figure class="pad_bot1"><img src="images/2.jpg" alt=""></figure></div></td>
                    <td><div ><p><span class="color2">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Environmental Change and Eco-hydrology Lab</strong> was established in 2015, main research area is:Watershed hydrology, non-point source pollution, climate and land use change, ecosystem of water - carbon - nitrogen cycle, farmland management, soil moisture and organic carbon, greenhouse gas emissions, data assimilation, hydrology and water resources evolution, land/atmosphere interaction based on Earth System Model, environmental modeling research, GIS based software development, model development and integration.</span></p></div>	</td>
                    
                    </tr >
                    
                    </table>
			</article>
		<!--  <div >
			<div class="main" style="color:#fff">
				<h2>What the Model can do</h2>
						<div class="wrapper">
							<div class="col1 marg_right1">
								<div class="wrapper">
									<span class="dropcap_1">1</span>
									<p class="color1">模型特征1</p>
								</div>	
								<p class="color1">模型特征1的详细内容</p>
								<div class="wrapper">
									<span class="dropcap_1">2</span>
									<p class="color1">模型特征2</p>
								</div>	
								<p class="color1">模型特征2的详细内容</p>								
							
								<div class="wrapper">
									<span class="dropcap_1">3</span>
									<p class="color1">模型特征3</p>
								</div>	
								<p class="color1">模型特征3的详细内容</p>
								<div class="wrapper">
									<span class="dropcap_1">4</span>
									<p class="color1">模型特征4</p>
								</div>	
								<p class="color1">模型特征4的详细内容</p>
						
						</div>
					</div>
			</div>
		</div>-->
		<div class="color2">
			<div class="main">
				<article id="content2">
					<div class="wrapper">
						<h3>Team Members</h3>
						<div class="col3 marg_right1">
							<figure class="left marg_right1"><img  src="images/wuyp.jpg" alt=""></figure>
							<p><strong>Yiping Wu,Professor,Research Area:</strong>Watershed hydrology, non-point source pollution, climate and land use change, ecosystem of water - carbon - nitrogen cycle, farmland management, soil moisture and organic carbon, model development and integration.	
							</p>
						</div>
						<div class="col3">
							<figure class="left marg_right1"><img  src="images/qiulj.jpg" alt=""></figure>
							<p><strong>Linjing Qiu,Assistant Professor,Research Area:</strong>Hydrology and water resources evolution, watershed hydrological process modelling, water-carbon-nitrogen cycle in ecosystem, land/atmosphere interaction based on Earth System Model.
							
							</p>
						</div>
						<div class="col3">
							<figure class="left marg_right1"><img  src="images/sunyz.jpg" alt=""></figure>
							<p><strong>Yuzhu Sun,Software Engineer,Research Area:</strong>Environmental modeling research, GIS based software development, model development and integration.
							
							</p>
						</div>
						<div class="col3">
							<figure class="left marg_right1"><img  src="images/zhaofb.jpg" alt=""></figure>
							<p><strong>Fubo Zhao,Ph.D Student,Research Area:</strong>Modeling of water-carbon cycles in agro-ecosystem.
							
							</p>
						</div>
					</div>
				</article>
			</div>
		</div>
		<div class="main">
<!--content end-->
<!--footer -->
			<footer class="color2">
				<div align="center" >西安交通大学人居环境与建筑工程学院<br>地址：西安交通大学曲江校区西一楼</div>
			</footer>
<!--footer end-->
		</div>
		<script type="text/javascript"> Cufon.now(); </script>
	</body>
</html>