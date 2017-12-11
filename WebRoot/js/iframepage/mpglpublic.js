//


	
									
//55
//tbody tr点击添加焦点
$('tbody tr').on('click', function() {
	$('tbody tr').removeClass('active');
	$(this).addClass('active');
});

// 判断如果没有选中 操作的元素 则 无法点击添加等按钮 并显示弹窗提醒
// 新增
$('#myaddModal').on('shown.bs.modal', function(e) {
	$('#adglsave').click(function(){
		var  SID=$("#sid").val();
		var  Title=$("#title").val();
		var  VideoURL=$("#glurl").val();
		var  IsPrice=$("input[name='IsPrice']:checked").val(); 
		var  Sort=$("#sort").val();
		
		var  des=$("#des").val();
		 var bring=$("#bring").val();
		//alert(des);
		 var curWwwPath=window.document.location.href;
		 var pathName=window.document.location.pathname;
		 var pos=curWwwPath.indexOf(pathName);
		 var localhostPaht=curWwwPath.substring(0,pos);
		 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		
		var path=localhostPaht+projectName;
		
	
		// var
		// projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		$.ajax({
			url : ''+path+'/addaccountvideomp',
			type : "POST",

			data : {
				"SID" : SID,
				"Title" : Title,
				"VideoURL" : VideoURL,
				"IsPrice" : 0,
				"Sort" : Sort,
				"des"  : des
			},
			success : function(msg) {

				if (msg.id == 1) {
					alert("添加成功");
					window.location.href=''+path+'/selvideomp?='+msg.sid+'&page='+bring;
					
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

function xqtxxgl() {
	
	var  ID=$("#glid").val();
	var  Title=$("#gltitle").val();
	var  VideoURL=$("#glvideourl").val();
	var  ClickRate=$("#glbf").val();
	var  ZanCts=$("#gldian").val();
	var  SID=$("#glsid").val();
	var  IsPrice=$("input[name='glIsPrice']:checked").val(); 
	
	 var bring=$("#bring").val();
	var  Sort=$("#glsort").val();
	var  desd=$("#desd").val();
	
	//alert(desd);
	 var curWwwPath=window.document.location.href;
	 var pathName=window.document.location.pathname;
	 var pos=curWwwPath.indexOf(pathName);
	 var localhostPaht=curWwwPath.substring(0,pos);
	 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	
	var path=localhostPaht+projectName;
	
	
	
	

	$.ajax({
		url : ''+path+'/upvideomp',
		type : "POST",

		data : {
			"ID"    :ID,
			"SID"    :SID,
			"Title" : Title,
			"VideoURL" : VideoURL,
			"ClickRate" : ClickRate,
			"ZanCts" : ZanCts,
			"IsPrice" : IsPrice,
			"Sort" : Sort,
			"des"  : desd
		},
		success : function(msg) {

			if (msg.id == 1) {
				alert("修改成功");
				window.location.href=''+path+'/selvideomp?='+msg.sid+'&page='+bring;
				
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




//
$('#mytxtModal').on('show.bs.modal', function(e) {
	if(!$('tbody tr').hasClass('active')) {
		alert('提示 请选择操作的内容！');
		return false;
	}
	else{
// alert('正常操作');
	}

	var cos=$('tbody .active').children().eq(9).children().html()
	var ID=$('tbody .active').children().eq(0).html();
	
	
	
	$('tbody .active').children().each(function(){
		$("#xiugai").html(`
	<div class="panel-wrap">
		<div class="lis title">
		<input type="hidden" name="" id="glid" value="`+$('tbody .active').children().eq(0).html()+`" />
		<input type="hidden" name="" id="glsid" value="`+$('tbody .active').children().eq(8).children().html()+`" />
			<span>标题：</span> <input type="text" value="`+$('tbody .active').children().eq(1).html()+`" id="gltitle"/>
		</div>
		<div class="lis title" style="height: 100px;">
		    <div style="margin-bottom: 5px;height: 26px;"> 
			<span style="float: left;width: 100px;text-align: right;">音频文件：</span> <input type="text" name="" id="glvideourl" value="`+$('tbody .active').children().eq(2).html()+`" style="float: left;width: 365px;" />
			</div>
			<div style="height: 26px;margin-bottom: 2px;">
			<span style="float: left;width: 100px;height: 26px;"></span>
			<input type="file" id="fileuploadtxx" style="float: left;padding-left: 0;"/> 
			</div>
			<div style="height: 26px;">
			<span style="float: left;width: 100px;height: 26px;"></span>
			<input type="button" value="上传" id="uploadtxxd" style="float: left;width: 62px;"/>
			<input type="text" id="vull" readonly="value" style="width:80px;height:25px;margin-left:20px;border:0;" value="进度条"/>
			</div>
<script type="text/javascript">  
			    $(document).ready(function(){  
			        
			     function ajaxFileUplotxd(){  	
			     var formData = new FormData();  
			     formData.append('file',$("#fileuploadtxx")[0].files[0]);    //将文件转成二进制形式         
			   	 var curWwwPath=window.document.location.href;
				 var pathName=window.document.location.pathname;
				 var pos=curWwwPath.indexOf(pathName);
				 var localhostPaht=curWwwPath.substring(0,pos);
				 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				
				 var path=localhostPaht+projectName;
			        $.ajax({  
			            type:"post",  
			            url:''+path+'/upmp',  
			            async:true,  
			            contentType: false,    //这个一定要写  
			            processData: false, //这个也一定要写，不然会报错  
			            data:formData,  
			            dataType:'text',    //返回类型，有json，text，HTML。这里并没有jsonp格式，所以别妄想能用jsonp做跨域了。  
			            
			            success:function(data){  
			            	
			            	$('#glvideourl').val(data);
			            },  
			            error:function(XMLHttpRequest, textStatus, errorThrown, data){  
			                alert(errorThrown);  
			            }              
			        });  
			    }  
			      
			    $("#uploadtxxd").click(function(){  
			    	tim($("#vull"));
			        ajaxFileUplotxd();  
			    	});  
			    });
			    $('#desd').html($('tbody .active').children().eq(10).html());
</script>
		</div>	
		<div class="lis sfyx">
			<span>播放数：</span><input type="text" name="" id="glbf" value="`+$('tbody .active').children().eq(4).html()+`" />
		</div>
		<div class="lis sfyx">
		     <span>点赞数：</span><input type="text" name="" id="gldian" value="`+$('tbody .active').children().eq(5).html()+`" />
	    </div>
	    <div class="lis sfyx">
	       <span>排序：</span>
	       <input type="text" id="glsort" value="`+$('tbody .active').children().eq(6).html()+`"/>
	    </div>
		<div class="lis sfsf">
			<span>是否收费：</span>
			<input type="radio" value="0" name="glIsPrice" id="raaa"/>否
			<input type="radio" value="1" name="glIsPrice"  id="rabb"/>是
		</div>
		<div class="lis sfyx">
			<span>描述：</span>
			<textarea  id="desd"></textarea>
		</div>
</div>	
				`);
		$("#xiugaibto").html(`
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="xqtxxgl()">修改</button>
				`);
		if(cos==1){
			$('#rabb').attr('checked',true);
		}
		if(cos==0){
			$('#raaa').attr('checked',true);
		}
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

function deletecogl() {
	 var id=$("#deleteID").val();
	 var sid=$("#sid").val();
	 var url=$("#url").val();
	 
	 var curWwwPath=window.document.location.href;
	 var pathName=window.document.location.pathname;
	 var pos=curWwwPath.indexOf(pathName);
	 var localhostPaht=curWwwPath.substring(0,pos);
	 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	
	 var path=localhostPaht+projectName;
	
	$.ajax({
		url : ''+path+'/deletevideomp',
		type : "POST",
		data : {
			"url":url,
			"id" : id,
			"sid":sid
		},
		success : function(msg) {
			if (msg.id == 1) {
				alert("删除成功");
				window.location.href=''+path+'/selvideomp?id='+msg.sid+'';	
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
		var sid = '';
		var url = '';
		str0 = $('tbody .active').children().eq(0).html();
		str1 = $('tbody .active').children().eq(1).html();
		sid = $('tbody .active').children().eq(8).html();
		url = $('tbody .active').children().eq(2).html();

		$("#deletexq").html('您确定要删除'+str1+'的信息吗？');
$("#deletebtoxq").html(`
		<div style="display: none">${sid }</div>
		
		<input type="hidden" value="${url}" id="url"/>
		<input type="hidden" value="${str0}" id="deleteID"/>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="button" class="btn btn-primary" onclick="deletecogl()">确定</button>	
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