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

<link rel="stylesheet" type="text/css"
	href="<%=path%>/content/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/public.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/first.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/iframepage/video.css" />
<script src="<%=basePath%>js/plupload.full.min.js"></script>
<script type="text/javascript">
function flu(){
	
function getCookie(name){
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if(arr != null){
	 	return unescape(arr[2]);
	}else{
		return null;
	}
}  


alert(getCookie("sid")); 
var user = '<%=session.getAttribute("pro")%>';
alert(user);

var coid=getCookie("sid");
var curWwwPath=window.document.location.href;
var pathName=window.document.location.pathname;
var pos=curWwwPath.indexOf(pathName);
var localhostPaht=curWwwPath.substring(0,pos);
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var path=localhostPaht+projectName;
//window.location.href=''+path+'/selvideo?id='+coid+'';

}

	 
</script>
</head>
<body onload="flu()">
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
				data-toggle="modal" data-target="#myxqModal">
				<span class="glyphicon glyphicon-list-alt" style="color: #333;"></span>
				详情
			</button>
			<div class="bar"></div>
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#mydelModal">
				<span class="glyphicon glyphicon-remove" style="color: #ff0000;"></span>
				删除
			</button>
			<div class="bar"></div>
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#mybfModal">
				<span class="glyphicon glyphicon-pencil" style="color: #666;"></span>
				修改播放
			</button>
		</div>
		<div class="first-main">
			<div class="first-body">
				<table width="100%" cellspacing="" cellpadding="" border="0"
					id="tab">
					<thead>
						<tr>
							<th>编号</th>
							<th>标题</th>
							<th>视频地址</th>

							<th>发布时间</th>

							<th>播放数</th>
							<th>点赞数</th>
							<th>排序</th>

							<th>是否收费</th>
							<th>所属分类</th>



						</tr>
					</thead>
					<tbody>
						<c:forEach items="${video }" var="bs">
							<tr>
								<td>${bs.ID }</td>
								<td>${bs.title }</td>
								<td>${bs.videoURL }</td>

								<td><fmt:formatDate value="${bs.createTime }"
											pattern="yyyy-MM-dd" /></td>

								<td>${bs.clickRate }</td>
								<td>${bs.zanCts }</td>
								<td>${bs.sort }</td>

								<c:if test="${bs.isPrice == 0 }">
									<td>不收费</td>
								</c:if>
								<c:if test="${bs.isPrice == 1 }">
									<td>收费</td>
								</c:if>

                               <td>
                                <div style="display: none">${bs.SID }</div>
                               
                               </td>
                                 <td>
                                 <div style="display: none">${bs.isPrice }</div>
                                
                                 </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="pager">

					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="selvideo?id=${sid }&page=1">首页</a></li>

							<c:if test="${info.hasPreviousPage }">
								<li><a href="selvideo?id=${sid }&page=${info.pageNum-1 }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>



							<c:forEach items="${info.navigatepageNums }" var="page_Num">
								<c:if test="${page_Num == info.pageNum }">
									<li class="active"><a
										href="selvideo?id=${sid }&page=${page_Num }">${page_Num }</a></li>
								</c:if>

								<c:if test="${page_Num != info.pageNum }">
									<li><a href="selvideo?id=${sid }&page=${page_Num }">${page_Num }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${info.hasNextPage }">
								<li><a href="selvideo?id=${sid }&page=${info.pageNum+1 }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>


							<li><a href="selvideo?id=${sid }&page=${info.pages }">末页</a></li>




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
					<input type="hidden" id="sid" value="${sid }"/>
						<div class="lis title">
							<span>标题：</span> <input type="text" id="title"/>
						</div>
						<div class="lis title">
							<span>视频文件：</span> 
							
							<button id="pickfiles">选择文件</button>
							<button id="uploadfiles">开始上传</button>

							<div id="filelist" stytle="border:1px red solid;"></div>
						</div>
						
						<div class="lis js">
							<span>排序：</span> <input type="text" id="sort"/>
						</div>
						
						<div class="lis sfsf">
							<span>是否收费：</span>
							<input type="radio" value="0" name="IsPrice" />否
							<input type="radio" value="1" name="IsPrice" />是
						</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="adglsave">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 编辑Modal -->
	<div class="modal fade" id="mytxtModal" tabindex="-1" role="dialog"
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
						编辑
					</h4>
				</div>
				<div class="modal-body" id="xiugai">
				
				
				
				</div>
				<div class="modal-footer" id="xiugaibto">
					
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 详情Modal -->
	<div class="modal fade" id="myxqModal" tabindex="-1" role="dialog"
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
						详情
					</h4>
				</div>
				<div class="modal-body">
					<div class="panel-wrap">
						<div class="lis title">
							<span>标题：</span> <input type="text" />
						</div>
						<div class="lis title">
							<span>视频文件：</span> <input type="hidden" name="" id="" value="" />
							<input type="file" />
						</div>
						<div class="lis js">
							<span>讲师：</span> <input type="text" />
						</div>
						<div class="lis spsc">
							<span>视频时长：</span> <input type="text" />
						</div>
						<div class="lis yxx">
							<span>是否有效：</span><input type="checkbox" name="" id="" value="" />
						</div>
						<div class="lis sfyx">
							<span>是否收费：</span><input type="checkbox" name="" id="" value="" />
						</div>
						<div class="lis sfsf">
							<span>是否收费：</span><input type="checkbox" name="" id="" value="" />
						</div>
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

	<!-- 删除Modal -->
	<div class="modal fade" id="mydelModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<span class="glyphicon glyphicon-remove" style="color: #ff0000;"></span>
						删除
					</h4>
				</div>
				<div class="modal-body" id="deletexq"></div>
				<div class="modal-footer" id="deletebtoxq">
					
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 修改播放 -->
	<div class="modal fade" id="mybfModal" tabindex="-1" role="dialog"
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
							<span>播放数：</span> <input type="text" />
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

