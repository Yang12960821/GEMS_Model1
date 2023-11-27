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
<html >
	<head>
		<title></title>
		<meta charset="utf-8" http-equiv="refresh" content="100">
		<!-- <style>
      .processbar {
　　height: 30px;　　　　　　　  // 进度条高度
　　width: 30%;　　　　　　　　// 进度条宽度
　　border: 4px solid gold;        // 进度条边框
　　background-color: red;　　  // 整个进度条背景色
　　color: black;　　　　　　　　// 已经完成的进度 IE高版本(10,11)
}

progress::-webkit-progress-bar {
　　background-color: red;      // 整个进度条的背景 谷歌
}

progress::-webkit-progress-value {
　　background-color: black;   // 已经完成的进度 谷歌
}

progress::-moz-progress-bar {
　　background-color: black;  //  已经完成的进度 火狐
} 
       </style> -->
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
		<script type="text/javascript" src="js/jquery.js" ></script>
		<script type="text/javascript" src="js/jquery.dataTables.js" ></script>
		<script type="text/javascript" src="js/cufon-yui.js"></script>
		<script type="text/javascript" src="js/cufon-replace.js"></script>  
		<script type="text/javascript" src="js/Vegur_300.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_700.font.js"></script>
		<script type="text/javascript" src="js/PT_Sans_400.font.js"></script>
		<script type="text/javascript" src="js/atooltip.jquery.js"></script>
        <script type="text/javascript" src="js/fenye.js"></script>
		<%--<script type="text/javascript" src="js/Tab.js"></script>--%>
		<script type="text/javascript" src="js/Conf.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript">

  function changeTaskState(tid){
	    console.log("tid = ", tid);
		var query = 'JobStatusChange.jsp';
		var data={tid:tid};
		$.ajax({
			url:query,
			data:data,
			type:'post',
			xhrFields: {
				 withCredentials: true
			},
			headers:{ 
				'Content-Type':'application/x-www-form-urlencoded;charset=utf8',
			},
			async: true,
			cache: false,
			crossDomain: true,
			success:function(data){
				data = data.trim();
			    console.log("res data = ", data);
				if(data.indexOf("=3=")>-1){
					document.getElementById('TaskStatus'+tid).innerHTML = "Start";
				}else if(data.indexOf("=0=")>-1){
					document.getElementById('TaskStatus'+tid).innerHTML = "Pause";
				}else{
					alert('执行失败');
				}
			},
			error:function(e){
				alert('执行错误');
			}
		});
  }
 
