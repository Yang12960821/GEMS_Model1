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
     
        String Model ="";
        String Ecoregion="";
      String AutoCalibration ="";
       String Scenario ="";
        String GeneralCirculationModel="";
          String GridSizeX="";
          String GridSizeY="";
           String XStartCoord="";
            String YStartCoord="";
              String XWindowSize="";
               String YWindowSize ="";
                String XWindowStart="";
                 String YWindowStart="";
                    String XWindowEnd="";
                     String YWindowEnd="";
                      String RowScale="";
                       String ColScale="";
                       String HistoricStartYear="";
                        String HistoricEndYear ="";
                         String ScenarioStartYear="";
                          String ScenarioEndYear="";
                           String CombineYears="";
                             String BasePixelSize="";
                              String   FipsCodeFlag ="";
                               String   FiaUnitFlag="";
        //设置Ecoregion------------------------------------------------
     /*   String Ecoregion = request.getParameter("Ecoregion");
       if (Ecoregion.equals("0")){
               wx.EcoRegion = "conus2500m";    
               wx.EcoRegioncon = "conus";   
       }
       else if (Ecoregion.equals("1")){
               wx.EcoRegion = "2er92";   
               wx.EcoRegioncon = "2er92";           
       } */
       //组织写入xml
      LinkedHashMap<String,String> map = new LinkedHashMap<String,String>();
       map.clear();
        Model = request.getParameter("Model");
         map.put("Model", Model);
          
               Ecoregion = request.getParameter("Ecoregion");
              map.put("Ecoregion", Ecoregion);
         
       AutoCalibration = request.getParameter("AutoCalibration");
         map.put("AutoCalibration", AutoCalibration);
         
       Scenario = request.getParameter("Scenario");
         map.put("Scenario", Scenario);

        /* try {
             int a = Integer.parseInt(Scenario);

             if (a==0) {
                 map.put("Scenario", "0");
             } else if (a==1) {
                 map.put("Scenario", "1");
             }else if (a==2) {
                 map.put("Scenario", "2");
             }else if (a==3) {
                 map.put("Scenario", "3");
             }else if (a==4) {
                 map.put("Scenario", "4");
             }else if (a==5) {
                 map.put("Scenario", "5");
             }else if (a==6) {
                 map.put("Scenario", "6");
             }else if (a==7) {
                 map.put("Scenario", "7");
             }
         }catch (NumberFormatException e){
             e.printStackTrace();
         }*/
         
            GeneralCirculationModel = request.getParameter("GeneralCirculationModel");
         map.put("GeneralCirculationModel", GeneralCirculationModel);  

           GridSizeX = request.getParameter("GridSizeX");
         map.put("GridSizeX", GridSizeX);  
         
            GridSizeY = request.getParameter("GridSizeY");
         map.put("GridSizeY", GridSizeY);  
                           
            XStartCoord = request.getParameter("XStartCoord");
         map.put("XStartCoord", XStartCoord);  
         
            YStartCoord = request.getParameter("YStartCoord");
         map.put("YStartCoord", YStartCoord);  
         
            XWindowSize = request.getParameter("XWindowSize");
         map.put("XWindowSize", XWindowSize);  
         
                 YWindowSize = request.getParameter("YWindowSize");
         map.put("YWindowSize", YWindowSize);
         
       XWindowStart = request.getParameter("XWindowStart");
         map.put("XWindowStart", XWindowStart);
         
       YWindowStart = request.getParameter("YWindowStart");
         map.put("YWindowStart", YWindowStart);  
         
            XWindowEnd = request.getParameter("XWindowEnd");
         map.put("XWindowEnd", XWindowEnd);  
         
           YWindowEnd = request.getParameter("YWindowEnd");
         map.put("YWindowEnd", YWindowEnd);  
         
            RowScale = request.getParameter("RowScale");
           if(RowScale.equals("1000")){
              RowScale = request.getParameter("InputX");
           }
         map.put("RowScale", RowScale);  
                           
            ColScale = request.getParameter("ColScale");
             if(ColScale.equals("1000")){
              ColScale = request.getParameter("InputY");
           }
         map.put("ColScale", ColScale);  
         
            HistoricStartYear = request.getParameter("HistoricStartYear");
         map.put("HistoricStartYear", HistoricStartYear);  
         
                 HistoricEndYear = request.getParameter("HistoricEndYear");
         map.put("HistoricEndYear", HistoricEndYear);  
         
           ScenarioStartYear = request.getParameter("ScenarioStartYear");
         map.put("ScenarioStartYear", ScenarioStartYear);  
         
            ScenarioEndYear = request.getParameter("ScenarioEndYear");
         map.put("ScenarioEndYear", ScenarioEndYear);  
                           
            CombineYears = request.getParameter("CombineYears");
         map.put("CombineYears", CombineYears);   
         
            BasePixelSize = request.getParameter("BasePixelSize");
          map.put("BasePixelSize", BasePixelSize);  
          
                 FipsCodeFlag = request.getParameter("FIPS");

     if( FipsCodeFlag !=null){
         map.put("FipsCodeFlag", FipsCodeFlag);     
     }
       else{
      map.put("FipsCodeFlag", "0");     
     }
           FiaUnitFlag = request.getParameter("FIA");

     if( FiaUnitFlag !=null){
         map.put("FiaUnitFlag", FiaUnitFlag);     
     }
     else{
      map.put("FiaUnitFlag", "0");     
     }         

     WriteXml   wx = new WriteXml();
           wx.WriteConfiguration(taskXmlPath, map);   
             session.setAttribute("Scenario", Scenario);  
                
                     response.sendRedirect ( "DataSelect.jsp" ); 
                     
    %>
  </body>
</html>
