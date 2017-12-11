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
	<div style="padding: 5px 5px 0 5px;width: 100%;height: 100%;">
		<div class="first-head">
			<!--<a href="javascript:;" id="add"><span class="glyphicon glyphicon-plus"  style="color: green;"></span> 新增</a>-->
			
			
			
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

							</tr>
						</c:forEach>

					</tbody>

				</table>
				
				<div style="float:right;font-size:20px; color:#f00;">总计：${info.getTotal() }位用户</div><br/>
				
				<div class="pager">

					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="selbackuser?page=1">首页</a></li>

							<c:if test="${info.hasPreviousPage }">
								<li><a href="selbackuser?page=${info.pageNum-1 }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>



							<c:forEach items="${info.navigatepageNums }" var="page_Num">
								<c:if test="${page_Num == info.pageNum }">
									<li class="active"><a href="selbackuser?page=${page_Num }">${page_Num }</a></li>
								</c:if>

								<c:if test="${page_Num != info.pageNum }">
									<li><a href="selbackuser?page=${page_Num }">${page_Num }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${info.hasNextPage }">
								<li><a href="selbackuser?page=${info.pageNum+1 }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>


							<li><a href="selbackuser?page=${info.pages }">末页</a></li>




						</ul>
					</nav>
				</div>


			</div>
		</div>
	</div>
	<!-- 收藏Modal -->
	<div class="modal fade" id="myscModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-list-alt" style="color: #333;"></span>
						查看收藏数
					</h4>
				</div>
				<div class="modal-body" style="padding: 2px;height: 400px;">
					<div class="panel-wrap">
						<table width="100%" cellspacing="" cellpadding="" border="0"
							id="tab">
							<thead>
								<tr>
									<th><div>编号</div></th>
									<th><div>分类</div></th>
									<th><div>视频/系列</div></th>
									<th><div>标题</div></th>
									<th><div>收藏时间</div></th>
									<th><div></div></th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 购买Modal -->
	<div class="modal fade" id="mygmModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<span class="glyphicon glyphicon-list-alt" style="color: #333;"></span>
						查看购买数
					</h4>
				</div>
				<div class="modal-body" style="padding: 2px;height: 400px;">
					<div class="panel-wrap">
						<table width="100%" cellspacing="" cellpadding="" border="0"
							id="tab">
							<thead>
								<tr>
									<th><div>编号</div></th>
									<th><div>订单号</div></th>
									<th><div>分类</div></th>
									<th><div>视频/系列</div></th>
									<th><div>标题</div></th>
									<th><div>金额</div></th>
									<th><div>实付金额</div></th>
									<th><div>付款时间</div></th>
									<th><div></div></th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 播放Modal -->
	<div class="modal fade" id="mybfModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<span class="glyphicon glyphicon-list-alt" style="color: #333;"></span>
						查看播放数
					</h4>
				</div>
				<div class="modal-body" style="padding: 2px;height: 400px;">
					<div class="panel-wrap">
						<table width="100%" cellspacing="" cellpadding="" border="0"
							id="tab">
							<thead>
								<tr>
									<th><div>编号</div></th>
									<th><div>分类</div></th>
									<th><div>系列标题</div></th>
									<th><div>标题</div></th>
									<th><div>播放时间</div></th>
									<th><div></div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><div>1</div></td>
									<td><div>小学-四年级-数学</div></td>
									<td><div>四年级数学-课本精讲</div></td>
									<td><div>第一集 大数的认识</div></td>
									<td><div>2017-09-18 14:20:33</div></td>
									<td><div></div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 邀请记录Modal -->
	<div class="modal fade" id="myyqModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<span class="glyphicon glyphicon-list-alt" style="color: #333;"></span>
						查看邀请记录
					</h4>
				</div>
				<div class="modal-body" style="padding: 2px;height: 400px;">
					<div class="panel-wrap">
						<table width="100%" cellspacing="" cellpadding="" border="0"
							id="tab">
							<thead>
								<tr>
									<th><div>编号</div></th>
									<th><div>用户昵称</div></th>
									<th><div>变更前邀请人</div></th>
									<th><div>变更后邀请人</div></th>
									<th><div>说明</div></th>
									<th><div>操作人</div></th>
									<th><div>操作时间</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><div>1</div></td>
									<td><div>六条眉毛</div></td>
									<td><div></div></td>
									<td><div>张三</div></td>
									<td><div>产生交易</div></td>
									<td><div>手提课</div></td>
									<td><div>2017-09-18 14:20:33</div></td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 变更邀请人Modal -->
	<div class="modal fade" id="mybgModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<span class="glyphicon glyphicon-pencil" style="color: #666;"></span>
						变更邀请人
					</h4>
				</div>
				<div class="modal-body">
					<div class="panel-wrap">
						<div class="lis kcfl">
							<span>用户昵称：</span> <b>兰花</b>
						</div>
						<div class="lis">
							<span>当前邀请人：</span> <b>sunny</b>
						</div>
						<div class="lis">
							<span>变更邀请人：</span>
							<div>
								<select name="" style="width: 190px;">
									<option value=""></option>
									<option value="">手提课</option>
									<option value="">手提课</option>
									<option value=""></option>
								</select> <span>请在查询后选择人员，否则不会产生效果。</span>
							</div>
						</div>
						<div class="lis">
							<span>变更原因：</span>
							<textarea name="" rows="" cols=""></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

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

<script type="text/javascript" src="<%=path%>/js/iframepage/public.js"></script>
<script>
	//调用父页面的 切换导航事件
	//parent.tabspage($('#nav-ol .lis', window.parent.document), $(
	//		'#tabs-wrap .panel-page', window.parent.document));
	//parent.navclose($('#nav-ol .lis', window.parent.document), $(
		//	'#tabs-wrap .panel-page', window.parent.document));
</script>