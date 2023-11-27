<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <script type="text/javascript" src="js/fenye.js"></script>
         <script type="text/javascript" src="js/Tab.js"></script>
         <script type="text/javascript"> Cufon.now(); </script>
       <!-- <script type="text/javascript" language="javascript">
window.onload = function(){
page = new Page(3,'table1','group_one'); };
</script>
		[if lt IE 9]>
		<script type="text/javascript" src="js/html5.js"></script>
		<link rel="stylesheet" href="css/ie.css" type="text/css" media="all">
		<![endif]-->
		<!--[if lt IE 7]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a>
			</div>
		<![endif]-->
 
  
	</head>
	<body >
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



<article  style="height:1100px">

         <table width="100%" >
          <tr>
                <td colspan="3"><p></p></td></tr>
              
        <tr>
                 <td><a href="Config.jsp"><img src="images/1r.png"  width="100%" onmouseover="this.src='images/1b.png'" onmouseout="this.src='images/1r.png'"></a></td>
                <td><a href="DataSelect.jsp"><img src="images/2r.png"  width="100%" onmouseover="this.src='images/2b.png'" onmouseout="this.src='images/2r.png'"></a></td>
                <td><a href="OutputVar.jsp"><img src="images/3g.png" width="100%" onmouseover="this.src='images/3b.png'" onmouseout="this.src='images/3g.png'"></a></td>
                </tr>
         <tr>
             <form id="myform" method="post" action="DataSelection.jsp">
         <td>
             	<%--<form id="myform" method="post" action="DataSelection.jsp">--%>
          <table style="font-size:17px;color:#000;line-height:2em;padding:0px 0 17px 0;letter-spacing:0px">
                 <tr>
                <td><h3>Landcover Data</h3></td>
                </tr>
                <td >
                Choose the landcover data to use: <br>
                    
                        <input type="checkbox"  style= "height:16px;width:16px" name="LCFlag"  value="1" checked="checked">
                        Use Landcover<br>
                      
                     
                        <input type="checkbox"  style= "height:16px;width:16px" name="LC_Scenario_Flag"    value="1" checked="checked">
                        Use Landcover Scenario    <br>
                
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="PNV_Scenario_Flag"    value="1" >
                        Use PNV   <br>
                 
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="LC_grass_agblive_Flag"   value="1" checked="checked">
                        Use Grassland/Shrubland Biomass    <br>      
                                         
                </td>
                </tr>
                
                <tr>
                <td><h3>Climate Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose the climate data to use: <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="HistoricClimate" value="1"  checked="checked">
                       Use Historic Climate
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="ScenarioClimate" value="1" checked="checked">
                        Use Climate Scenario
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="HistoricNitrogen" value="1"  checked="checked">
                       Use Nitrogen Deposition
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="ScenarioNitrogen" value="1"  checked="checked">
                        Use Nitrogen Depostion Scenario
                      <br>    
                       <input type="checkbox" style= "height:16px;width:16px" name="Historicco2" value="1"  checked="checked">
                      Use Atmospheric CO2
                      <br>                 
                
                </td>
                </tr>
                 <tr>
                <td><h3>Soil Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose soil data to use: <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="sandy" value="1"  checked="checked">
                       Use sandy data
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="clay" value="1"   checked="checked">
                        Use clay data
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="silt" value="1"   checked="checked">
                       Use silt data
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="thickness" value="1"  checked="checked">
                       Use Soil Thickness
                      <br>    
                       <input type="checkbox" style= "height:16px;width:16px" name="OrganicCarbon" value="1"   checked="checked">
                      Use Organic Carbon
                      <br>     
                         <input type="checkbox" style= "height:16px;width:16px" name="WaterCapacity" value="1" checked="checked">
                       Use Water Capacity
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="DBH2O" value="1" checked="checked" >
                      Use DB 0.33 bar H2O (in g/cm3)
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="KFactor" value="1" checked="checked">
                      Use K Factor
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="Drainage" value="1"  checked="checked">
                      Use Drainage
                      <br>    
                       <input type="checkbox" style= "height:16px;width:16px" name="SoilErosion" value="1" >
                     Use Soil Erosion/Deposition
                      <br>    
                      <input type="checkbox" style= "height:16px;width:16px" name="CarbonErosion" value="1" >
                     Use Carbon Erosion/Deposition
                      <br>            
                
                </td>
                </tr>
               
                </table>
         </td>
         <td>
          <table style="font-size:17px;color:#000;line-height:2em;padding:0px 0 17px 0;letter-spacing:0px">
                <tr>
                <td><h3>Forest Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose the forest data to use: <br>

                      
                        <input type="checkbox" style= "height:16px;width:16px" name="Biomass" value="1"  checked="checked">
                      Use Biomass
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="StandAge" value="1" checked="checked">
                      Use Stand Age
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="StandAgeScenario" value="1"checked="checked">
                       Use Stand Age Scenario
                        
                     
                </tr>
                <tr>
                <td>
                FIA Data: <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="FIADatasets " value="0" checked="checked">
                     Use FIA Datasets 
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="MortalityTables" value="1" >
                     Use Mortality Tables
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="ThinningTables" value="2" checked="checked">
                      Use Thinning Tables
                      <br>
                     
                </tr>
                 <tr>
                <td>
                Timber Production: <br>
                   
                        <input type="checkbox" style= "height:16px;width:16px" name="TimberProduct " value="0" checked="checked">
                      Use Timber Product Output
                      <br>
                     
                        Timber Product Output Year:<select  name="OutputYear" style="width:70px;height:20px;font-size:17px">
        <option value="2002">2002</option>
        <option value="2003">2003</option>
        <option value="2004">2004</option>

      </select>
                      <br>

                     
                </tr>
                
                <tr>
                <td><h3>Crop Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose the crop data to use: <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="CropType" value="1"  checked="checked">
                      Use Crop Type
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="CropTypeScenario" value="1" checked="checked">
                      Use Crop Type Scenario
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="CropHarvest" value="1" checked="checked">
                    Use Crop Harvest
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="CropHarvestScenario" value="1" checked="checked">
                     Use Crop Harvest Scenario
                      <br>    
                       <input type="checkbox" style= "height:16px;width:16px" name="CoverCrop" value="1" checked="checked">
                      Use Cover Crop
                      <br>     
                       <input type="checkbox" style= "height:16px;width:16px" name="CoverCropScenario" value="1" checked="checked">
                     Use Cover Crop Scenario
                      <br> 
                       <input type="checkbox" style= "height:16px;width:16px" name="CropYieldTable" value="1"  checked="checked">
                     Use Crop Yield Table
                      <br>             
                
                </td>
                </tr>
                 <tr>
                <td><h3>Management Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose the crop data to use: <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="Manure" value="1" checked="checked">
                      Use Manure
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="ManureScenario" value="1" checked="checked">
                     Use Manure Scenario
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="Tillage" value="1"  checked="checked">
                      Use Tillage
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="TillageScenario" value="1"  checked="checked">
                      Use Tillage Scenario
                      <br>    
                       <input type="checkbox" style= "height:16px;width:16px" name="Fertilizer" value="1"  checked="checked">
                      Use Fertilizer
                      <br>     
                         <input type="checkbox" style= "height:16px;width:16px" name="FertilizerScenario" value="1"  checked="checked">
                       Use Fertilizer Scenario
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="Irrigation" value="1" checked="checked">
                      Use Irrigation
                      <br>
              
                
                </td>
                </tr>
                
               
                </table>
                
         </td>
         <td>
           <table style="font-size:17px;color:#000;line-height:2em;padding:0px 0 17px 0;letter-spacing:0px">
                <tr>
                <td><h3>Elevation Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose the Elevation Data to use: <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="Slope" value="1" >
                     Use Slope
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="Elevation" value="1" >
                     Use Elevation
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="CTI" value="1" >
                    Use Compound Topographic Index
                      <br>
                     
                </tr>
                <tr>
                <td><h3>Remotely Sensed Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose the remotely sensed data to use : <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="GPPTotal" id="GPPTotal" value="1" checked="checked">
                    Use GPP Total
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="GPPAve" id="GPPAve" value="1" checked="checked">
                    Use GPP Average
                      <br>
                    
                        <input type="checkbox" style= "height:16px;width:16px" name="NPP" id="NPP" value="1" checked="checked">
                    Use NPP
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="LAI" id="LAI" value="1" >
                     Use LAI
                      <br>    
                      
                </td>
                </tr>
                 <tr>
                <td><h3>Fire Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose Fire Data to use: <br>
                      <%
                          String Scenario = session.getAttribute("Scenario").toString();
                          if(Scenario.equals("4")||Scenario.equals("5")||Scenario.equals("6")||Scenario.equals("7")){ 
                    
                     %>
                       <input type="checkbox" style= "height:16px;width:16px" name=FireSeverity value="1" >
                      Use Fire Severity
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="FireSeverityScenario" value="1" >
                     Use Fire Severity Scenario
                      <%
                          }
                          else {
                       %> 
                    
                        <input type="checkbox" style= "height:16px;width:16px" name=FireSeverity value="1" checked="checked">
                      Use Fire Severity
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="FireSeverityScenario" value="1" checked="checked">
                     Use Fire Severity Scenario
                      <br>
                              
                          <% 
                          
                          }
                       %>
                </td>
                </tr>
                 <tr>
                <td><h3>Initial Conditions Data</h3></td>
                </tr>
                <tr>
                <td>
                Choose the Initial Conditions Data to use: <br>

                    
                        <input type="checkbox" style= "height:16px;width:16px" name="IniLitterBiomass" checked="checked" value="1" >
                     Use Initial Litter Biomass
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="IniAGLiveBiomass" checked="checked" value="1" >
                    Use Initial Above Ground Live Biomass
                      <br>
                      <input type="checkbox" style= "height:16px;width:16px" name="IniBGLiveBiomass" checked="checked" value="1" >
                     Use Initial Below Ground Live Biomass
                      <br>
                     
                        <input type="checkbox" style= "height:16px;width:16px" name="IniDWB" checked="checked" value="1" >
                     Use Initial Dead Wood Biomass
                      <br>
                      <input type="checkbox" style= "height:16px;width:16px" name="IniSWB" checked="checked" value="1" >
                     Use Initial Standing Wood Biomass
                      <br>
                                              
                
                </td>
                </tr>
             
                </table>
                   </form>

         </td>
         
         </tr>
             
         </table>
         <p align="right"  > 
                 <input type="button" value="Back"  class="button1" onclick="window.location.assign('Config.jsp')">
                  <input type="submit"   value="Next"  class="button1" onclick="window.myform.submit()"> </p>
       
             
			</article>		


<!--content end-->
<!--footer -->
			<footer style="font-size:17px;color:#000;line-height:2em;padding:300px 0 17px 0">
				<div align="center">西安交通大学人居环境与建筑工程学院<br>地址：西安交通大学曲江校区西一楼</div>
			</footer>
<!--footer end-->
		</div>
		
	</body>
</html>