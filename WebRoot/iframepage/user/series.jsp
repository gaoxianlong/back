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

<div style="color:#F00">播放记录</div>
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
							
							<th>题目</th>
							<th>图片</th>
							<th>集数</th>
							<th>时间</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${playrecord }" var="bs">
							<tr>
								<td>
									${bs.title }
								</td>
								<td>
									<img src="http://www.shoutike.com/STK/cover/${bs.picURL }" style="height: 60px;width:100px;" />	
								</td>
							 </tr>
						</c:forEach>
					</tbody>

				</table>
				
			<div class="pager">
 <input type="hidden" id="bring" value="${info.pageNum }"/>
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="javascript:;" value="1" onclick="xxvideo(this)" data="${idss }">首页</a></li>

							<c:if test="${info.hasPreviousPage }">
								<li><a href="javascript:;"
									aria-label="Previous" value="${info.pageNum-1 }" onclick="xxvideo(this)" data="${idss }"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>



							<c:forEach items="${info.navigatepageNums }" var="page_Num">
								<c:if test="${page_Num == info.pageNum }">
									<li class="active"><a
										href="javascript:;" value="${page_Num }" onclick="xxvideo(this)" data="${idss }">${page_Num }</a></li>
								</c:if>

								<c:if test="${page_Num != info.pageNum }">
									<li><a href="javascript:;" value="${page_Num }" onclick="xxvideo(this)" data="${idss }">${page_Num }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${info.hasNextPage }">
								<li><a href="javascript:;"
									aria-label="Next" value="${info.pageNum+1 }" onclick="xxvideo(this)" data="${idss }"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>

<!--  backml?id=189&page=${info.pages }-->
							<li><a href="javascript:;" value="${info.pages }" onclick="xxvideo(this)" data="${idss }">末页</a></li>




						</ul>
					</nav>
				</div>
				
				


			</div>
		</div>
	</div>
	
	</div>


	
</body>
</html>

<script>
var curWwwPath=window.document.location.href;
var pathName=window.document.location.pathname;
var pos=curWwwPath.indexOf(pathName);
var localhostPaht=curWwwPath.substring(0,pos);
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

var path=localhostPaht+projectName;

        function xxvideo(obj) {
            var page=$(obj).attr("value");
            var id=$(obj).attr("data");
          //alert(page);
          // alert(id);
          window.location.href='<%=path%>/playrecord?id='+id+'&page='+page;
		
	}
	
	
    
</script>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/iframepage/public.js"></script>
