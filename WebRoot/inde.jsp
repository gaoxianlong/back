<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>OSS web直传</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/libjs/style.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
	<script>
function signatur(){
	 var curWwwPath=window.document.location.href;
	 var pathName=window.document.location.pathname;
	 var pos=curWwwPath.indexOf(pathName);
	 var localhostPaht=curWwwPath.substring(0,pos);
	 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	
	var path=localhostPaht+projectName;
	
	
	$.ajax({
			url : ''+path+'/jsup',
			type : "POST",
			dataType : "json",
			data : {
				
			},
			
			success : function(msg) {
				//alert(msg.policy);
				$('#policyBase64').val(msg.policy);
				$('#accessid').val(msg.accessid);
				$('#signature').val(msg.signature);

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

<h2>OSS web直传---直接在JS签名</h2>
<ol>
<li>基于plupload封装 </li>
<li>支持html5,flash,silverlight,html4 等协议上传</li>
<li>可以运行在PC浏览器，手机浏览器，微信</li>
<li>可以选择多文件上传</li>
<li>显示上传进度条</li>
<li>可以控制上传文件的大小</li>
<li>最关键的是，让你10分钟之内就能移植到你的系统，实现以上牛逼的功能！</li>
<li>注意：此方法是直接在前端签名，有accessid/accesskey泄漏的风险</li>
<li>注意一点，bucket必须设置了Cors(Post打勾）,不然没有办法上传</li>
<li>注意一点，把upload.js 里面的host/accessid/accesskey改成您上传所需要的信息即可</li>
 			<input type="text" value="${accessid }" id="accessid"/>
			<input type="text" value="${policyBase64 }" id="policyBase64"/>
			<input type="text" value="${signature }" id="signature"/>
</ol>
<br>

<h4>您所选择的文件列表：</h4>
<div id="ossfile">你的浏览器不支持flash,Silverlight或者HTML5！</div>

<br/>

<div id="container">
	<a id="selectfiles" href="javascript:void(0);" class='btn'>选择文件</a>
	<a id="postfiles" href="javascript:void(0);" class='btn'>开始上传</a>
</div>

<pre id="console"></pre>

<p>&nbsp;</p>

</body>
<script type="text/javascript" src="<%=path%>/libjs/crypto1/crypto/crypto.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/crypto1/hmac/hmac.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/crypto1/sha1/sha1.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/base64.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/plupload-2.1.2/js/plupload.full.min.js"></script>
<script type="text/javascript" src="<%=path%>/libjs/upload.js"></script>
</html>
