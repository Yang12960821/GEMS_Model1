<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%> 
<%@ page import=" java.io.File"%> 
<%@page import=" ConXml.* "%>

<%@page import=" java.sql.ResultSet "%>
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
<html lang="en">
	<head>
		<head>
		<title>Configuration</title>
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
        <script type="text/javascript" src="js/Conf.js"></script>
	
	</head>
<script>
$(document).ready(function(){ 
          $('#RowScale').change(function(){ 

         var p1=$(this).children('option:selected').val();//这就是selected的值 
         if(p1=="1000"){
           $('#InputX').css("display","");
         
         }
        

}) 
     $('#ColScale').change(function(){ 

         var p2=$(this).children('option:selected').val();//这就是selected的值 
      if(p2=="1000"){
           $('#InputY').css("display","");
         
         }

}) 
     $('#Ecoregion').change(function(){ 

         var EcoValue=$(this).children('option:selected').val();//这就是selected的值 

      if(EcoValue=="2"){
       
       $('#GridSizeX').val('2067');
      $('#GridSizeY').val('1136');
          $('#XStartCoord').val('-852356.7');
      $('#YStartCoord').val('4523980');
         $('#XWindowEnd').val('2066');
      $('#YWindowEnd').val('1135');
        $('#Scenario').val('4');
         $('#RowScale').val('10');
              $('#ColScale').val('10');
      
             $('#HistoricEndYear').val('2015');
      $('#ScenarioStartYear').val('2016');
        $('#BasePixelSize').val('1000');
         $('#FIA').attr('checked',true);
          $('#FIPS').attr('checked',true);
         }
         else if (EcoValue=="0"||EcoValue=="1"){
                $('#GridSizeX').val('1846');
      $('#GridSizeY').val('1161');
          $('#XStartCoord').val('--2355078');
      $('#YStartCoord').val('3172168');
         $('#XWindowEnd').val('1845');
      $('#YWindowEnd').val('1160');
        $('#Scenario').val('0');
         $('#RowScale').val('10');
              $('#ColScale').val('10');
      
             $('#HistoricEndYear').val('2005');
      $('#ScenarioStartYear').val('2006');
        $('#BasePixelSize').val('2500');
         $('#FIA').attr('checked',true);
          $('#FIPS').attr('checked',true);
         
         
         }

}) 


}) 

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
						
						<li class="active"><a href="Descrip.jsp"><span>Model Setting Wizard</span></a></li>
						<li ><a href="JobStatus.jsp"><span>Job Status Report</span></a></li>
						<li class="last"><a href="MyFile.jsp"><span>My Profile</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->
