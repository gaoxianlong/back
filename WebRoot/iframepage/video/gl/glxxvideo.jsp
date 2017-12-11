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
<script>
function signatu(){
$.ajax({
			url : ''+path+'/jsup',
			type : "POST",
			data : {},
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
			
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#mydelModal">
				<span class="glyphicon glyphicon-remove" style="color: #ff0000;"></span>
				删除
			</button>
			
			<!--  
			<input type="text" value="${accessid }" id="accessid"/>
			<input type="text" value="${policyBase64 }" id="policyBase64"/>
			<input type="text" value="${signature }" id="signature"/>-->
			<div class="bar"></div>
			
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
<!-- selvideoxiao?id=${sid }&page=${info.pageNum-1 } -->
<input type="hidden" id="bring" value="${info.pageNum }"/>
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li><a href="javascript:;" value="1" onclick="glxxvideo(this)" id="${sid }">首页</a></li>

							<c:if test="${info.hasPreviousPage }">
								<li><a href="javascript:;"
									aria-label="Previous" value="${info.pageNum-1 }" onclick="glxxvideo(this)" id="${sid }"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>



							<c:forEach items="${info.navigatepageNums }" var="page_Num">
								<c:if test="${page_Num == info.pageNum }">
									<li class="active"><a
										href="javascript:;" value="${page_Num }" onclick="glxxvideo(this)" id="${sid }">${page_Num }</a></li>
								</c:if>

								<c:if test="${page_Num != info.pageNum }">
									<li><a href="javascript:;" value="${page_Num }" onclick="glxxvideo(this)" id="${sid }">${page_Num }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${info.hasNextPage }">
								<li><a href="javascript:;"
									aria-label="Next" value="${info.pageNum+1 }" onclick="glxxvideo(this)" id="${sid }"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>


							<li><a href="javascript:;" value="${info.pages }" onclick="glxxvideo(this)" id="${sid }">末页</a></li>




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
					<input id="glurl" name="urrl" class="urrl" type="hidden" />
						<div class="lis title">
							<span>标题：</span> <input type="text" id="title"/>
						</div>
						<div class="lis title">
							<span>视频文件：</span> 
							
							
							<div id="ossfile">你的浏览器不支持flash,Silverlight或者HTML5！</div>
							<br/>
							<div id="container">
							    <span style="width: 100px;display: inline-block;"></span>
								<a id="selectfiles" href="javascript:void(0);" class='btn'>选择文件</a>
								<a id="postfiles" href="javascript:void(0);" class='btn'>开始上传</a>
							</div>
							
							
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


			
			
		
		</script>



<script>
		
function tim(obj) {				
		var timeout = false;
 					 
 				 
 					 var ti=setInterval(function(){
 					 //
 					// alert("dingshiqi");	
					 		console.log('1111111');			
									
							 var curWwwPath=window.document.location.href;
							 var pathName=window.document.location.pathname;
							 var pos=curWwwPath.indexOf(pathName);
							 var localhostPaht=curWwwPath.substring(0,pos);
							 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
							
							var path=localhostPaht+projectName;					
												
							$.ajax({
								url : ''+path+'/selprogress',
								type : "POST",
								data : {
									
								},
								success : function(msg) {
					
									//$("#proo")
									console.log(msg);
									obj.val(msg);
									
										if(msg=="100%"){
										
										// up=0
										
										$.ajax({
								url : ''+path+'/zero',
								type : "POST",
					
								data : {
									
								},
								success : function(msg) {
					
										
										timeout=true;
										
										if(timeout){
					 					     
					 					     clearInterval(ti);
					 					 }
								},
								error : function(res) {
									// alert(res.responseText);
									alert("发生错误。");
								}
							});
								
										// up=0
										
										}
										
									
									
					
								},
								error : function(res) {
									// alert(res.responseText);
									alert("发生错误。");
								}
							});
					 					 
 					// 
 					 
 					 },1000); //time是指本身,延时递归调用自己,100为间隔调用时间,单位毫秒
 					 
 					 					
}							 
									
									
						</script>		
<script>
        
        function glxxvideo(obj) {
            var page=$(obj).attr("value");
            var id=$(obj).attr("id");
          //alert(page);
          //alert(id);
         //selvideoxiao?id=${sid }&page=${info.pageNum-1 }
          window.location.href='<%=path%>/selvideoxiao?id='+id+'&page='+page;
		
	}
	    
        </script>						

		
		
<!--  
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.4.4.min.js"></script>-->
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/iframepage/xxglpublic.js"></script>
	
	
	<script type="text/javascript" src="<%=path%>/jscript/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/iframepage/first.js"></script>

<script type="text/javascript" src="<%=path%>/libjs/crypto1/crypto/crypto.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/crypto1/hmac/hmac.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/crypto1/sha1/sha1.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/base64.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/plupload-2.1.2/js/plupload.full.min.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/upload.js"></script>
