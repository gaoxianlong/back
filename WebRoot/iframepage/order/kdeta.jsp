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

<link rel="stylesheet" type="text/css" href="<%=path%>/content/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/content/icon.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/content/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/public.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/video.css" />
<link rel="stylesheet" href="<%=path%>/content/bootstrap.min.css" />
<script>
	function sou() {

		var name = $("#nname").val();

		$.ajax({
			url : "selbackcodelike",
			type : "POST",

			data : {
				"name" : name,

			},
			success : function(msg) {

			},
			error : function(res) {
				// alert(res.responseText);
				alert("发生错误。");
			}
		});

	}
</script>

</head>
<body>
	<div style="padding: 5px 5px 0 5px;width: 100%;height: 100%;">
		<div class="first-head">
		</div>
		<div class="first-main">
			<div class="first-body">
				<table width="100%" cellspacing="" cellpadding="" border="0"
					id="tab">
					<thead>
						<tr>
							<th>课程图片</th>
							<th>课程标题</th>
							<th>昵称</th>
							<th>金额</th>
							<th>订单号</th>
							<th>开始时间</th>
							<th>失效时间</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${korder }" var="bs">
							<tr>
								<td style="display:none;">${bs.seriesID }</td>
								<td></td>
								<td></td>
								<td>${bs.uid.nickName }</td>
								<td>${bs.price }</td>
								<td>${bs.outtradeno }</td>
								<td>
									<fmt:formatDate value="${bs.createTime }"
										pattern="yyyy-MM-dd" />
								</td>
								<td>
									<fmt:formatDate value="${bs.overtime }"
										pattern="yyyy-MM-dd" />
								</td>
								

							</tr>
						</c:forEach>




					</tbody>
				</table>
			<div>
<a style="float:left;font-size:20px; color:#f00;">总计：  ${info.getTotal() } 个课程订单</a><br/>


</div>
				
					<div class="pager">
 <input type="hidden" id="bring" value="${info.pageNum }"/>
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="javascript:;" value="1" onclick="viporder(this)">首页</a></li>

							<c:if test="${info.hasPreviousPage }">
								<li><a href="javascript:;"
									aria-label="Previous" value="${info.pageNum-1 }" onclick="viporder(this)"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>



							<c:forEach items="${info.navigatepageNums }" var="page_Num">
								<c:if test="${page_Num == info.pageNum }">
									<li class="active"><a
										href="javascript:;" value="${page_Num }" onclick="viporder(this)">${page_Num }</a></li>
								</c:if>

								<c:if test="${page_Num != info.pageNum }">
									<li><a href="javascript:;" value="${page_Num }" onclick="viporder(this)">${page_Num }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${info.hasNextPage }">
								<li><a href="javascript:;"
									aria-label="Next" value="${info.pageNum+1 }" onclick="viporder(this)"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>

<!--  backml?id=189&page=${info.pages }-->
							<li><a href="javascript:;" value="${info.pages }" onclick="viporder(this)">末页</a></li>

						</ul>
					</nav>
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

        function viporder(obj) {
            var page=$(obj).attr("value");
          //alert(page);
          window.location.href='<%=path%>/orderk?page='+page;
		
	}
	
$("#tab tbody tr").each(function(){
	//$(this).eq(6).html();
	
	var str = $(this).children().eq(0).html();
	var imgs = $(this).children().eq(2);
	var tit = $(this).children().eq(1);
	console.log(str);
	
	$.ajax({
		url : 'jsonSeries',
		type : "POST",

		data : {
			"id" : str,
		},
		success : function(msg) {
			tit.html(msg.title);
			imgs.html('<img src="http://www.shoutike.com/STK/cover/'+msg.picURL+'" style="height: 60px;width:100px;" />');
			
			//imgs.html(msg.picURL);
			
			
		},
		error : function(res) {
			// alert(res.responseText);
			alert("发生错误。");
		}
	});
	
	
});       
        
</script>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/iframepage/publicb.js"></script>

