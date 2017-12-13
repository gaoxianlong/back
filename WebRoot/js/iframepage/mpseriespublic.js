	
		
    
	
//tbody tr点击添加焦点
$('tbody tr').on('click', function() {
	$('tbody tr').removeClass('active');
	$(this).addClass('active');

});

// 判断如果没有选中 操作的元素 则 无法点击添加等按钮 并显示弹窗提醒
// 新增
$('#myaddModal').on('shown.bs.modal', function(e) {
	
$('#adsave').click(function(){
	var  ta=$("#ddl").find("option:selected").attr("first");
	var  tb=$("#ddl").find("option:selected").attr("second");
	var  tc=$("#ddl").find("option:selected").attr("third");
		var  TypeValue=$("#ddl").find("option:selected").attr("firstid");
		var  Type2Value=$("#ddl").find("option:selected").attr("secondid");
		var  Type3Value=$("#ddl").find("option:selected").attr("thirdid");
		var  Title=$("#adTitle").val();
		var  PicURL=$("#adPicURL").val();
		var  bg=$("#adPicURLbg").val();
		var  Remark=$("#adremark").val();
		//var  IsPrice=$("input[name='adIsPrice']:checked").val(); 
		//var  fupin=$("input[name='adfupin']:checked").val();
		//var  publi=$("input[name='aspubli']:checked").val();
		var fupin=0;
		var publi=1;
		var IsPrice=1;
		var  RealPrice=$("#adprice").val();
		var  writer=$("#writer").val();

		 var curWwwPath=window.document.location.href;
		 var pathName=window.document.location.pathname;
		 var pos=curWwwPath.indexOf(pathName);
		 var localhostPaht=curWwwPath.substring(0,pos);
		 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		
		 var path=localhostPaht+projectName;
		 var priic=Number(RealPrice);
		// var
		// projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		$.ajax({
			url : ''+path+'/addseriesmp',
			type : "POST",
			data : {
				"TypeValue" : TypeValue,
				"Type2Value" : Type2Value,
				"Type3Value" : Type3Value,
				"ta" : ta,
				"tb" : tb,
				"tc" : tc,
				"Title" : Title,
				"PicURL" : PicURL,
				"bg" : bg,
				"Remark" : Remark,
				"IsPrice" : 1,
				"fupin" : 0,
				"publi" : 1,
				"RealPrice" : priic,
				"writer" : writer,
			},
			success : function(msg) {
				if (msg == "ok") {
					alert("添加成功");
					window.location.href=''+path+'/mpseries?id=189';	
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
function xqtxx() {
	var  txid=$("#txid").val();
	var  Title=$("#Title").val();
	var  PicURL=$("#txxPicURL").val();
	var  bg=$("#txxThuPicURL").val();
	
	
	var  Remark=$("#Remark").val();
	var  IsPrice=$("input[name='IsPrice']:checked").val(); 
	var  fupin=$("input[name='fupin']:checked").val();
	var  publi=$("input[name='publi']:checked").val();
	var  RealPrice=$("#RealPrice").val();
	var  Collection=$("#Collection").val();
	var  ClickRate=$("#ClickRate").val();
	var  PmtsTot=$("#PmtsTot").val();
	var wt=$("#wt").val();
	
	 var curWwwPath=window.document.location.href;
	 var pathName=window.document.location.pathname;
	 var pos=curWwwPath.indexOf(pathName);
	 var localhostPaht=curWwwPath.substring(0,pos);
	 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	 var path=localhostPaht+projectName;
	
	 var priic=Number(RealPrice);
	 var bring=$("#bring").val();
	
	$.ajax({
		url : ''+path+'/upseriesmp',
		type : "POST",
		data : {
			"ID"    :txid,
			"Title" : Title,
			"PicURL" : PicURL,
			"bg" : bg,
			"Remark" : Remark,
			"IsPrice" : 1,
			"fupin" : fupin,
			"publi" : 1,
			"RealPrice" : priic,
			"Collection" :Collection,
			"ClickRate" :ClickRate,
			"PmtsTot" :PmtsTot,
			"writer" :wt,
			
		},
		success : function(msg) {

			if (msg == "ok") {
				alert("修改成功");
				window.location.href=''+path+'/mpseries?id=189&page='+bring;
				
			}
			if (msg == "fal") {
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
	
	
	var cos=$('tbody .active').children().eq(14).children().html();
	var fp=$('tbody .active').children().eq(15).children().html();
	var pu=$('tbody .active').children().eq(16).children().html();
	
	

	var  pr=$('tbody .active').children().eq(3).children().children().attr('src');
	pr=pr.replace("http://www.shoutike.com/STK/cover/", "");
	
	var  bgt=$('tbody .active').children().eq(18).children().children().attr('src');
	bgt=bgt.replace("http://www.shoutike.com/STK/cover/", "");
$('tbody .active').children().each(function(){
		
		console.log($('tbody .active').children().eq(0).children().html());
		
		
		$("#xiugai").html(`
				
				
	<div class="panel-wrap">
		<input type="hidden" name="id" id="txid" value="`+$('tbody .active').children().eq(0).children().html()+`" />

		<div class="lis title">
			<span>标题：</span><input type="text" name="Title" id="Title" value="`+$('tbody .active').children().eq(2).children().html()+`" />
		</div>
		
		
		<div class="lis img">
			<div class="pic">
				<div class="imgs01">
					<img src="`+$('tbody .active').children().eq(3).children().children().attr('src')+`" />
				</div>	
			</div>
		</div>
		
	<div style="padding-left:25px;">
		<div>
		<span>图片</pan>	<input type="text" name="txxPicURL" id="txxPicURL" value="" />
			<div style="padding-left:30px;">
				<input type="file" id="fileuploadtxx"/>  
				<input type="button" value="上传图片" id="uploadtxxd"/>
			</div>
		</div>
		<div>
		<span>图片</pan><input type="text" name="txxThuPicURL" id="txxThuPicURL" value="" />
			<div style="padding-left:30px;">
				<input type="file" id="fileuploadtxxThuPicURL"/>  
				<input type="button" value="上传图片" id="uploadtxxdThuPicURL"/>
			</div>
		</div>
	</div>
		
		   <script type="text/javascript">  
		    $(document).ready(function(){  
		        
		    function ajaxFileUplotxd(){  
		        var formData = new FormData();  
		        formData.append('file',$("#fileuploadtxx")[0].files[0]);    // 将文件转成二进制形式
		       
		        $.ajax({  
		            type:"post",  
		            url:"  http://www.shoutike.com/STK/upload",  
		            async:false,  
		            contentType: false,    // 这个一定要写
		            processData: false, // 这个也一定要写，不然会报错
		            data:formData,  
		            dataType:'text',    // 返回类型，有json，text，HTML。这里并没有jsonp格式，所以别妄想能用jsonp做跨域了。
		            
		            success:function(data){  
		            	//alert(data)
		            	$('#txxPicURL').val(data);
		            },  
		            error:function(XMLHttpRequest, textStatus, errorThrown, data){  
		                alert(errorThrown);  
		            }              
		        });  
		    }  
		      
		    $("#uploadtxxd").click(function(){  
		    	
		        ajaxFileUplotxd();  
		    });     
		    
		    function ajaxFileUplotxdThuPicURL(){  
		        var formData = new FormData();  
		        formData.append('file',$("#fileuploadtxxThuPicURL")[0].files[0]);    // 将文件转成二进制形式
		       
		        $.ajax({  
		            type:"post",  
		            url:"  http://www.shoutike.com/STK/upload",  
		            async:false,  
		            contentType: false,    // 这个一定要写
		            processData: false, // 这个也一定要写，不然会报错
		            data:formData,  
		            dataType:'text',    // 返回类型，有json，text，HTML。这里并没有jsonp格式，所以别妄想能用jsonp做跨域了。
		            
		            success:function(data){  
		            	alert(data)
		            	$('#txxThuPicURL').val(data);
		            },  
		            error:function(XMLHttpRequest, textStatus, errorThrown, data){  
		                alert(errorThrown);  
		            }              
		        });  
		    }  
		      
		    $("#uploadtxxdThuPicURL").click(function(){  
		    	
		        ajaxFileUplotxdThuPicURL();  
		    	});
		     
		    
		 });
		    
		    </script>
		
		<div class="lis spms">
			<span>视频描述：</span>
			<textarea name="Remark" rows="" cols="" id="Remark">`+$('tbody .active').children().eq(4).children().html()+`</textarea>
		</div>
		
		<div class="lis sfsf">
			<span>是否收费：</span>
			<input type="radio" value="0" name="IsPrice" id="raa"/>否
			<input type="radio" value="1" name="IsPrice"  id="rab"/>是
		</div>
		
		<div class="lis sfsf">
			<span>是否推荐：</span>
			<input type="radio" value="0" name="fupin" id="fpa"/>否
			<input type="radio" value="1" name="fupin"  id="fpb"/>是
		</div>
		
		<div class="lis sfsf">
			<span>是否公开：</span>
			<input type="radio" value="0" name="publi" id="pua"/>否
			<input type="radio" value="1" name="publi"  id="pub"/>是		
		</div>
		
		<div class="lis pay">
			<span>价格：</span> <input type="text" value="`+$('tbody .active').children().eq(10).children().html()+`" name="RealPrice" id="RealPrice"/>
		</div>
		
		<div class="lis zhjq">
			<span>收藏：</span> <input type="text" value="`+$('tbody .active').children().eq(6).children().html()+`" name="Collection" id="Collection"/>
		</div>
		<div class="lis zhjq">
		<span>播放：</span> <input type="text" value="`+$('tbody .active').children().eq(7).children().html()+`" name="ClickRate" id="ClickRate"/>
	    </div>
	<div class="lis zhjq">
	<span>购买：</span> <input type="text" value="`+$('tbody .active').children().eq(8).children().html()+`" name="PmtsTot" id="PmtsTot"/>
</div>
<div class="lis zhjq">
<span>作者：</span> <input type="text" value="`+$('tbody .active').children().eq(17).children().html()+`" name="wt" id="wt"/>
</div>
	</div>
						
		`);
		$('#txxPicURL').val(pr);
		$('#txxThuPicURL').val(bgt);
		$("#xiugaibto").html(`
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="xqtxx()">修改</button>
				
				`);
		
	});
	
	
if(cos==0){
	
	$('#raa').attr('checked',true);
}
if(cos==1){
	
	$('#rab').attr('checked',true);
}
	
if(fp==0){
	
	$('#fpa').attr('checked',true);
}
if(fp==1){
	
	$('#fpb').attr('checked',true);
}

if(pu==0){
	
	$('#pua').attr('checked',true);
}
if(pu==1){
	
	$('#pub').attr('checked',true);
}
	
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
	 var curWwwPath=window.document.location.href;
	 var pathName=window.document.location.pathname;
	 var pos=curWwwPath.indexOf(pathName);
	 var localhostPaht=curWwwPath.substring(0,pos);
	 var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	
	var path=localhostPaht+projectName;
	
	$.ajax({
		url : ''+path+'/backdeletemp',
		type : "POST",

		data : {
			
			"ID" : id,
		},
		success : function(msg) {

			if (msg == "ok") {
				alert("删除成功");
				window.location.href=''+path+'/mpseries?id=189';
				
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
		str0 = $('tbody .active').children().eq(0).children().html();
		str1 = $('tbody .active').children().eq(2).children().html();

		$("#deletexq").html('您确定要删除'+str1+'的信息吗？');
	

$("#deletebtoxq").html(`
		<input type="hidden" value="${str0}" id="deleteID"/>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<button type="button" class="btn btn-primary" onclick="deleteco()">确定</button>
		
		
		`);
	});
});