
//tbody tr点击添加焦点
$('tbody tr').on('click', function() {
	$('tbody tr').removeClass('active');
	$(this).addClass('active');
});

//判断如果没有选中 操作的元素 则 无法点击添加等按钮 并显示弹窗提醒
//新增
$('#myaddModal').on('shown.bs.modal', function(e) {
	
})
//编辑
$('#mytxtModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
//		alert('正常操作');
	}
});
//详情
$('#myxqModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
//		alert('正常操作');
	}	
});
//删除课程或者评论
$('#mydelModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
		
		
	}
});
//回复
$('#myhfModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
		
		
	}
});

//删除回复
$('#mydelhfModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
		
		
	}
});
//修改收藏数
$('#mychModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
//		alert('正常操作');
	}	
});
//修改购买数
$('#mypayModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
//		alert('正常操作');
	}	
});
//修改播放数
$('#mybfModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
//		alert('正常操作');
	}	
});

