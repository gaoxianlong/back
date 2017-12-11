//动态设置右边内容的宽度和高度
var h = $(window).height() - $('.header').height()*1.07;
console.log($(window).height(),$('.header').height());
$('.con').height(h);
$('.panel-left').height(h);
$('.panel-right').height(h);
var w = $(window).width() - $('.panel-left').width()*1.03;
$('.panel-right').width(w);

var bodyh = $('.con').height()-$('.panel-head').height();
$('.panel-body').height(bodyh);
$('.tabs-panels').height(bodyh);
$(window).resize(function () {          //当浏览器大小变化时
//  alert($(window).height());          //浏览器时下窗口可视区域高度
//  alert($(document).height());        //浏览器时下窗口文档的高度
//  alert($(document.body).height());   //浏览器时下窗口文档body的高度
//  alert($(document.body).outerHeight(true)); //浏览器时下窗口文档body的总高度 包括border padding margin
	var w = $(window).width() - $('.panel-left').width()*1.03;
	
	$('.panel-right').width(w);
	$('.tabs-header').width(w);
	$('.tabs-panels').width(w);
	$('.panel').width(w);
	$('.panel .panel-body').width(w);
	$('.panel-body iframe').width(w);
});

//左边一级菜单点击
//给一级菜单添加自定义属性 默认关闭为false 
$('.lists .item-title').attr('data-onoff','false');
$('.lists .item-title').click(function(){
	//判断当前文件夹是否打开状态 默认false是关闭状态
	if($(this).attr('data-onoff') == 'false'){
		//清除所有 添加当前焦点
		$('.lists .item-title').removeClass('active');
		$('.active').removeClass('active'); //之前有焦点的主要是 二级菜单 都清除
		$(this).addClass('active');
		$(this).children('span').removeClass('glyphicon-folder-close');  
		$(this).children('span').addClass('glyphicon-folder-open');
		$(this).attr('data-onoff','true'); //关闭时 点击展开 文件夹变打开样式
		$(this).next().show();
	}else{
		//清除所有 添加当前焦点
		$('.active').removeClass('active');
		$(this).addClass('active');
		$(this).attr('data-onoff','false'); //打开时 关闭文件夹变关闭样式
		$(this).children('span').removeClass('glyphicon-folder-open');  
		$(this).children('span').addClass('glyphicon-folder-close');
		$(this).next().hide();
	}
	
});

//点击左边二级修改的菜单效果
$('.items').click(function(){
	
	if($(this).hasClass('active')){
		return;
	}else{
		
	}
	//添加焦点
	if($(this).parent().prev().attr('data-onoff')){
		$(this).parent().prev().removeClass('active');
	}
	$('.items').removeClass('active');
	$('.active').removeClass('active');
	$(this).addClass('active');
});





