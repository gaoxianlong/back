//视频管理系列   点击管理视频按钮的效果
//addsp();
function addsp(){
	var str = '';
	var str1 = '';
	$('.gl-btn').on('click',function(){
		
		if(!$('tbody tr').hasClass('active')) {
			alert('提示 请选择操作的内容！');
			return false;
		}
		else{
			//生成相对应的导航部分     并且删除导航部分所有焦点 
			$('#nav-ol .lis',window.parent.document).removeClass('nav-active');
			str = '<li class="lis nav-active"><div><a href="javascript:;"> 考研</a> <span class="head-close">x</span></div></li>';
			//放到父页面相对应的导航位置
			$('#nav-ol',window.parent.document).append(str);
			
			
		    //生成相对应的内容部分 引入的页面   并且删除内容部分的所有焦点
			$('#tabs-wrap .panel-page',window.parent.document).removeClass('tabs-active');
		    str1 = '<div class="panel-page tabs-active"><div class="page-content"><iframe src="iframepage/video/gl/videoguanli.html" frameborder="0" scrolling="auto" width="100%" height="100%"></iframe></div></div>';
		    //放到父页面相对应的 内容位置
			$('#tabs-wrap',window.parent.document).append(str1);
		}
	
	});
}


//当前子页面的 新增按钮   上传图片预览效果
$(".filepic").on("change", function() {
	var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
//	alert(objUrl);
    var $piczs = $(this).prev().children('img');
	if(objUrl) {
		$piczs.attr("src", objUrl); //将图片路径存入src中，显示出图片
	}
});

//建立一個可存取到該file的url
function getObjectURL(file) {
	var url = null;
	if(window.createObjectURL != undefined) { // basic
		url = window.createObjectURL(file);
	} else if(window.URL != undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file);
	} else if(window.webkitURL != undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file);
	}
	return url;
}