<script type="text/JavaScript">
			var uploader = new plupload.Uploader({						runtimes : 'HTML5,flash,silverlight,html4',
						browse_button : 'pickfiles',
						Container : document.getElementById('container'), //展现上传文件列表的容器

						url : '<%=basePath%>testFile', //服务器端接收和处理上传文件的脚本地址
						flash_swf_url : '<%=basePath%>js/Moxie.swf', //flash上传组件的url地址,当使用flash上传方式会用到该参数.
						silverlight_xap_url : '<%=basePath%>js/Moxie.xap', //silverlight上传组件的url地址，当使用silverlight上传方式会用到该参数。

						filters : {
							max_file_size : '1000mb', //最大上传文件大小

						},

						init : { //当Plupload初始化完成后触发
							PostInit : function() { //当Init事件发生后触发
								document.getElementById('filelist').innerHTML = '';
								document.getElementById('uploadfiles').onclick = function() {
									uploader.start();
									return false;
								};
							},

							FilesAdded : function(up, files) { //当文件添加到上传队列后触发,当上选择好文件后就将选择好的文件显示在自己规定的div中显示
								plupload
										.each(
												files,
												function(file) {
													document
															.getElementById('filelist').innerHTML += '<div id="' + file.id + '">'
															+ file.name
															+ ' ('
															+ plupload
																	.formatSize(file.size)
															+ ') <b></b><em></em></div>';
													

													uploader.setOption(
															"multipart_params",
															{
																
															});
												});

							},
							UploadProgress: function(up, file) {    
								
								
								
								
								
								 var timeout = false;
							     function time()  
							     {  
							     if(timeout) 
							    	 {
							    	 return;  
							    	 }
							    
							     function meth(){ 
							    	 
							    	 function getCookie(name){
							 		     var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
							 		     if(arr != null)
							 		     {
							 			
							 			 	return unescape(arr[2]);
							 			 }  
							 		     else
							 			 {
							 				return null;
							 			 }
							 			}
							 		 		
							 		 var coid=getCookie("pro");
							    
								     //alert(coid);
								     
								  document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span id="pro">' + coid + "</span>";   
										if(coid.equals("100%"))
											{
							    		 
							    		 timeout=true;
							    	 		}
							     }
							     meth();
							     setTimeout(time,100); 
							     }
							     
					     

								
								
								
							     time();
								
								
								//显示上传进度条
							//	document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span id="pro">' + file.percent + "%</span>";
								},
							FileUploaded : function(uploader, file, data) {

								document.getElementById(file.id)
										.getElementsByTagName('em')[0].innerHTML = '<input id="glurl" name="urrl" class="urrl" type="text" value="'+ data.response + '"></input>';

							},
							Error : function(up, err) { //发生错误时触发
								document.getElementById('console').appendChild(
										document
												.createTextNode("\nError #"
														+ err.code + ": "
														+ err.message));
							},

						}
					});

			uploader.init();
		</script>
<script type="text/JavaScript">
			
			  $(document).ready(function(){  
			var uploadere = new plupload.uploaderedd({						runtimes : 'HTML5,flash,silverlight,html4',
						browse_button : 'pickfilesgl',
						Container : document.getElementById('container'), //展现上传文件列表的容器

						url : '<%=basePath%>testFile', //服务器端接收和处理上传文件的脚本地址
						flash_swf_url : '<%=basePath%>js/Moxie.swf', //flash上传组件的url地址,当使用flash上传方式会用到该参数.
						silverlight_xap_url : '<%=basePath%>js/Moxie.xap', //silverlight上传组件的url地址，当使用silverlight上传方式会用到该参数。

						filters : {
							max_file_size : '1000mb', //最大上传文件大小

						},

						init : { //当Plupload初始化完成后触发
							PostInit : function() { //当Init事件发生后触发
								document.getElementById('filelistgl').innerHTML = '';
								document.getElementById('uploadfilesgl').onclick = function() {
									uploaderedd.start();
									return false;
								};
							},

							FilesAdded : function(up, files) { //当文件添加到上传队列后触发,当上选择好文件后就将选择好的文件显示在自己规定的div中显示
								plupload
										.each(
												files,
												function(file) {
													document
															.getElementById('filelistgl').innerHTML += '<div id="' + file.id + '">'
															+ file.name
															+ ' ('
															+ plupload
																	.formatSize(file.size)
															+ ') <b></b><em></em></div>';
													

													uploaderedd.setOption(
															"multipart_params",
															{
																
															});
												});

							},

							FileUploaded : function(uploaderedd, file, data) {
								//$('#glvideourl').val(data.response);
								
							},
							Error : function(up, err) { //发生错误时触发
								document.getElementById('console').appendChild(
										document
												.createTextNode("\nError #"
														+ err.code + ": "
														+ err.message));
							},

						}
					});

			uploaderedd.init();
			
			
			
			  });
			
		</script>
			




<!--  
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.4.4.min.js"></script>-->
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/iframepage/xqglpublic.js"></script>
	
	<script type="text/javascript" src="<%=path%>/jscript/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/iframepage/first.js"></script>