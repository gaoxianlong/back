<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ur.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	 function seluser() {
		 
		 var curWwwPath=window.document.location.href;
		 var pathName=window.document.location.pathname;
		 var pos=curWwwPath.indexOf(pathName);
		 var localhostPaht=curWwwPath.substring(0,pos);
		 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		 var path=localhostPaht+projectName;
		// window.location.href=''+path+'/selbackuser';
		 
		 
	 }
	
	
	
	</script>
  </head>
  
  <body>
  <center>
  <div style="padding-top:130px;">
  			<div style="color:#F00">
  				输入用户的昵称或者手机号
 			</div>
   			<div style="padding-top:10px;">
				<form action="seluserlik" method="post">

					<input type="text" name="name"  style="width:200px;height:30px"/> 
					<br/><br/>
					<input type="submit" value="搜索" style="width:100px;height:50px"/>
				</form>
			</div>
 </div>
			</center>
  </body>
</html>
