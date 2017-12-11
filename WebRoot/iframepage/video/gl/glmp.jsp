<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'glxq.jsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
 <script type="text/javascript">
	 function selser(){
	window.location.reload();
		function getCookie(name){
	    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	    if(arr != null){
		
		 	return unescape(arr[2]);
		}else{
			return null;
		}
	 		
	}
		var coid=getCookie("sid");
		

		 var curWwwPath=window.document.location.href;
		 var pathName=window.document.location.pathname;
		 var pos=curWwwPath.indexOf(pathName);
		 var localhostPaht=curWwwPath.substring(0,pos);
		 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		 var path=localhostPaht+projectName;
		 window.location.href=''+path+'/selvideomp?id='+coid+'';
		 
		
	 }
	
	
	
	</script>
  </head>
  
  <body onload="selser()">
   
  </body>
</html>
