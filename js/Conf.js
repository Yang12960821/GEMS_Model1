function EcoRegionSetting(){
	
	 var EcoRegionValue = $("#Ecoregion").val();
	 
	     if(EcoRegionValue=="0"){
			
			 $("#GridSizeX").val("1846");
			 $("#GridSizeY").val("1161");
			 $("#StartingCoordinateX").val("-2355078");
			 $("#StartingCoordinateY").val("3172168");
			 $("#WindowEndX").val("1845");
			 $("#WindowEndY").val("1160");
			  $("#BasePixelSize").val("2500");
			 
			 }
		 else if (EcoRegionValue=="1"){

			 $("#GridSizeX").val("0");
			 $("#GridSizeY").val("0");
			 $("#StartingCoordinateX").val("0");
			 $("#StartingCoordinateY").val("0");
			 $("#WindowEndX").val("0");
			 $("#WindowEndY").val("0");
			  $("#BasePixelSize").val("0");
			 }
	}

function  ScaleChange(){

	 var RowScale = $("#RowScale").val();
	
	 
     if(RowScale=="1"){
    
		 $("#ColScale").val("1");
		 		 
		 }
	 else if (RowScale=="10"){
		 
		 $("#ColScale").val("10");
		 
		 }
	 else if (RowScale=="20"){
		 
		 $("#ColScale").val("20");
		 
		 }
	 else if (RowScale=="50"){
		 
		 $("#ColScale").val("50");
		 
		 }
	 else if (RowScale=="100"){
		 
		 $("#ColScale").val("100");
		 
		 }
	
}
function divControl(){
	  allVaria ='';

	 $("#AddVria"). toggle();
}
var  allVaria ="";  //用于记录所有变量的字符串
function  AddRow(){

	
	 var VarName = $("#VarName").val();
	 allVaria+=VarName;
	 allVaria+="!";
	 var LongName = $("#LongName").val();
	 allVaria+=LongName;
	 allVaria+="!";
	 var Units = $("#Units").val();
	 allVaria+=Units;
	 allVaria+="!";
	 var Title = $("#Title").val();
	 allVaria+=Title;
	 allVaria+="!";
	 allVaria+="|";
	 $("#AddedValues").val(allVaria);
	 
	
	 var tb = document.getElementById("datatable");
	 var rnum = tb.rows.length+1;  

	 var row = tb.insertRow();  

	 var cell = row.insertCell();  
	 cell.innerText =VarName ;  
	 var cell = row.insertCell();  
	 cell.innerText =LongName ;  
	 var cell = row.insertCell();  
	 cell.innerText =Units ;  
	 var cell = row.insertCell();  
	 cell.innerText =Title ;  
	// cell = row.insertCell();  
	// cell.innerHTML = "<input   type='button' value='DELETE'  onclick='DeleteRow()'/>";  
	 $("#VarName").val(""); 
	 $("#LongName").val(""); 
	 $("#Units").val(""); 
	 $("#Title").val(""); 
	 
	  $("#datatable tr:gt(0)").hover(function() { 
          $(this).children("td").addClass("hover"); 
          }, function() { 
        $(this).children("td").removeClass("hover"); 
    }); 
}
function RunTask(r) {  
	var i=r.parentNode.parentNode.rowIndex;
    var mytb = document.getElementById("myToRunTasks");
		var  taskID = mytb.rows[i].cells[0];
//	alert(taskID.innerHTML);
	var  taskUser = mytb.rows[i].cells[1];;
	var  taskTtartTime =mytb.rows[i].cells[2];;
	 var tb = document.getElementById("allRuningTasks");
	 var rnum = tb.rows.length+1;  

	 var row = tb.insertRow();  

	 var cell = row.insertCell();  
	 cell.innerText =taskID.innerHTML ;  
	 var cell = row.insertCell();  
	 cell.innerText =taskUser.innerHTML ;  
	 var cell = row.insertCell();  
	 cell.innerText =taskTtartTime.innerHTML ;  
		document.getElementById('myToRunTasks').deleteRow(i);
 }  

	  
	function DeleteRow(r) {  
		var i=r.parentNode.parentNode.rowIndex;
		document.getElementById('myToRunTasks').deleteRow(i);

	 }  

	
	