var policyText = {
    "expiration": "2020-01-01T12:00:00.000Z", //设置该Policy的失效时间，超过这个失效时间之后，就没有办法通过这个policy上传文件了
    "conditions": [
    ["content-length-range", 0, 1048576000] // 设置上传文件的大小限制
    ]
};

var curWwwPath=window.document.location.href;
var pathName=window.document.location.pathname;
var pos=curWwwPath.indexOf(pathName);
var localhostPaht=curWwwPath.substring(0,pos);
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var path=localhostPaht+projectName;


var timestamp = Date.parse(new Date()); 

var myDate = new Date();  
var year=myDate.getFullYear().toString() ; 
var month=myDate.getMonth()+1;
month =(month<10 ? "0"+month:month).toString(); 
var day=myDate.getDate().toString() ;  

var ke=year+month+day;


accessid= 'aJjWwUSjpYtA25g3';
accesskey= 'naQPJcccQEYDoBJlRnO3TcmojNrCRL';
host = 'http://shoutike.oss-cn-beijing.aliyuncs.com';
function randomStringb(len) {
len = len || 32;
var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
var maxPos = $chars.length;
var pwd = '';
for (i = 0; i < len; i++) {
pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
}
return pwd;
}

var keyb=ke+'/'+randomStringb(10)+'.mp4';
var policyBase64 = Base64.encode(JSON.stringify(policyText))
message = policyBase64
var bytes = Crypto.HMAC(Crypto.SHA1, message, accesskey, { asBytes: true }) ;
var signature = Crypto.util.bytesToBase64(bytes);
var uploaderb = new plupload.Uploader({
	
	runtimes : 'html5,flash,silverlight,html4',
	browse_button : 'selectfilesb', 
    //runtimes : 'flash',
	container: document.getElementById('containerb'),
	flash_swf_url : ''+path+'/libjs/plupload-2.1.2/js/Moxie.swf',
	silverlight_xap_url : ''+path+'/libjs/plupload-2.1.2/js/Moxie.xap',

    url : host,

	multipart_params: {
		'Filename':  '${filename}',  
        'key' : keyb,
		'policy': policyBase64,
        'OSSAccessKeyId': accessid, 
        'success_action_status' : '200', //让服务端返回200,不然，默认会返回204
		'signature': signature,
		
	},

	init: {
		PostInit: function() {
			document.getElementById('ossfileb').innerHTML = '';
			document.getElementById('postfilesb').onclick = function() {
				uploaderb.start();
				return false;
			};
		},

		FilesAdded: function(up, files) {
			plupload.each(files, function(file) {
				document.getElementById('ossfileb').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ')<b></b>'
				+'</div>';
				 //key=ke+'/'+randomString(5)+'.mp4';
			});
		},

		UploadProgress: function(up, file) {
			var d = document.getElementById(file.id);
			d.getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
            
           // var prog = d.getElementsByTagName('div')[0];
			//var progBar = prog.getElementsByTagName('div')[0]
			//progBar.style.width= 2*file.percent+'px';
			//progBar.setAttribute('aria-valuenow', file.percent);
		},

		FileUploaded: function(up, file, info) {
            //alert(info.status)
            if (info.status >= 200 || info.status < 200)
            {
                document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = 'success';
				 document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = keyb;
				 
				
				
            }
            else
            {
                document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = info.response;
            } 
		},

		Error: function(up, err) {
			document.getElementById('console').appendChild(document.createTextNode("\nError xml:" + err.response));
		}
	}
});

uploaderb.init();

