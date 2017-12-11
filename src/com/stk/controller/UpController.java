package com.stk.controller;

import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;







import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;









import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.event.ProgressEvent;
import com.aliyun.oss.event.ProgressEventType;
import com.aliyun.oss.event.ProgressListener;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectRequest;
import com.aliyun.oss.model.PutObjectResult;
import com.aliyun.oss.model.SimplifiedObjectMeta;
import com.stk.entity.Backuser;
import com.stk.service.BackVideoService;
import com.stk.util.MD5Util;


@Controller
public class UpController {
	protected Logger log = Logger.getLogger(UpController.class);

	@Autowired
	private BackVideoService backVideoService;
	
	@RequestMapping(value="/selprogress")
	@ResponseBody
	public String selprogress() {
		
			String uplo=backVideoService.selprogress();
			return uplo;	
	}
	
	@RequestMapping(value="/zero")
	@ResponseBody
	public String zero() {
		
		backVideoService.upprogress("0%");			
			return "ok";	
	}
	
	@RequestMapping("/testFile")
	@ResponseBody
	public String testFile(@RequestParam("file") MultipartFile files,
			HttpServletRequest request,final HttpSession session,final HttpServletResponse response) {

		String path = null;
		String key=null;
		// endpoint以杭州为例，其它region请按实际情况填写
		String endpoint = "http://oss-cn-beijing.aliyuncs.com";
		// 云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用RAM子账号进行API访问或日常运维，请登录
		// https://ram.console.aliyun.com 创建
		String accessKeyId = "aJjWwUSjpYtA25g3";
		String accessKeySecret = "naQPJcccQEYDoBJlRnO3TcmojNrCRL";
		// 创建OSSClient实例
		// ClientConfiguration config = new ClientConfiguration();
		// config.setCrcCheckEnabled(true);
		OSSClient ossClient = new OSSClient(endpoint, accessKeyId,
				accessKeySecret);

		class PutObjectProgressListener implements ProgressListener {
			private long bytesWritten = 0;
			private long totalBytes = -1;
			private boolean succeed = false;

			@Override
			public void progressChanged(ProgressEvent progressEvent) {
				long bytes = progressEvent.getBytes();
				ProgressEventType eventType = progressEvent.getEventType();
				switch (eventType) {
				case TRANSFER_STARTED_EVENT:
					System.out.println("Start to upload......");
					System.out.println(bytes);
					break;
				case REQUEST_CONTENT_LENGTH_EVENT:
					this.totalBytes = bytes;
					System.out.println(this.totalBytes
							+ " bytes in total will be uploaded to OSS");
					break;
				case REQUEST_BYTE_TRANSFER_EVENT:
					this.bytesWritten += bytes;
					if (this.totalBytes != -1) {
						int percent = (int) (this.bytesWritten * 100.0 / this.totalBytes);
						System.out
								.println(bytes
										+ " bytes have been written at this time, upload progress: "
										+ percent + "%(" + this.bytesWritten
										+ "/" + this.totalBytes + ")");
						//session.setAttribute("pro", percent + "%(" + this.bytesWritten+"/" + this.totalBytes + ")");
						//String value=percent + "%(" + this.bytesWritten+")";
//						String name="pro";
//						 Cookie cookie = new Cookie("pro", "55");  
//				            cookie.setMaxAge(30 * 60);// 设置为30min  
//				            cookie.setPath("/");  
//				            System.out.println("已添加===============");  
//				            response.addCookie(cookie);  
				           // session.setAttribute("pro","55");
						String uplo=percent + "%";
						backVideoService.upprogress(uplo);
					} else {
						System.out
								.println(bytes
										+ " bytes have been written at this time, upload ratio: unknown"
										+ "(" + this.bytesWritten + "/...)");
					}
					break;
				case TRANSFER_COMPLETED_EVENT:
					this.succeed = true;
					System.out.println("Succeed to upload, "
							+ this.bytesWritten
							+ " bytes have been transferred in total");
					break;
				case TRANSFER_FAILED_EVENT:
					System.out.println("Failed to upload, " + this.bytesWritten
							+ " bytes have been transferred");
					break;
				default:
					break;
				}
			}

			public boolean isSucceed() {
				return succeed;
			}
		}

		try {

			long startTime = System.currentTimeMillis();

			String uniqueName = files.getOriginalFilename();// 得到文件名
			String uname = null;

			String mime = files.getContentType();
			uname = UUID.randomUUID().toString();

			String prefix = uniqueName
					.substring(uniqueName.lastIndexOf(".") + 1);// 获取文件的扩展名，比如
																// .gif
			Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");// 利用时间生成新文件名后再加扩展名生成完整名字
			SimpleDateFormat dateFormatb = new SimpleDateFormat("yyyyMMdd");
			String sa = dateFormat.format(date);
			String sb = dateFormatb.format(date);

			String rando=Util.getRandomString(5);
			String bucketName = "shoutike";
			key = "shoutikevideo" + "/" + sb + "/" + sa + rando + "." + prefix;

			InputStream inputStream = files.getInputStream();
			
			ObjectMetadata meta = new ObjectMetadata(); 
			meta.setContentLength(files.getSize());
            
			try {
				PutObjectResult result = ossClient
						.putObject(new PutObjectRequest(bucketName, key,
								inputStream, meta)
								.<PutObjectRequest> withProgressListener(new PutObjectProgressListener()));

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			inputStream.close();

			SimplifiedObjectMeta objectMeta = ossClient
					.getSimplifiedObjectMeta(bucketName, key);
			System.out.println("     ");
			System.out.println(objectMeta.getETag() + "     222222");

			URL url = ossClient.generatePresignedUrl(bucketName, key, date);
			System.out.println(meta.getContentMD5() + "0000服务器的MD5");
			System.out.println("     ");
			long endTime = System.currentTimeMillis();
			System.out.println("上传究竟用了多少时间："
					+ String.valueOf(endTime - startTime) + "ms");
			System.out.println("url:  " + url);

			path = url.toString();

		} catch (Exception e) {
			// TODO: handle exception
		}

		// 关闭client
		ossClient.shutdown();

		return key;

	}

	
	//mp3
	@RequestMapping("/upmp")
	@ResponseBody
	public String upmp(@RequestParam("file") MultipartFile files,
			HttpServletRequest request,final HttpSession session,final HttpServletResponse response) {

		String path = null;
		String key=null;
		// endpoint以杭州为例，其它region请按实际情况填写
		String endpoint = "http://oss-cn-beijing.aliyuncs.com";
		// 云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用RAM子账号进行API访问或日常运维，请登录
		// https://ram.console.aliyun.com 创建
		String accessKeyId = "aJjWwUSjpYtA25g3";
		String accessKeySecret = "naQPJcccQEYDoBJlRnO3TcmojNrCRL";
		// 创建OSSClient实例
		// ClientConfiguration config = new ClientConfiguration();
		// config.setCrcCheckEnabled(true);
		OSSClient ossClient = new OSSClient(endpoint, accessKeyId,
				accessKeySecret);

		class PutObjectProgressListener implements ProgressListener {
			private long bytesWritten = 0;
			private long totalBytes = -1;
			private boolean succeed = false;

			@Override
			public void progressChanged(ProgressEvent progressEvent) {
				long bytes = progressEvent.getBytes();
				ProgressEventType eventType = progressEvent.getEventType();
				switch (eventType) {
				case TRANSFER_STARTED_EVENT:
					System.out.println("Start to upload......");
					System.out.println(bytes);
					break;
				case REQUEST_CONTENT_LENGTH_EVENT:
					this.totalBytes = bytes;
					System.out.println(this.totalBytes
							+ " bytes in total will be uploaded to OSS");
					break;
				case REQUEST_BYTE_TRANSFER_EVENT:
					this.bytesWritten += bytes;
					if (this.totalBytes != -1) {
						int percent = (int) (this.bytesWritten * 100.0 / this.totalBytes);
						System.out
								.println(bytes
										+ " bytes have been written at this time, upload progress: "
										+ percent + "%(" + this.bytesWritten
										+ "/" + this.totalBytes + ")");
						String uplo=percent + "%";
						backVideoService.upprogress(uplo);
					} else {
						System.out
								.println(bytes
										+ " bytes have been written at this time, upload ratio: unknown"
										+ "(" + this.bytesWritten + "/...)");
					}
					break;
				case TRANSFER_COMPLETED_EVENT:
					this.succeed = true;
					System.out.println("Succeed to upload, "
							+ this.bytesWritten
							+ " bytes have been transferred in total");
					break;
				case TRANSFER_FAILED_EVENT:
					System.out.println("Failed to upload, " + this.bytesWritten
							+ " bytes have been transferred");
					break;
				default:
					break;
				}
			}

			public boolean isSucceed() {
				return succeed;
			}
		}
		try {

			long startTime = System.currentTimeMillis();

			String uniqueName = files.getOriginalFilename();// 得到文件名
			String uname = null;

			String mime = files.getContentType();
			uname = UUID.randomUUID().toString();

			String prefix = uniqueName
					.substring(uniqueName.lastIndexOf(".") + 1);// 获取文件的扩展名，比如
																// .gif
			Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");// 利用时间生成新文件名后再加扩展名生成完整名字
			SimpleDateFormat dateFormatb = new SimpleDateFormat("yyyyMMdd");
			String sa = dateFormat.format(date);
			String sb = dateFormatb.format(date);

			String random = "";  
		    /*随机数函数*/  
		    java.util.Random r=new java.util.Random();  
		    for(int i = 0;i<10;i++){  
		        /*生成36以内的随机数，不含36，并转化为36位*/  
		        random += Integer.toString(r.nextInt(36), 36);  
		    }  
			
			String rando=Util.getRandomString(5);
			String bucketName = "shoutike";
			key = "stkmp3" + "/" + sb + "/" + random + "." + prefix;

			InputStream inputStream = files.getInputStream();
			
			ObjectMetadata meta = new ObjectMetadata(); 
			meta.setContentLength(files.getSize());
            
			try {
				PutObjectResult result = ossClient
						.putObject(new PutObjectRequest(bucketName, key,
								inputStream, meta)
								.<PutObjectRequest> withProgressListener(new PutObjectProgressListener()));

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			inputStream.close();

			SimplifiedObjectMeta objectMeta = ossClient
					.getSimplifiedObjectMeta(bucketName, key);
			System.out.println("     ");
			System.out.println(objectMeta.getETag() + "     222222");

			

			URL url = ossClient.generatePresignedUrl(bucketName, key, date);
			System.out.println(meta.getContentMD5() + "0000服务器的MD5");
			System.out.println("     ");
			long endTime = System.currentTimeMillis();
			System.out.println("上传究竟用了多少时间："
					+ String.valueOf(endTime - startTime) + "ms");
			System.out.println("url:  " + url);

			path = url.toString();

		} catch (Exception e) {
			// TODO: handle exception
		}

		// 关闭client
		ossClient.shutdown();

		return key;

	}
	
}
