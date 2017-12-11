package com.stk.util;

import com.aliyun.oss.OSSClient;

public class OssUtil {
	
	// endpoint以杭州为例，其它region请按实际情况填写
	private String endpoint = "http://oss-cn-beijing.aliyuncs.com";
	// 云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用RAM子账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建
	private String accessKeyId = "aJjWwUSjpYtA25g3";
	private String accessKeySecret = "naQPJcccQEYDoBJlRnO3TcmojNrCRL";
	// 创建OSSClient实例
	
	 OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
	
//	public static  OSSClient getOSSClient(){
//		
//		//ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
//		return ossClient;
//		
//	}
	


}
