package com.stk.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PublicMethod.SignatuMethod;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.common.utils.BinaryUtil;
import com.aliyun.oss.model.MatchMode;
import com.aliyun.oss.model.PolicyConditions;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Dis;
import com.stk.entity.Series;
import com.stk.entity.Seriesvideo;
import com.stk.service.BackService;
import com.stk.service.BackVideoService;
import com.stk.util.MD5Util;

@Controller
public class BackVideoController {

	protected Logger log = Logger.getLogger(BackVideoController.class);
	@Autowired
	private BackVideoService backVideoService;
//MP3
	
		@RequestMapping(value = "/selvideomp")
		public String selvideomp(Map<String, Object> map,
		@RequestParam(value="page",required=false,defaultValue="1") Integer page,
		@RequestParam(value = "id", required = false) Integer id,
		HttpServletRequest request, HttpServletResponse response

		) throws UnsupportedEncodingException {

			 PageHelper.startPage(page, 8);
			 List<Seriesvideo> ls = backVideoService.getvideomp(id);
			 PageInfo<Seriesvideo> pageInfo = new PageInfo<Seriesvideo>(ls);
			 ls = pageInfo.getList();
			 
			map.put("info", pageInfo);
			map.put("video", ls);
			map.put("sid", id);
		    map.put("disid", id);
		    System.out.println(ls.size()+"55555555555555555555555555555555555555");
		     System.out.println("66666666666666666666666666666666666666666666666");
			return "/iframepage/video/gl/glmpvideo.jsp";
	          
		}
		
		@RequestMapping(value = "/addaccountvideomp")
		@ResponseBody
		public Dis addaccountvideomp(Seriesvideo seriesvideo) {

			java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
			seriesvideo.setCreateTime(nowSql);
			boolean flag = backVideoService.addaccountvideomp(seriesvideo);

			if (flag) {
				Dis dis=new Dis();
				dis.setId(1);
				dis.setSid(seriesvideo.getSID());
				return dis;
			} else {
				Dis dis=new Dis();
				dis.setId(0);
				dis.setSid(seriesvideo.getSID());
				return dis;
			}

		}
		
		
		@RequestMapping(value = "/upvideomp")
		@ResponseBody
		public Dis upvideomp(Seriesvideo seriesvideo) {

			java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
			seriesvideo.setCreateTime(nowSql);
			boolean flag = backVideoService.upvideomp(seriesvideo);

			if (flag) {
				Dis dis=new Dis();
				dis.setId(1);
				dis.setSid(seriesvideo.getSID());
				return dis;
			} else {
				Dis dis=new Dis();
				dis.setId(0);
				dis.setSid(seriesvideo.getSID());
				return dis;
			}

		}
		
		@RequestMapping(value = "/deletevideomp")
		@ResponseBody
		public Dis deletevideomp(@RequestParam(value = "id", required = false) Integer id,
				@RequestParam(value = "sid", required = false) Integer sid,
				@RequestParam(value = "url", required = false) String url
				) {

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
			String bucketName = "shoutike";
			
			boolean flag = backVideoService.deletevideomp(id);

			if (flag) {
				ossClient.deleteObject(bucketName, url);
				// 关闭client
				ossClient.shutdown();
				Dis dis=new Dis();
				dis.setId(1);
				dis.setSid(sid);
				return dis;
			} else {
				Dis dis=new Dis();
				dis.setId(0);
				dis.setSid(sid);
				return dis;
			}
		}	
		
//MP3
	@RequestMapping(value = "/selvideo")
	public String selvideo(Map<String, Object> map,
	@RequestParam(value="page",required=false,defaultValue="1") Integer page,
	@RequestParam(value = "id", required = false) Integer id

	) {

		PageHelper.startPage(page, 8);
		List<Seriesvideo> ls = backVideoService.getvideo(id);
		PageInfo<Seriesvideo> pageInfo = new PageInfo<Seriesvideo>(ls);
		ls = pageInfo.getList();
		
		map.put("info", pageInfo);
		map.put("video", ls);
		map.put("sid", id);
	
		return "/iframepage/video/gl/glxqvideo.jsp";

	}
	
	//xiaoxue
	
	@RequestMapping(value = "/selvideoxiao")
	public String selvideoxiao(Map<String, Object> map,
	@RequestParam(value="page",required=false,defaultValue="1") Integer page,
	@RequestParam(value = "id", required = false) Integer id,
	HttpServletRequest request, HttpServletResponse response

	) throws UnsupportedEncodingException {

		 PageHelper.startPage(page, 16);
		 List<Seriesvideo> ls = backVideoService.getvideo(id);
		 PageInfo<Seriesvideo> pageInfo = new PageInfo<Seriesvideo>(ls);
		 ls = pageInfo.getList();
		 
		map.put("info", pageInfo);
		map.put("video", ls);
		map.put("sid", id);
	    map.put("disid", id);
	    
		return "/iframepage/video/gl/glxxvideo.jsp";
          
	}

	@RequestMapping(value = "/addaccountvideo")
	@ResponseBody
	public Dis addaccountvideo(Seriesvideo seriesvideo) {

		java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
		seriesvideo.setCreateTime(nowSql);
		boolean flag = backVideoService.addaccountvideo(seriesvideo);

		if (flag) {
			Dis dis=new Dis();
			dis.setId(1);
			dis.setSid(seriesvideo.getSID());
			return dis;
		} else {
			Dis dis=new Dis();
			dis.setId(0);
			dis.setSid(seriesvideo.getSID());
			return dis;
		}

	}
	
	//xiugai
	
	@RequestMapping(value = "/upvideo")
	@ResponseBody
	public Dis upvideo(Seriesvideo seriesvideo) {

		java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
		seriesvideo.setCreateTime(nowSql);
		boolean flag = backVideoService.upvideo(seriesvideo);
		if (flag) {
			Dis dis=new Dis();
			dis.setId(1);
			dis.setSid(seriesvideo.getSID());
			return dis;
		} else {
			Dis dis=new Dis();
			dis.setId(0);
			dis.setSid(seriesvideo.getSID());
			return dis;
		}

	}
	
	//delete
	
	@RequestMapping(value = "/deletevideo")
	@ResponseBody
	public Dis deletevideo(@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "sid", required = false) Integer sid,
			@RequestParam(value = "url", required = false) String url
			) {

		
		
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
		String bucketName = "shoutike";
		
		boolean flag = backVideoService.deletevideo(id);

		if (flag) {
			ossClient.deleteObject(bucketName, url);
			// 关闭client
			ossClient.shutdown();
			Dis dis=new Dis();
			dis.setId(1);
			dis.setSid(sid);
			return dis;
		} else {
			Dis dis=new Dis();
			dis.setId(0);
			dis.setSid(sid);
			return dis;
		}	

	}

}
