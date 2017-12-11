
// tbody tr点击添加焦点
$('tbody tr').on('click', function() {
	$('tbody tr').removeClass('active');
	$(this).addClass('active');
});

// 判断如果没有选中 操作的元素 则 无法点击添加等按钮 并显示弹窗提醒
// 新增
$('#myaddModal').on('shown.bs.modal', function(e) {
	$('#save').click(function(){
		
		
		var  school=$("#school").val();
		var  num=$("#num").val();
		var  quan=$("#sel").val();
		
		 var curWwwPath=window.document.location.href;
		 var pathName=window.document.location.pathname;
		 var pos=curWwwPath.indexOf(pathName);
		 var localhostPaht=curWwwPath.substring(0,pos);
		 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		
		var path=localhostPaht+projectName;
		
		
		//var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		$.ajax({
			url : ''+path+'/addcode',
			type : "POST",

			data : {
				"Schools" : school,
				"Num" : num,
				"quan" : quan,
			},
			success : function(msg) {

				if (msg == "ok") {
					alert("添加成功");
					window.location.href=''+path+'/selbackcode';
					
				}
				if (msg == fal) {
					alert("false")
				}

			},
			error : function(res) {
				// alert(res.responseText);
				alert("发生错误。");
			}
		});
		
		
		
		
		
		
		
		});
})
// 编辑
// bianji

function txx() {
	

	var  school=$("#schooltx").val();
	var  num=$("#numtx").val();
	var  id=$("#txID").val();
	
	
	$.ajax({
		url : "txsave",
		type : "POST",

		data : {
			"Schools" : school,
			"Num" : num,
			"ID" : id,
		},
		success : function(msg) {

			if (msg == "ok") {
				alert("修改成功");
				window.location.href="selbackcode";
				
			}
			if (msg == fal) {
				alert("false")
			}

		},
		error : function(res) {
			// alert(res.responseText);
			alert("发生错误。");
		}
	});
	
	
	
	
	
}



// bianji



$('#mytxtModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
		
	}
	
	
	
$('tbody .active').children().each(function(){
		
// console.log($('tbody .active').children().eq(0).children().html());
		var str0 = '';
		var str1 = '';
		var str2 = '';
		str0 = $('tbody .active').children('td').eq(0).html();
		str1 = $('tbody .active').children('td').eq(1).html();
		str2 = $('tbody .active').children('td').eq(3).html();
		console.log(str1,str2);
		
		$("#xiugai").html(`
	<div class="panel-wrap">
        <div class="lis">
    		<span>学校：</span>
    		<input type="hidden" value="${str0}" id="txID"/>
    		<input type="text" value="${str1}" id="schooltx"/>
    	</div>
        <div class="lis">
        	<span>数量：</span>
        	<input type="text" value="${str2}" id="numtx"/>
        </div>
	</div>				
			`)
	
$("#xiubot").html(`
		
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="button" class="btn btn-primary"  id="txsav" onclick="txx()">保存</button>
		
		
		`)
});
});
// 详情
$('#myxqModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
// alert('正常操作');
	}	
});
// 删除课程或者评论


function deleteco() {
	
	
	 var id=$("#deleteID").val();
	
	
	$.ajax({
		url : "deletecode",
		type : "POST",

		data : {
			
			"ID" : id,
		},
		success : function(msg) {

			if (msg == "ok") {
				alert("删除成功");
				window.location.href="selbackcode";
				
			}
			if (msg == fal) {
				alert("false")
			}

		},
		error : function(res) {
			// alert(res.responseText);
			alert("发生错误。");
		}
	});
}



$('#mydelModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
		
		
	}
	
	
$('tbody .active').children().each(function(){
		
	
		var str0 = '';
		var str1 = '';
		str0 = $('tbody .active').children('td').eq(0).html();
		str1 = $('tbody .active').children('td').eq(1).html();

		$("#delete").html('您确定要删除'+str1+'的信息吗？');
	

$("#deletebto").html(`
		<input type="hidden" value="${str0}" id="deleteID"/>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="button" class="btn btn-primary" onclick="deleteco()">确定</button>
		
		
		`);
	});
});
// 回复
$('#myhfModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
		
		
	}
});

// 删除回复
$('#mydelhfModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
		
		
	}
});
// 修改收藏数
$('#mychModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
// alert('正常操作');
	}	
});
// 修改购买数
$('#mypayModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
// alert('正常操作');
	}	
});
// 修改播放数
$('#mybfModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
// alert('正常操作');
	}	
});

