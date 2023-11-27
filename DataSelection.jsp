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
      response.sendRedirect ( "OutputVar.jsp" );
     WriteXml   wx = new WriteXml();
     LinkedHashMap<String,String> map = new LinkedHashMap<String,String>();
     map.clear();
         //LandCover Data --------------------------------
     String LCFlag = request.getParameter("LCFlag");
     if( LCFlag !=null){
         map.put("LCFlag", LCFlag);     
     }
   
       String   LC_Scenario_Flag = request.getParameter("LC_Scenario_Flag");
     if( LC_Scenario_Flag !=null){
         map.put("LC_Scenario_Flag", LC_Scenario_Flag);     
     }
     
       String PNV_Scenario_Flag = request.getParameter("PNV_Scenario_Flag");
     if( PNV_Scenario_Flag !=null){
         map.put("PNV_Scenario_Flag", PNV_Scenario_Flag);     
     }
     else{
         map.put("PNV_Scenario_Flag", "0");     
     }
     
       String LC_grass_agblive_Flag = request.getParameter("LC_grass_agblive_Flag");
     if( LC_grass_agblive_Flag !=null){
         map.put("LC_grass_agblive_Flag", LC_grass_agblive_Flag);     
     }
     
     //Climate Data --------------------------------
       String HistoricClimate = request.getParameter("HistoricClimate");
     if( HistoricClimate !=null){
         map.put("HistoricClimate", HistoricClimate);     
     }
       String ScenarioClimate = request.getParameter("ScenarioClimate");
     if( ScenarioClimate !=null){
         map.put("ScenarioClimate", ScenarioClimate);     
     }
      String HistoricNitrogen = request.getParameter("HistoricNitrogen");
     if( HistoricNitrogen !=null){
         map.put("HistoricNitrogen", HistoricNitrogen);     
     }
     String ScenarioNitrogen = request.getParameter("ScenarioNitrogen");
     if( ScenarioNitrogen !=null){
         map.put("ScenarioNitrogen", ScenarioNitrogen);     
     }
     String Historicco2 = request.getParameter("Historicco2");
     if( Historicco2 !=null){
         map.put("Historicco2", Historicco2);     
     }
     // Soil Data -------------------------------------------------------
     
      String sandy = request.getParameter("sandy");
     if( sandy !=null){
         map.put("sandy", sandy);     
     }
      String clay = request.getParameter("clay");
     if( clay !=null){
         map.put("clay", clay);     
     }
      String silt = request.getParameter("silt");
     if( silt !=null){
         map.put("silt", silt);     
     }
      String thickness = request.getParameter("thickness");
     if( thickness !=null){
         map.put("thickness", thickness);     
     }
      String OrganicCarbon = request.getParameter("OrganicCarbon");
     if( OrganicCarbon !=null){
         map.put("OrganicCarbon", OrganicCarbon);     
     }
      String WaterCapacity = request.getParameter("WaterCapacity");
     if( WaterCapacity !=null){
         map.put("WaterCapacity", WaterCapacity);     
     }
      String DBH2O = request.getParameter("DBH2O");
     if( DBH2O !=null){
         map.put("DBH2O", DBH2O);     
     }
      String KFactor = request.getParameter("KFactor");
     if( KFactor !=null){
         map.put("KFactor", KFactor);     
     }
     else{
         
     map.put("KFactor", "0");     
     }
      String Drainage = request.getParameter("Drainage");
     if( Drainage !=null){
         map.put("Drainage", Drainage);     
     }
      String SoilErosion = request.getParameter("SoilErosion");
     if( SoilErosion !=null){
         map.put("SoilErosion", SoilErosion);     
     }
     else{
           map.put("SoilErosion", "0");    
     }
      String CarbonErosion = request.getParameter("CarbonErosion");
     if( CarbonErosion !=null){
         map.put("CarbonErosion", CarbonErosion);     
     }
     else {
       map.put("CarbonErosion", "0");     
     }
     //Crop Data--------------------------------------------------------------------------------------
        String CropType = request.getParameter("CropType");
     if( CropType !=null){
         map.put("CropType", CropType);     
     }
     else {
       map.put("CropType", "0");     
     }
     
        String CropTypeScenario = request.getParameter("CropTypeScenario");
     if( CropTypeScenario !=null){
         map.put("CropTypeScenario", CropTypeScenario);     
     }
     else {
       map.put("CropTypeScenario", "0");     
     }
     
        String CropHarvest = request.getParameter("CropHarvest");
     if( CropHarvest !=null){
         map.put("CropHarvest", CropHarvest);     
     }
     else {
       map.put("CropHarvest", "0");     
     }
     
        String CropHarvestScenario = request.getParameter("CropHarvestScenario");
     if( CropHarvestScenario !=null){
         map.put("CropHarvestScenario", CropHarvestScenario);     
     }
     else {
       map.put("CropHarvestScenario", "0");     
     }
     
        String CoverCrop = request.getParameter("CoverCrop");
     if( CoverCrop !=null){
         map.put("CoverCrop", CoverCrop);     
     }
     else {
       map.put("CoverCrop", "0");     
     }
     
        String CoverCropScenario = request.getParameter("CoverCropScenario");
     if( CoverCropScenario !=null){
         map.put("CoverCropScenario", CoverCropScenario);     
     }
     else {
       map.put("CoverCropScenario", "0");     
     }
     
       // String CropFieldTable = request.getParameter("CropYieldTable");
        String CropYieldTable = request.getParameter("CropYieldTable");
     if( CropYieldTable !=null){
        // map.put("CropYieldTable", CropFieldTable);
         map.put("CropYieldTable", CropYieldTable);
     }
     else {
       map.put("CropYieldTable", "0");     
     }
     //Management Data---------------------------------------------------------------------------------------------
     String Manure = request.getParameter("Manure");
     if( Manure !=null){
         map.put("Manure", Manure);     
     }
     else {
       map.put("Manure", "0");     
     }
     String ManureScenario = request.getParameter("ManureScenario");
     if( ManureScenario !=null){
         map.put("ManureScenario", ManureScenario);     
     }
     else {
       map.put("ManureScenario", "0");     
     }
     String Tillage = request.getParameter("Tillage");
     if( Tillage !=null){
         map.put("Tillage", Tillage);     
     }
     else {
       map.put("Tillage", "0");     
     }
     String TillageScenario = request.getParameter("TillageScenario");
     if( TillageScenario !=null){
         map.put("TillageScenario", TillageScenario);     
     }
     else {
       map.put("TillageScenario", "0");     
     }
     String Fertilizer = request.getParameter("Fertilizer");
     if( Fertilizer !=null){
         map.put("Fertilizer", Fertilizer);     
     }
     else {
       map.put("Fertilizer", "0");     
     }
     String FertilizerScenario = request.getParameter("FertilizerScenario");
     if( FertilizerScenario !=null){
         map.put("FertilizerScenario", FertilizerScenario);     
     }
     else {
       map.put("FertilizerScenario", "0");     
     }
     String Irrigation = request.getParameter("Irrigation");
     if( Irrigation !=null){
         map.put("Irrigation", Irrigation);     
     }
     else {
       map.put("Irrigation", "0");     
     }
     //Forest Data ---------------------------------------------
       String Biomass = request.getParameter("Biomass");
     if( Biomass !=null){
         map.put("Biomass", Biomass);     
     }
     else {
       map.put("Biomass", "0");     
     }
       String StandAge = request.getParameter("StandAge");
     if( StandAge !=null){
         map.put("StandAge", StandAge);     
     }
     else {
       map.put("StandAge", "0");     
     }
       String StandAgeScenario = request.getParameter("StandAgeScenario");
     if( StandAgeScenario !=null){
         map.put("StandAgeScenario", StandAgeScenario);     
     }
     else {
       map.put("StandAgeScenario", "0");     
     }
       String FIADatasets = request.getParameter("FIADatasets");
     if( FIADatasets !=null){
         map.put("FIADatasets", FIADatasets);     
     }
     else {
       map.put("FIADatasets", "0");     
     }
       String MortalityTables = request.getParameter("MortalityTables");
     if( MortalityTables !=null){
         map.put("MortalityTables", MortalityTables);     
     }
     else {
       map.put("MortalityTables", "0");     
     }
       String ThinningTables = request.getParameter("ThinningTables");
     if( ThinningTables !=null){
         map.put("ThinningTables", ThinningTables);     
     }
     else {
       map.put("ThinningTables", "0");     
     }
       String TimberProduct = request.getParameter("TimberProduct");
     if( TimberProduct !=null){
         map.put("TimberProduct", TimberProduct);     
     }
     else {
       map.put("TimberProduct", "0");     
     }
     String OutputYear = request.getParameter("OutputYear");
     
         map.put("OutputYear", OutputYear);     
    
     
     //Elevation Data -----------------------------------------------------
          String Slope = request.getParameter("Slope");
     if( Slope !=null){
         map.put("Slope", Slope);     
     }
     else {
       map.put("Slope", "0");     
     }
        String Elevation = request.getParameter("Elevation");
     if( Elevation !=null){
         map.put("Elevation", Elevation);     
     }
     else {
       map.put("Elevation", "0");     
     }
        String CTI = request.getParameter("CTI");
     if( CTI !=null){
         map.put("CTI", CTI);     
     }
     else {
       map.put("CTI", "0");     
     }
     //  Remotely sense  data------------------------------
        String GPPTotal = request.getParameter("GPPTotal");
     if( GPPTotal !=null){
         map.put("GPPTotal", GPPTotal);     
     }
     else {
       map.put("GPPTotal", "0");     
     }
        String GPPAve = request.getParameter("GPPAve");
     if( GPPAve !=null){
         map.put("GPPAve", GPPAve);     
     }
     else {
       map.put("GPPAve", "0");     
     }
        String NPP = request.getParameter("NPP");
     if( NPP !=null){
         map.put("NPP", NPP);     
     }
     else {
       map.put("NPP", "0");     
     }
        String LAI = request.getParameter("LAI");
     if( LAI !=null){
         map.put("LAI", LAI);     
     }
     else {
       map.put("LAI", "0");     
     }
     // Fire  Data ----------------------------------------------------------
     String FireSeverity = request.getParameter("FireSeverity");
   //  System.out.println(FireSeverity);
     if( FireSeverity !=null){
         map.put("FireSeverity", FireSeverity);     
     }
     else {
       map.put("FireSeverity", "0");     
     }
     String FireSeverityScenario = request.getParameter("FireSeverityScenario");
     if( FireSeverityScenario !=null){
         map.put("FireSeverityScenario", FireSeverityScenario);     
     }
     else {
       map.put("FireSeverityScenario", "0");     
     }
        
     
     // Initial Conditions
     String IniLitterBiomass = request.getParameter("IniLitterBiomass");
     if( IniLitterBiomass !=null){
         map.put("IniLitterBiomass", IniLitterBiomass);     
     }
     else {
       map.put("IniLitterBiomass", "0");     
     }
     String IniAGLiveBiomass = request.getParameter("IniAGLiveBiomass");
     if( IniAGLiveBiomass !=null){
         map.put("IniAGLiveBiomass", IniAGLiveBiomass);     
     }
     else {
       map.put("IniAGLiveBiomass", "0");     
     }
     
     String IniBGLiveBiomass = request.getParameter("IniBGLiveBiomass");
     if( IniBGLiveBiomass !=null){
         map.put("IniBGLiveBiomass", IniBGLiveBiomass);     
     }
     else {
       map.put("IniBGLiveBiomass", "0");     
     }
     String IniDWB = request.getParameter("IniDWB");
     if( IniDWB !=null){
         map.put("IniDWB", IniDWB);     
     }
     else {
       map.put("IniDWB", "0");     
     }
     String IniSWB = request.getParameter("IniSWB");
     if( IniSWB !=null){
         map.put("IniSWB", IniSWB);     
     }
     else {
       map.put("IniSWB", "0");     
     }
     
     

     wx.WriteDataSelection(taskXmlPath, map);
            
    %>
  </body>
</html>