<!--content -->
			<article height="1000px">
			
                <table >
                 <tr>
                <td colspan="3"><p></p></td></tr>
                <tr>
                <td><a href="Config.jsp"><img src="images/1r.png"  width="100%" onmouseover="this.src='images/1b.png'" onmouseout="this.src='images/1r.png'"></a></td>
                <td><a href="DataSelect.jsp"><img src="images/2g.png"  width="100%" onmouseover="this.src='images/2b.png'" onmouseout="this.src='images/2g.png'"></a></td>
                <td><a href="OutputVar.jsp"><img src="images/3g.png" width="100%" onmouseover="this.src='images/3b.png'" onmouseout="this.src='images/3g.png'"></a></td>
                </tr>
                <tr>
                <td colspan="3"><p></p></td></tr>
                <tr>
                <td colspan="3">
                	<form id="myform" method="post" action="Configuration.jsp">
                <table width="100%" border="1" style="font-size:17px;color:#000;line-height:2em;padding:0px 0 17px 0;letter-spacing:0px">
                
  <tr>
    <th  scope="col" align="left">Items</th>
    <th  scope="col" align="center">
     Values
    </th>
    <th  scope="col" align="left">Description</th>
  </tr>
   <tr >
    <td>Model:</td>
    <td align="center"> <select  name="Model" style="width:140px;height:20px;font-size:17px">
        <option value="1">EDCM-AUTO</option>
        <option value="0">Century</option>
        <option value="2">PBN</option>
        <option value="3">EnFK_EDCM</option>
      </select>
   </td>
    <td>The  Model for the run</td>
  </tr>
  <tr>
    <td>Auto  Calibration:   </td>
    <td align="center"><input style="width:140px;height:20px;font-size:17px" type="text"  id="AutoCalibration"  name="AutoCalibration" value="0" size="2"/>
   </td>
    <td>Integer 1-20</td>
  </tr>
  <tr>
    <td>EcoRegion: </td>
    <td align="center">  
      <select style="width:140px;height:20px;font-size:17px" name="Ecoregion" id="Ecoregion">
        <option value="0">CONUS</option>
         <option value="1">Eco92</option>
           <option value="2">YRB</option>
      </select>
    </td>
    <td>The  EcoRegion for which the model run will use</td>
  </tr>
  <tr>
    <td>Scenario:</td>
    <td align="center"><select style="width:140px;height:20px;font-size:17px" id="Scenario" name="Scenario">
        <option value="0">A1B</option>
        <option value="1">A2</option>
        <option value="2">B1</option>
        <option value="3">B2</option>
        <option value="4">RCP26</option>
        <option value="5">RCP45</option>
        <option value="6">RCP60</option>
        <option value="7">RCP85</option>

      </select></td>
    <td>The scenario to  run (A1B,A2,B1,B2,RCP26,RCP45,RCP60,RCP85)</td>
  </tr>
  <tr>
    <td>General  Circulation Model:</td>
    <td align="center"><select style="width:140px;height:20px;font-size:17px" id="GeneralCirculationModel" name="GeneralCirculationModel">
        <option value="miroc">MIROC</option>
        <option value="cgcm"  selected="selected">CGCM</option>
        <option value="csiro">CSIRO</option>
        <option value="ipsl">IPSL</option>
        <option value="gfdl">GFDL</option>
      </select></td>
    <td>Used  to select datasets which are specific to a General Circulation Model</td>
  </tr>
  <tr>
    <td>Grid  Size:</td>
    <td align="center">X:<input style="width:60px;height:20px;font-size:17px" type="text" id="GridSizeX" name="GridSizeX" value="1846" size="1">Y:<input style="width:60px;height:20px;font-size:17px" type="text" id="GridSizeY" name="GridSizeY" value="1161" size="1"></td>
    <td>The  size of the input grids to be processed in pixels</td>
  </tr>
  <tr>
    <td>Starting Coordinate </td>
    <td align="center">X:<input style="width:80px;height:20px;font-size:17px" type="text" id="XStartCoord" name="XStartCoord" value="-2355078" size="5">Y:<input style="width:80px;height:20px;font-size:17px" type="text" id="YStartCoord" name="YStartCoord" value="3172168" size="5"></td>
    <td>The  Albers Equal Area,NAD83 upper,left coordinate of the overall grid</td>
  </tr>
  <tr>
    <td>Window  Size:</td>
    <td align="center">X:<input style="width:60px;height:20px;font-size:17px" type="text" id="XWindowSize" name="XWindowSize" value="200" size="1">Y:<input style="width:60px;height:20px;font-size:17px" type="text" id="YWindowSize" name="YWindowSize" value="200" size="1"></td>
    <td>Size of moving  window(in X and Y dimension)</td>
  </tr>
  <tr>
    <td>Window Start:</td>
    <td align="center">X:<input style="width:60px;height:20px;font-size:17px" type="text" id="XWindowStart" name="XWindowStart" value="0" size="1">Y:<input style="width:60px;height:20px;font-size:17px" type="text" id="YWindowStart" name="YWindowStart" value="0" size="1"></td>
    <td>Where  to start the moving window in X and Y dimension</td>
  </tr>
  <tr >
    <td>Window End:</td>
    <td align="center">X:<input style="width:60px;height:20px;font-size:17px" type="text" id="XWindowEnd" name="XWindowEnd" value="1845" size="1">Y:<input style="width:60px;height:20px;font-size:17px" type="text" id="YWindowEnd" name="YWindowEnd" value="1160" size="1"></td>
    <td>Where  to stop the moving window in X and Y dimension</td>
  </tr>

  <tr>
    <td>Sample  Rate:</td>
    <td align="center">X:<select name="RowScale" id="RowScale" style="width:60px;height:20px;font-size:17px" onChange="ScaleChange()">
        <option value="1">1</option>
        <option value="2">2</option>
            <option value="3">3</option>
        <option value="5">5</option>
         <option value="10"  selected = "selected" >10</option>
          <option value="20">20</option>
           <option value="50">50</option>
            <option value="100">100</option>
              <option value="1000">other</option>
      </select> <input type="text" name="InputX"   id="InputX" style="display:none;width:40px;height:20px;font-size:17px" >
      Y: <select style="width:60px;height:20px;font-size:17px" name="ColScale" id="ColScale"  >
       <option value="1">1</option>
            <option value="2">2</option>
               <option value="3">3</option>
        <option value="5">5</option>
         <option value="10"  selected = "selected" >10</option>
          <option value="20">20</option>
           <option value="50">50</option>
            <option value="100">100</option>
             <option value="1000">other</option>
      </select><input type="text" name="InputY"  id="InputY"  style="display:none;width:40px;height:20px;font-size:17px" >
      </td>
    <td>Number  of row and column pixels to skip each time</td>
  </tr>
  <tr>
    <td>Historic  Start Year: </td>
    <td align="center"><input type="text"  id="HistoricStartYear" name="HistoricStartYear" value="1992" size="1" style="width:140px;height:20px;font-size:17px"></td>
    <td>Start year for  historic (non-scenario)data</td>
  </tr>
  <tr>
    <td>Historic  End Year: </td>
    <td align="center"><input style="width:140px;height:20px;font-size:17px" type="text" id="HistoricEndYear" name="HistoricEndYear" value="2005" size="1"></td>
    <td>End  year for historic (non-scenario)data</td>
  </tr>
  <tr>
    <td>Scenario  Start Year: </td>
    <td align="center"><input style="width:140px;height:20px;font-size:17px" type="text" id="ScenarioStartYear" name="ScenarioStartYear" value="2006" size="1"></td>
    <td>Start  year for model run</td>
  </tr>
  <tr>
    <td>Scenario  End Year: </td>
   <td align="center"><input style="width:140px;height:20px;font-size:17px" type="text" id="ScenarioEndYear" name="ScenarioEndYear" value="2050" size="1"></td>
    <td>End  year for model run</td>
  </tr>
  <tr>
    <td>Combine  Years: </td>
    <td align="center"><select style="width:200px;height:20px;font-size:17px"  id="CombineYears" name="CombineYears">
        <option value="2">BOTH</option>
         <option value="1">Historic years</option>
          <option value="0">Future scenario years</option>
      </select></td>
    <td> if BOTH,it is recommended that the historic  and future years be contiguous(i.e.2001-2005,2006-2050)</td>
  </tr>
  <tr>
    <td>Base  Pixel Size: </td>
   <td align="center"> <select style="width:140px;height:20px;font-size:17px" id="BasePixelSize" name="BasePixelSize">
        <option value="2500">2500</option>
        <option value="250">250</option>
           <option value="1000">1000</option>
      </select></td>
    <td>Base  pixel size of output dataset in meters</td>
  </tr>
  <tr>
    <td>Administrative  Units:</td>
    <td ><input type="checkbox"  id="FIA"  name="FIA" value="1" checked="checked"/>  Use FIA Units<br>
        <input type="checkbox" id="FIPS" name="FIPS" value="1"  checked="checked"/> Use FIPS Codes</td>
   
  </tr>
</table>
                </form>
                </td>
                </tr>
                 
                </table>
                <p align="right" style="margin-top:100px">   <input type="button" value="Back"  class="button1" onclick="window.location.assign('Descrip.jsp')">
                 <input type="submit" value="Next"  class="button1" onclick="window.myform.submit()">  </p>
              
			</article>		
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