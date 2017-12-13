<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jscript/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/content/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/public.css" />

<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/video.css" />
<script>
	function addTab(url) {
		var id = $('.active').children().eq(0).children('div').html();
		var titlexin = $('.active').children().eq(2).children('div').html();
		
		
		
		
		function setCookie(name,value,expire){
		
		  var exp = new Date();
		  exp.setTime(exp.getTime()+expire*1000);
		  document.cookie = name + '=' + escape(value) + ";expires=" + exp.toGMTString();
			}
		
		setCookie("sid", id, 6);
		
		
		
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
	
		 
		 
		var jq = top.jQuery;
		if (!$('tbody tr').hasClass('active')) {
			alert('提示 请选择操作的内容！');
			return false;
		}
		//if (jq('#panel-main').tabs('exists', titlexin)) {
		//	jq('#panel-main').tabs('select', titlexin);
			 //refreshTab({tabTitle:title,url:url});  
		//}
		else {
          
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:99%;" id="aaa"></iframe>';

			jq('#panel-main').tabs('add', {
				title : titlexin,
				content : content,
				closable : true
				
			});
			
			// window.location.href=''+path+'/selvideo?id='+coid+'';
			//$('iframe').attr('src',$('iframe').attr('src'));

		}
		
	}
</script>
</head>
<body>
	<div style="padding: 5px 5px 0 5px;width: 100%;height: 100%;">
		<div class="first-head">
			<!--<a href="javascript:;" id="add"><span class="glyphicon glyphicon-plus"  style="color: green;"></span> 新增</a>-->
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myaddModal">
				<span class="glyphicon glyphicon-plus" style="color: green;"></span>
				新增
			</button>
			<div class="bar"></div>
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#mytxtModal">
				<span class="glyphicon glyphicon-pencil" style="color: #666;"></span>
				编辑
			</button>
			
			<div class="bar"></div>
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#mydelModal">
				<span class="glyphicon glyphicon-remove" style="color: #ff0000;"></span>
				删除
			</button>
			<div class="bar"></div>

			<a href="javascript:;" class="gl-btn easyui-linkbutton"
				onclick="addTab('iframepage/video/gl/glxx.jsp')" ><span
				class="glyphicon glyphicon-plus" style="color: green;"></span> 管理视频
			</a>

			
			
			
		</div>
		<div class="first-main">
			<div class="first-body">
				<table width="100%" cellspacing="" cellpadding="" border="0"
					id="tab">
					<thead>
						<tr>
							<th><div>编号</div></th>
							<th><div>分类</div></th>
							<th><div>标题</div></th>
							<th><div>图片地址</div></th>
							<th><div>描述</div></th>

							<th><div>视频数</div></th>
							<th><div>收藏数</div></th>
							<th><div>播放数</div></th>
							<th><div>购买数</div></th>


							<th><div>是否收费</div></th>

							<th><div>价格</div></th>
							<th><div>是否扶贫</div></th>
							<th><div>是否公开</div></th>

							<th><div>发布时间</div></th>
							<th><div></div></th>
							<th><div></div></th>
							<th><div></div></th>
							<th><div>课程介绍</div></th>

						</tr>
					</thead>
					<tbody>


						<c:forEach items="${series }" var="bs">
							<tr style="height: 65px">
								<td><div>${bs.ID }</div></td>
								<td><div>${bs.ta }${bs.tb }${bs.tc }</div></td>
								<td><div>${bs.title }</div></td>
								<td>
									<div>
										<img src="http://www.shoutike.com/STK/cover/${bs.picURL }"
											style="height: 60px;width:100px;" />
									</div>
								</td>
								<td><div>${bs.remark }</div></td>


								<td><div>0</div></td>
								<td><div>${bs.collection }</div></td>
								<td><div>${bs.clickRate }</div></td>
								<td><div>${bs.pmtsTot }</div></td>

								<c:if test="${bs.isPrice == 0 }">
									<td><div>不收费</div></td>
								</c:if>
								<c:if test="${bs.isPrice == 1 }">
									<td><div>收费</div></td>
								</c:if>

								<td><div>${bs.realPrice }</div></td>


								<c:if test="${bs.fupin == 0 }">
									<td><div>未扶贫</div></td>
								</c:if>
								<c:if test="${bs.fupin == 1 }">
									<td><div>扶贫</div></td>
								</c:if>

								<c:if test="${bs.publi == 0 }">
									<td><div>未公开</div></td>
								</c:if>
								<c:if test="${bs.publi == 1 }">
									<td><div>公开</div></td>
								</c:if>

								<td><div>
										<fmt:formatDate value="${bs.publishTime }"
											pattern="yyyy-MM-dd" />
									</div></td>

								<td><div style="display: none">${bs.isPrice }</div></td>
								<td><div style="display: none">${bs.fupin }</div></td>
								<td><div style="display: none">${bs.publi }</div></td>
								<td>
									<div>
										<img src="http://www.shoutike.com/STK/cover/${bs.thuPicURL }"
											style="height: 60px;width:100px;" />
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pager">
 <input type="hidden" id="bring" value="${info.pageNum }"/>
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="javascript:;" value="1" onclick="xxvideo(this)">首页</a></li>

							<c:if test="${info.hasPreviousPage }">
								<li><a href="javascript:;"
									aria-label="Previous" value="${info.pageNum-1 }" onclick="xxvideo(this)"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>



							<c:forEach items="${info.navigatepageNums }" var="page_Num">
								<c:if test="${page_Num == info.pageNum }">
									<li class="active"><a
										href="javascript:;" value="${page_Num }" onclick="xxvideo(this)">${page_Num }</a></li>
								</c:if>

								<c:if test="${page_Num != info.pageNum }">
									<li><a href="javascript:;" value="${page_Num }" onclick="xxvideo(this)">${page_Num }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${info.hasNextPage }">
								<li><a href="javascript:;"
									aria-label="Next" value="${info.pageNum+1 }" onclick="xxvideo(this)"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>

