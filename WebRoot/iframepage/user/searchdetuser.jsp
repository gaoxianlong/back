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
<div style="color:#F00">精准搜索</div>
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
							<th>编号</th>
							<th>昵称</th>
							<th>手机</th>

							<th>所在区域</th>
							<th>性别</th>
							<th>所在学校</th>
							<th>所在年级</th>


							<th>注册时间</th>
							<th>代言人详情</th>
							<th>播放详情</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${user }" var="bs">
							<tr>
								<td>${bs.ID }</td>
								<td>${bs.nickName }</td>
								<td>${bs.telephone }</td>

								<td>${bs.city1 }${bs.city2 }${bs.city3 }</td>
								<td>${bs.sex }</td>
								<td>${bs.school }</td>
								<td>${bs.education }${bs.grade }</td>


								<td><fmt:formatDate value="${bs.registertime }"
										pattern="yyyy-MM-dd" /></td>
								<td><a href="<%=path%>/seldaiyan?id=${bs.ID }">查看代言人</a></td>
								<td><a href="<%=path%>/record?id=${bs.ID }">查看播放记录</a></td>
							</tr>
							
						</c:forEach>

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