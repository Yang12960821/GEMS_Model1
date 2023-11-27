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
        <script type="text/javascript" src="js/Conf.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){   
              $("#datatable thead").css("background-color", "#bbf"); 
        
             $("#datatable tbody ").css("background-color","#ffc");  
         //    $("#datatable tbody tr:odd").addClass("odd");
          //   $("#datatable tbody tr:even").addClass("even");
           
      //     $("#datatable tr:gt(0)").hover(function() { 
      //           $(this).children("td").addClass("hover"); 
      //           }, function() { 
     //          $(this).children("td").removeClass("hover"); 
     //      }); 
        
        
        });  
        </script>
        <style type="text/css">
       .hover
       {
           background-color:orange;
       }
       .tt{
           width: 200px;
       }
    </style>
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
			<article style="height:1200px">
			<form id="myform" method="post" action="OutputVariables.jsp">
				<table width="100%" border="1" style="font-size:17px;color:#000;line-height:2em;padding:0px 0 17px 0;letter-spacing:0px">
               <%-- <tr> <td colspan="9"><p></p></td></tr>--%>
                   <tr>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                       <td width="11%">&nbsp;</td>
                   </tr>
                <tr>
                  <td colspan="3" ><a href="Config.jsp"><img src="images/1r.png"   onmouseover="this.src='images/1b.png'" onmouseout="this.src='images/1r.png'"></a></td>
                <td colspan="3" ><a href="DataSelect.jsp"><img src="images/2r.png"   onmouseover="this.src='images/2b.png'" onmouseout="this.src='images/2r.png'"></a></td>
                <td colspan="3" ><a href="OutputVar.jsp"><img id="thirdBar" src="images/3r.png"  onmouseover="this.src='images/3b.png'" onmouseout="this.src='images/3r.png'"></a></td>
                </tr>
                <tr> <td colspan="9"><p></p></td></tr>
  <tr>
    <td colspan="1"><strong>Time Interval:</strong></td>
    <td colspan="8"><select  name="TimeInterval" style="width:80px;height:20px;font-size:17px">
        <option value="0">Yearly</option>
        <option value="1">Monthly</option>
        <option value="2">Daily</option>

      </select></td>
  </tr>
  <tr>
    <td colspan="1"><b>Output Variables:</b> </td>
    <td colspan="4" >
                        <input type="checkbox" style= "height:16px;width:16px" name="Ncproda" value="1"  checked="checked"><%--1--%>
                        NCPRODA: Net carbon production by ag
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="Cgrain" checked="checked" value="1" ><%--2--%>
                        CGRAIN:   Total carbon related to grain prodution
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="Frstc" value="1" ><%--3--%>
                        FRSTC: Total living biomass
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px"  name="Fsysc" value="1" checked="checked"><%--4--%>
                        FSYSC: Total ecosystem carbon
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="somsc" value="1"  checked="checked"><%--5--%>
                        SOMSC: Total soil carbon excluding litter and structural carbon
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="somtc" value="1"  ><%--6--%>
                        SOMTC: Total soil carbon including belowground structural and &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp metabolic carbon
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="Petann" value="1" ><%--7--%>
                        PETANN: PET Annual amount
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="ETann" value="1" checked="checked"><%--8--%>
                        ETANN
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="asmos1" value="1" checked="checked"><%--9--%>
                        ASMOS1: Soil Moisture
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="stream1" value="1" checked="checked"><%--10--%>
                            STREAM1: Streamflow
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="profSOC" value="1" ><%--11--%>
                        PROFSOC: profile SOC
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="Stem_P" value="1" ><%--12--%>
                        STEMP: Soil temperature
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="nee" value="1" ><%--13--%>
                        NEE: Net ecosystem exchange
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="totc" value="1" ><%--14--%>
                        TOTC: Total carbon
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="CH4" value="1"  ><%--15--%>
                        CH4: Methane emission from wetland or irrigation
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="CROOTC" value="1" ><%--16--%>
                        CROOTC: Carbon in forest system coarse root component
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="FIPS" value="1" ><%--17--%>
                        FIPS: FIPS county code
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="Hwpraw" value="1" ><%--18--%>
                        HWPRAW: Raw harvested wood material
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="LC_INPUT" value="1" ><%--19--%>
                        LC INPUT: Land Cover Input
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="METABC1" value="1" ><%--20--%>
                        METABC1: Metabolic C in litter in surface
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="RLWODC" value="1" ><%--21--%>
                        RLWODC: Carbon in forest system large wood component
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="STDEDC" value="1" ><%--22--%>
                        STDEDC: Carbon in standing dead material for grass/crop
                        <br>

                        <%--<input type="checkbox" style= "height:16px;width:16px" name="Streamflow" value="1" >&lt;%&ndash;19&ndash;%&gt;
                        STREAMFLOW:
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="inorganic_N" value="1" >&lt;%&ndash;20&ndash;%&gt;
                        INORGANIC N:
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="inorganic_P" value="1" >&lt;%&ndash;21&ndash;%&gt;
                        INORGANIC P:
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="Soil_Moisture" value="1" >&lt;%&ndash;22&ndash;%&gt;
                         SOIL MOISTURE:
                        <br>

                        <input type="checkbox" style= "height:16px;width:16px" name="profSOC" value="1" >&lt;%&ndash;23&ndash;%&gt;
                        PROFSOC:
                        <br>--%>

      </td>
      <td colspan="4">

          <input type="checkbox" style= "height:16px;width:16px" name="STRUCC1" value="1" ><%--23--%>
          STRUCC1: Litter structural carbon in surface
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="tcrem" value="1" ><%--24--%>
          TCREM: Carbon removal by tree cutting
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="WOOD2C" value="1" ><%--25--%>
          WOOD2C: Carbon in wood2 (dead large wood) component of forest &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp system
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="Prcann" value="1" ><%--26--%>
          PRCANN: Precipitation Annual
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="lchout" value="1" ><%--27--%>
          LCHOUT: Leaching out
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="evap" value="1" ><%--28--%>
          EVAP: Evaporation
          <br>
          <input type="checkbox" style= "height:16px;width:16px" name="tran" value="1" ><%--29--%>
          TRAN
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="asmos2" value="1" ><%--30--%>
          ASMOS2
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="asmos3" value="1" ><%--31--%>
          ASMOS3
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="asmos4" value="1" ><%--32--%>
          ASMOS4
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="asmos5" value="1" ><%--33--%>
          ASMOS5
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="asmos6" value="1" ><%--34--%>
          ASMOS6
          <br>
          <input type="checkbox" style= "height:16px;width:16px" name="asmos7" value="1" ><%--35--%>
          ASMOS7
          <br>
          <input type="checkbox" style= "height:16px;width:16px" name="asmos8" value="1" ><%--36--%>
          ASMOS8
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="asmos9" value="1" ><%--37--%>
          ASMOS9
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="asmos10" value="1" ><%--38--%>
          ASMOS10
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="stream2" value="1" ><%--39--%>
          STREAM2: inorganic N
          <br>

          <input type="checkbox" style= "height:16px;width:16px" name="stream3" value="1" ><%--40--%>
          STREAM3: inorganic P
          <br>
          <input type="checkbox" style= "height:16px;width:16px" name="stream5" value="1" ><%--41--%>
          STREAM5: organic C
          <br>
          <input type="checkbox" style= "height:16px;width:16px" name="stream6" value="1" ><%--42--%>
          STREAM6: organic N
          <br>
          <input type="checkbox" style= "height:16px;width:16px" name="stream7" value="1" ><%--43--%>
          STREAM7: organic P
          <br>
          <input type="checkbox" style= "height:16px;width:16px" name="profFastC" value="1" ><%--44--%>
          PROFFASTC: profile Fast SOC
          <br>
      </td>
  </tr>
  <tr>
    <td><input  type="button"  class="button2"  onclick="divControl()"  width ="200px" value="Add File"></td>
    <td colspan="8"  >
    <div  id="AddVria" style="display: none" width="100%">
    <table  width="100%" >
          <tr  ><td><label for="varname">VarName:</label></td><td><input  id="VarName" type="text"></td><td><label for="LongName">LongName:</label></td><td><input  id="LongName" type="text"></td></tr>
  
          <tr><td><label for="Units">Units:</label></td><td><input  id="Units" type="text"></td><td> <label for="Title">Title:</label></td><td><input  id="Title" type="text"></td></tr>
         <tr  align ="center"><td colspan="4"><input   type="button" class="button3" value="Push" onclick="AddRow();AddVaria()"></td></tr>

             <tr><td colspan="4">

             <table width="100%"   id="datatable"  border="10"  bgcolor="green"  name ="VariaTable" >
       <thead>
            <tr  align="left">
                <th>
                    VarName
                </th>
                <th>
                    LongName
                </th>
                <th>
                    Units
                </th>
                <th>
                    Title
                </th>
                 
            </tr>
          </thead><tbody>
          <tr style="display:none"><td>example</td><td>example</td><td>example</td><td>example</td></tr>
    
         </tbody>
    </table>
      
    </td></tr>
        
         </table></div>
         </td>
  </tr>
</table>
    <textarea rows="1" cols="1"   id="AddedValues"     name="AddedValues"   style="display:none" ></textarea>
    </form>  
                      
                <p align="right" style=" margin-top:100px">
                 <input type="button" value="Back"  class="button1" onclick="window.location.assign('DataSelect.jsp')">
                  <input type="submit"   value="Confirm"  class="button1" onclick="window.myform.submit()">
                 </p>
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