<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>列表</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta mame="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="shoutike" />
<meta name="description" content="shoutike" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/content/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/public.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/video.css" />
</head>
<body>

<div style="color:#F00">代言人中心</div>
	<div style="padding: 5px 5px 0 5px;width: 100%;height: 100%;">
		<div class="first-head">
			<!--<a href="javascript:;" id="add"><span class="glyphicon glyphicon-plus"  style="color: green;"></span> 新增</a>-->
			
			<div>
				<form action="seluserlik" method="post">

					<input type="text" name="name" /> <input type="submit" value="搜索" />
				</form>
			</div>
			
		</div>
		<div class="first-main">
			<div class="first-body">
				<table width="100%" cellspacing="" cellpadding="" border="0"
					id="tab">
					<thead>
						<tr>
							<th>名称</th>
							<th>openid</th>
						</tr>
					</thead>
					<tbody>
						
							<tr>
								<td>${user.nickName }</td>
								<td>${wxopenid }</td>
							</tr>
					
					<tr>
					
					</tr>
					</tbody>

				</table>
				
			
				
				


			</div>
		</div>
	</div>
	
	</div>


	
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=path%>/js/iframepage/public.js"></script>
<script>
	//调用父页面的 切换导航事件
	//parent.tabspage($('#nav-ol .lis', window.parent.document), $(
	//		'#tabs-wrap .panel-page', window.parent.document));
	//parent.navclose($('#nav-ol .lis', window.parent.document), $(
		//	'#tabs-wrap .panel-page', window.parent.document));
</script>