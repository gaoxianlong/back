<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script>
	function addTab(url) {
		var id = $('.active').children().eq(2).html();
		var title = $('.active').children().eq(1).html();
		
		
		
		
		function setCookie(name,value,expire){
		
		  var exp = new Date();
		  exp.setTime(exp.getTime()+expire*1000);
		  document.cookie = name + '=' + escape(value) + ";expires=" + exp.toGMTString();
			}
		
		setCookie("code", id, 6);
		var coid=getCookie("code");
	
		
		function getCookie(name){
		    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
		    if(arr != null){
			
			 	return unescape(arr[2]);
			}else{
				return null;
				}
			} 
		 
		var jq = top.jQuery;
		if (!$('tbody tr').hasClass('active')) {
			alert('提示 请选择操作的内容！');
			return false;
		}
		if (jq('#panel-main').tabs('exists', title)) {
			jq('#panel-main').tabs('select', title);
			 refreshTab({tabTitle:title,url:url});  
		}
		else {
          
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:99%;" id="aaa"></iframe>';

			jq('#panel-main').tabs('add', {
				title : title,
				content : content,
				closable : true
				
			});
			
			

		}
		
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
							<th>编号</th>
							<th>昵称</th>
							<th>金额</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${tixian }" var="bs">
							<tr>
								<td>${bs.id }</td>
								<td>${bs.name }</td>
								<td>${bs.money }</td>
								<td><a href="<%=path%>/wxopenid?id=${bs.uid }">查看openid详情</a></td>
								
								

							</tr>
						</c:forEach>




					</tbody>
				</table>
			<div>
<a style="float:left;font-size:20px; color:#f00;">总计：  ${info.getTotal() } 个提现订单</a><br/>


</div>
				
					<div class="pager">

						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li><a href="seltixian?page=1">首页</a></li>

								<c:if test="${info.hasPreviousPage }">
									<li><a href="seltixian?page=${info.pageNum-1 }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>



								<c:forEach items="${info.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == info.pageNum }">
										<li class="active"><a
											href="seltixian?page=${page_Num }">${page_Num }</a></li>
									</c:if>

									<c:if test="${page_Num != info.pageNum }">
										<li><a href="seltixian?page=${page_Num }">${page_Num }</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${info.hasNextPage }">
									<li><a href="seltixian?page=${info.pageNum+1 }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>


								<li><a href="seltixian?page=${info.pages }">末页</a></li>
							</ul>
						</nav>
					</div>

				
			</div>
		</div>
	</div>
	
	
	

	<!--未选中操作数据时的 拦截信息-->
	<!-- Small modal -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">请选择要操作的记录</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/iframepage/publicb.js"></script>