$(document).ready( function () {

$('#ToRun').DataTable( {
        "ordering":  false,
        "bAutoWidth": false,
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

$('#Running').DataTable( {
     " ordering":  false,
     "searching": false,
      "paging": false,
      "bAutoWidth": false,
      "bInfo": false,
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

$('#Finished').DataTable( {
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

  function createMask(){
	  $('#selectFile').val('');
	  $('#myModal').modal('show');//模态框展示
  }

  $(function(){
	  $('#btn_submit').click(function(){
		  var btn = $(this);
		  var selectFile = $('#selectFile');
		  if(!selectFile.val()){
			  alert('请选择文件');
			  return;
		  }
		  var form = $('form').get(0);
		  console.log('form:'+form)
		  var formData = new FormData(form);
		  formData.append('file',selectFile.get(0).files[0]);

		  $.ajax({     //发送ajax异步请求
			  type:'post',//请求方式post
			  url:'upload',
			  data:formData,
			  cache:false,
			  processData:false,
			  contentType:false,
			  success:function(data){
				  $('#myModal').modal('hide');
				  //alert('data:'+data)
				  data = data.trim();
				  console.log('data='+data)
				  if(data == '0'){
					  alert('上传成功');
				  }else if(data == '1'){
					  alert('文件不存在');
				  }else{
					  alert('未知错误');
				  }
			  },
			  error:function(){
				  alert('上传失败_error');
			  }
		  })
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
                    
                   <!-- <div align="right" ><a href="#" class="button1" onClick="">Logout</a></div>-->
					
				</div>
					<nav>
					<ul id="menu">
						<li ><a href="Home.jsp"><span>Home</span></a></li>
						
						<li><a href="Descrip.jsp"><span>Model Setting Wizard</span></a></li>
						<li class="active"><a href="JobStatus.jsp"><span>Job Status Report</span></a></li>
						<li class="last"><a href="MyFile.jsp"><span>My Profile</span></a></li>
					</ul>
				</nav>
			</header>

  <%
    String toRunTableContent ="";
   String  CompleteTableContent ="";
      String runingTableContent ="";
      String logUser = session.getAttribute("username").toString();
      String password = session.getAttribute("pwd").toString(); 
           if(logUser!=null){
           
           try{
           
             SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
             QueueManage qm = new QueueManage();
//             String SQLUrl = "jdbc:mysql://localhost:3306/model";
             String SQLUrl = "jdbc:mysql://10.181.6.69/model";
		     String myDriver = "com.mysql.jdbc.Driver";
	
		     Class.forName(myDriver).newInstance();//指定连接类型

//	            java.sql.Connection  sqlConn = DriverManager.getConnection(SQLUrl, "root", "123456");//获取连接
	            java.sql.Connection  sqlConn = DriverManager.getConnection(SQLUrl, "root", "a820517");//获取连接
	            Statement   stmt = sqlConn.createStatement();
	                String  querySql = "select * from tasks  order by  CreateTime ASC";
	                ResultSet  rs =  stmt.executeQuery(querySql);
	                while (rs.next()){
	                         String  status = rs.getString(1);
	                         //0-torun 1- running  2 -complete
	                       if (status.equals("0")||status.equals("3")){
	                             String  taskID =  rs.getString(2);
	                             String  user = rs.getString(3);
	                               String  createTime  = rs.getString(4);
	                                  String  xmlPath  = rs.getString(8);
								   int index = xmlPath.lastIndexOf("/");
								   String fileName = xmlPath.substring(index);
//	                             toRunTableContent+= "<tr><td align='center'>"+ taskID+"</td><td align='center'>"+user+"</td><td align='center'>"
//	                                  			+createTime+ "</td><td align='center'><a  href='"+xmlPath
//	                                  			+"'>Download</a></td><td  align='center'><span style='cursor:pointer;' id='TaskStatus"+taskID+"' onclick='changeTaskState(\""
//	                                  			+taskID+"\");'>"+(status.equals("0")?"Pause":"Start")+"</span></td><td></td><td></td></tr>";

							     /*toRunTableContent+= "<tr><td align='center'>"+ taskID+"</td><td align='center'>"+user+"</td><td align='center'>"
									   +createTime+ "</td><td align='center'><a href='download?xmlPath=" +
									    fileName+"'>Download</a></td><td align='center'><a href='javascript:void(0);' onclick='createMask()'>Upload</a></td><td  align='center'><span style='cursor:pointer;' id='TaskStatus"+taskID+"' onclick='changeTaskState(\""
									   +taskID+"\");'>"+(status.equals("0")?"Pause":"Start")+"</span></td><td></td><td></td></tr>";*/
							  toRunTableContent+= "<tr><td align='center'>"+ taskID+"</td><td align='center'>"+user+"</td><td align='center'>"
									   +createTime+ "</td><td align='center'><a href='download?xmlPath=" +
									   fileName+"'>Download</a></td><td align='center'><a href='javascript:void(0);' onclick='createMask()'>Upload</a></td><td  align='center'><span style='cursor:pointer;' id='TaskStatus"+taskID+"' onclick='changeTaskState(\""
									   +taskID+"\");'>"+(status.equals("0")?"Pause":"Start")+"</span></td><td align='center'><a href='DeleteServlet?id="+taskID+"'>Cancel</a></td></tr>";
	                       }

	                      else if (status.equals("1")){
	                             String  taskID =  rs.getString(2);
	                             String  user = rs.getString(3);
	                             String  submitTime  = rs.getString(4);
	                             long    startTimelong = rs.getLong(5);
	                                 String  xmlPath  = rs.getString(8);
	                              String   startTime  =sdf.format(startTimelong);                            
	                             
	                              String  estEndTime  = "";
	                              String  estRunTime  = "";
	                             String   progress =qm.readProgress(user);
	                           
	                             //计算时间
	                       
	                             
	                             String  proValue="";
	                              int pro =1;
	                              if(progress.isEmpty()|| progress==null){
	                                    progress="Preparing....";	
	                                     estEndTime ="Computing...";
	                                       estRunTime ="Computing...";                           
	                              } 
	                              else if (progress.startsWith("100")){
	                                   pro=100;
	                                       estEndTime ="Reached";
	                                       estRunTime ="Reached";   
	                                   progress = "Compressing...";	                              
	                              }   
	                              else{
	                                proValue = progress;
	                        
	                                  
	                                   progress+="%";
	                                   //运行时间
	                                  
	                                   //去除字符串中的回车换行空格
	                                  
	                                   if(proValue.length() ==2){
	                                         pro = Integer.parseInt(progress.substring(0,1));
	                                   }
	                                   else if (proValue.length() ==3){
	                                       pro = Integer.parseInt(progress.substring(0,2));
	                                   }
	                                     long   rightnow = System.currentTimeMillis();
	                                     long   temp =(rightnow -startTimelong)*100/pro;
	                                        long temp2 = temp % (1000 * 3600);
								            long hours = temp / 1000 / 3600;   
								            long mins = temp2 / 1000 / 60;    
								            long temp3 = temp2% (1000*60);
								           long seconds = temp3/ 1000;   
						                   estRunTime = hours + "Hr-"+ mins + "Min-"+seconds+"Sec";
	                                      //估计结束时间
	                                      
	                                      Calendar rightNow = Calendar.getInstance();
                                  rightNow.setTimeInMillis(startTimelong);
                                 
                                   rightNow.add(Calendar.HOUR_OF_DAY,(int)hours);
                                   rightNow.add(Calendar.MINUTE,(int)mins);
                                      rightNow.add(Calendar.SECOND,(int)seconds);
                                 
                               estEndTime = sdf.format(rightNow.getTime());           
                                                      
	                              }
	                                  
	                                   runingTableContent+= "<tr><td align='center' ><a href ='"+xmlPath+"'>"+ taskID+"</a></td><td align='center'>"+user+"</td><td align='center'>"+submitTime+"</td.><td align='center'>"+startTime+ "</td><td align='center'>"+estRunTime+"</td><td align='center'>"+ estEndTime+"</td><td ><progress value='"+pro+"' max='100'  class='processbar'></progress>"+progress+"</td></tr>";
	                                  
	                           //  runingTableContent+= "<tr><td>"+ taskID+"</td><td>"+user+"</td><td>"+submitTime+"</td.><td>"+startTime+ "</td><td>"+estRunTime+"</td><td >"+ estEndTime+"</td><td >"+progress+ "</td></tr>";
	                       }
	                          else if (status.equals("2")){
	                             String  taskID =  rs.getString(2);
	                             String  user = rs.getString(3);
	                                String  submitTime  = rs.getString(4);
	                                  long    startTimelong = rs.getLong(5);
	                                       String  xmlPath  = rs.getString(8);
	                               String  startTime  = sdf.format(startTimelong);
	                        
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
	                              
	                                  
	                                  String  resultPath  =rs.getString(9);
	                             CompleteTableContent+= "<tr><td align='center' ><a href ='"+xmlPath+"'>"+ taskID+"</a></td><td align='center'>"+user+"</td><td align='center'>"+submitTime+"</td><td align='center'>"+startTime+ "</td><td align='center'>"+ endTime + "</td><td align='center'>"+timeUsed+"</td><td align='center'> <a href ='"+ resultPath+"'>DownLoad</a></td></tr>";
	                       }
	                
	                
	                }
	            
	            if(!sqlConn.isClosed()){
	            sqlConn.close();
	            
	            }
	            
              }
              catch (Exception e){
            e.printStackTrace();
              }
              
              
     }

     else{
            response.sendRedirect("Logout.jsp");
     }

     %>
     
<article style="height:1800px">

<table width="100%" border="1" class="JobTable" >
<tr><td><p></p></td></tr>
<tr  bgcolor="#0000FF"><td align="center"><a href=""><img src="images/qingqiu.jpg"  width="100%" /></a></td></tr>
<tr><td   align="left">

<table width="100%" border="1" class="JobTable"  id="ToRun">
<thead>
  <tr >
    <th align="center">Job ID</th>
    <th align="center">User</th>
    <th align="center">Submit Time</th>
     <th align="center">Download</th>
    <th align="center">Upload</th>
    <th align="center">Operation</th>
    <th align="center">Cancel</th>
  </tr></thead>
<tbody>
<%= toRunTableContent %>
   
</tbody>
</table></td></tr>
<tr bgcolor="#FF0000"><td align="center"><a href=""><img src="images/yunxing.jpg"  width="100%"></a></td></tr>
<tr><td align="left"> 
<table width="100%" border="1" class="JobTable"  id="Running">
<thead>
  <tr  >
    <th align="center">Job ID</th>
    <th align="center">User</th>
    <th align="center">Submit Time</th>
        <th align="center">Start Time</th>
    <th align="center">Est Time Used</th>
       <th align="center">Est End Time </th>
    <th align="center">Progress</th>

  </tr></thead>
  <tbody>
<%=runingTableContent %>
</tbody>
</table></td></tr>
<tr><td align="center"><a href=""><img src="images/wancheng.jpg"  width="100%" ></a></td></tr>
<tr><td align="left">
 <table width="100%" border="1" class="JobTable"  id="Finished">
<thead>
  <tr  >
    <th align="center">Job ID</th>
    <th align="center">User</th>
    <th align="center">Submit Time</th>
     <th align="center">Start Time</th>
    <th align="center">End Time</th>
       <th align="center">Time Used</th>
     <th align="center">DownLoad Result</th>
  </tr></thead><tbody>
<%=CompleteTableContent %>
</tbody></table>
  </td></tr>
</table>

			</article>

			<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">文件上传</h4>
						</div>
						<div class="modal-body">
							<!-- <p>One fine body&hellip;</p>-->
							<form method="post"  action="upload" enctype="multipart/form-data"><%--请求编码方式，用于文件上传时使用--%>
								<div class="form-group">
									<label for="selectFile">上传文件</label>
									<input type="file" id="selectFile">
								</div>
								<button type="button" id="btn_submit" class="btn btn-default">上传</button>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<!--<button type="button" class="btn btn-primary">Save changes</button>-->
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->

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