<!--  backml?id=189&page=${info.pages }-->
							<li><a href="javascript:;" value="${info.pages }" onclick="xxvideo(this)">末页</a></li>




						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<!-- 新增Modal -->
	<div class="modal fade" id="myaddModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-plus" style="color: green;"></span>
						新增
					</h4>
				</div>
				<div class="modal-body">
					<div class="panel-wrap">
						<div class="lis ">
						
								
									<span>分类：</span>
								
								
								<select name="" id="ddl">
						<c:forEach items="${typeb }" var="bs">
							<option   style="font-size: 16px;font-weight: 700;color: royalblue;" 
							
							first="小学"; second="${bs.typeName }"; third=""; firstid="189"; secondid="${bs.ID }"; thirdid="";
							
							>${bs.typeName }</option>
							
							<c:forEach items="${asd }" var="bsd">
							
								<c:if test="${bsd.parentID == bs.ID }">
							 <option first="小学"; second="${bs.typeName }"; third="${bsd.typeName }"; firstid="189"; secondid="${bs.ID }"; thirdid="${bsd.ID }";>
							 <span class="glyphicon glyphicon-list"></span>
							${bs.typeName }${bsd.typeName }
							 </option>
								</c:if>
								
							</c:forEach>
							
							
							</c:forEach>
						</select>
								
						</div>



						<div class="lis title">
							<span>标题：</span><input type="text" name="adTitle" id="adTitle" />
						</div>
						<div class="lis img">
								<!--  
									<div class="imgs01">
										<img src="" />
									</div>
								-->
								<div style="padding-left:60px;">
									<span>封面：</span><input type="text" name="PicURL" id="adPicURL" />
									<div style="padding-left:60px;">
										<input type="file" id="file_upload" /> 
										<input type="button" value="上传图片" id="upload" />
									</div>
								</div>
								<script type="text/javascript">
									$(document)
											.ready(
													function() {
														function ajaxFileUpload() {
															var formData = new FormData();
															formData
																	.append(
																			'file',
																			$("#file_upload")[0].files[0]); //将文件转成二进制形式  
															$
																	.ajax({
																		type : "post",
																		url : "  http://www.shoutike.com/STK/upload",
																		async : false,
																		contentType : false, //这个一定要写  
																		processData : false, //这个也一定要写，不然会报错  
																		data : formData,
																		dataType : 'text', //返回类型，有json，text，HTML。这里并没有jsonp格式，所以别妄想能用jsonp做跨域了。  
																		success : function(
																				data) {

																			$(
																					'#adPicURL')
																					.val(
																							data);
																		},
																		error : function(
																				XMLHttpRequest,
																				textStatus,
																				errorThrown,
																				data) {
																			alert(errorThrown);
																		}
																	});
														}

														$("#upload")
																.click(
																		function() {
																			ajaxFileUpload();
																		});
													});
								</script>
							</div>
						
<!-- 视频介绍图片 -->
							
							<div class="lis img">
								<div style="padding-left:60px;">
									<span>封面：</span><input type="text" name="ThuPicURL" id="adThuPicURL" />
									<div style="padding-left:60px;">
										<input type="file" id="file_uploadThuPicURL" /> 
										<input type="button" value="上传图片" id="uploadThuPicURL" />
									</div>
								</div>
								<script type="text/javascript">
									$(document)
											.ready(
													function() {
														function ajaxFileUploadThuPicURL() {
															var formData = new FormData();
															formData
																	.append(
																			'file',
																			$("#file_uploadThuPicURL")[0].files[0]); //将文件转成二进制形式  
															$
																	.ajax({
																		type : "post",
																		url : "  http://www.shoutike.com/STK/upload",
																		async : false,
																		contentType : false, //这个一定要写  
																		processData : false, //这个也一定要写，不然会报错  
																		data : formData,
																		dataType : 'text', //返回类型，有json，text，HTML。这里并没有jsonp格式，所以别妄想能用jsonp做跨域了。  
																		success : function(
																				data) {

																			$(
																					'#adThuPicURL')
																					.val(
																							data);
																		},
																		error : function(
																				XMLHttpRequest,
																				textStatus,
																				errorThrown,
																				data) {
																			alert(errorThrown);
																		}
																	});
														}

														$("#uploadThuPicURL")
																.click(
																		function() {
																			ajaxFileUploadThuPicURL();
																		});
													});
								</script>
							</div>
							
							
							<!-- 视频介绍图片 -->



						<div class="lis spms">
							<span>视频描述：</span>
							<textarea name="adremark" id="adremark" rows="" cols=""></textarea>
						</div>

						<div class="lis sfsf">
							<span>是否收费：</span> <input type="radio" value="0" name="adIsPrice" />否
							<input type="radio" value="1" name="adIsPrice" />是
						</div>

						<div class="lis sfsf">
							<span>是否扶贫：</span> <input type="radio" value="0" name="adfupin" />否
							<input type="radio" value="1" name="adfupin" />是
						</div>

						<div class="lis sfsf">
							<span>是否公开：</span> <input type="radio" value="0" name="aspubli" />否
							<input type="radio" value="1" name="aspubli" />是
						</div>

						<div class="lis pay">
							<span>价格：</span> <input type="text" id="adprice" />
						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="adsave">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 编辑Modal -->
	<div class="modal fade" id="mytxtModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-body" id="xiugai">
					<!-- xiugai -->
				</div>


				<div class="modal-footer" id="xiugaibto"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 详情Modal -->
	<div class="modal fade" id="myxqModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-list-alt" style="color: #333;"></span>
						详情
					</h4>
				</div>
				<div class="modal-body">
					<div class="panel-wrap">
						<div class="lis kcfl">
							<span>分类：</span> <select name="">
								<option value="小学" disabled="disabled">分类</option>
								<option value="一年级" disabled="disabled"
									style="font-size: 16px;font-weight: 700;color: royalblue;">一年级</option>
								<option value="语文"><span
										class="glyphicon glyphicon-list"></span> 语文
								</option>
								<option value="数学"><span
										class="glyphicon glyphicon-list"></span> 数学
								</option>
								<option value="外语"><span
										class="glyphicon glyphicon-list"></span> 外语
								</option>
								<option value="二年级" disabled="disabled"
									style="font-size: 16px;font-weight: 700;color: royalblue;">二年级</option>
								<option value="语文"><span
										class="glyphicon glyphicon-list"></span> 语文
								</option>
								<option value="数学"><span
										class="glyphicon glyphicon-list"></span> 数学
								</option>
								<option value="外语"><span
										class="glyphicon glyphicon-list"></span> 外语
								</option>
								<option value="三年级" disabled="disabled"
									style="font-size: 16px;font-weight: 700;color: royalblue;">三年级</option>
								<option value="语文"><span
										class="glyphicon glyphicon-list"></span> 语文
								</option>
								<option value="数学"><span
										class="glyphicon glyphicon-list"></span> 数学
								</option>
								<option value="外语"><span
										class="glyphicon glyphicon-list"></span> 外语
								</option>

							</select>

						</div>

						<div class="lis title">
							<span>标题：</span><input type="text" name="" id="" value="" />
						</div>
						<div class="lis img">
							<span>400px*322px</span>
							<div class="pic">
								<div class="imgs01">
									<img src="" />
								</div>

								<input type="file" class="filepic" name="" id="" value="" />
							</div>
						</div>
						<div class="lis">
							<span>200px*322px</span>
							<div class="pic">
								<div class="imgs02">
									<img src="" />
								</div>

								<input type="file" class="filepic" name="" id="" value="" />
							</div>
						</div>
						<div class="lis">
							<span>200px*124px</span>
							<div class="pic">
								<div class="imgs03">
									<img src="" />
								</div>

								<input type="file" class="filepic" name="" id="" value="" />
							</div>
						</div>
						<div class="lis">
							<span>128px*80px</span>
							<div class="pic">
								<div class="imgs04">
									<img src="" />
								</div>

								<input type="file" class="filepic" name="" id="" value="" />
							</div>
						</div>
						<div class="lis js">
							<span>讲师：</span> <input type="text" />
						</div>
						<div class="lis spms">
							<span>视频描述：</span>
							<textarea name="" rows="" cols=""></textarea>
						</div>
						<div class="lis yxx">
							<span>有效性：</span><input type="checkbox" name="" id="" value="" />
						</div>
						<div class="lis sfsf">
							<span>是否收费：</span><input type="checkbox" name="" id="" value="" />
						</div>
						<div class="lis yxq">
							<span>购买有效期：</span> <input type="text" />
						</div>
						<div class="lis pay">
							<span>价格：</span> <input type="text" />
						</div>
						<div class="lis sfdz">
							<span>是否打折：</span><input type="checkbox" name="" id="" value="" />
						</div>
						<div class="lis fpzt">
							<span>扶贫专题：</span><input type="checkbox" name="" id="" value="" />
						</div>
						<div class="lis zhjq">
							<span>价格：</span> <input type="text" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 删除Modal -->
	<div class="modal fade" id="mydelModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-remove" style="color: #ff0000;"></span>
						删除
					</h4>
				</div>
				<div class="modal-body" id="deletexq"></div>
				<div class="modal-footer" id="deletebtoxq"></div>
			</div>
		</div>
	</div>

	<!-- 管理视频Modal -->
	<div class="modal fade" id="myglModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-body">
					<div class="panel-wrap"></div>
				</div>


				<div class="modal-footer"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<!--修改收藏数-->
	<div class="modal fade" id="mychModal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-pencil" style="color: #666;"></span>
						修改
					</h4>
				</div>
				<div class="modal-body">
					<div class="panel-wrap">
						<div class="lis title">
							<span>标题：</span> <b>初中语文。。。</b>
						</div>
						<div class="lis chs">
							<span>收藏数：</span> <input type="text" />
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改购买数 -->
	<div class="modal fade" id="mypayModal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-pencil" style="color: #666;"></span>修改
					</h4>
				</div>
				<div class="modal-body">
					<div class="panel-wrap">
						<div class="lis title">
							<span>标题：</span> <b>初二数学。。。</b>
						</div>
						<div class="lis chs">
							<span>购买数：</span> <input type="text" />
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
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
          //alert(page);
          window.location.href='<%=path%>/backml?id=189&page='+page;
		
	}
        
$("#tab tbody tr").each(function(){
	//$(this).eq(6).html();
	
	var str = $(this).children().eq(0).find('div').html();
	var thisobj = $(this).children().eq(5).find('div');
	console.log(str);
	
	$.ajax({
		url : ''+path+'/selvideocount',
		type : "POST",

		data : {
			"id" : str,
		},
		success : function(msg) {
			thisobj.html(msg);
		},
		error : function(res) {
			// alert(res.responseText);
			alert("发生错误。");
		}
	});
	
	
});    
function selcount() {
    //var data=$(obj).attr("data");
  alert("555");
 // $(obj).html("55");
  //window.location.href='<%=path%>/backml?id=189&page='+page;

}
	    
        </script>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/iframepage/xxpublic.js"></script>
<script type="text/javascript" src="<%=path%>/js/iframepage/video.js"></script>