package com.stk.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Series;
import com.stk.entity.Seriesmp;
import com.stk.entity.Users;
import com.stk.service.BackSeriesService;
import com.stk.service.BackUserService;
import com.stk.util.MD5Util;

@Controller
public class BackSeriesController {

	protected Logger log = Logger.getLogger(BackSeriesController.class);
	@Autowired
	private BackSeriesService backSeriesService;
//MP3
	
	 	@RequestMapping(value = "/addseriesmp")
		@ResponseBody
		public String addseriesmp(Series series) {
			try {
				java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
				series.setPublishTime(nowSql);
				backSeriesService.addseriesmp(series);
			} catch (Exception e) {
				// TODO: handle exception
				return "fal";
			}
			return "ok";
		}
	
	 //MP3
	//注入model
			@ModelAttribute
			public void getSeries(
					@RequestParam(value = "ID", required = false) Integer ID,
					Map<String, Object> map) {
				log.info("0000000000000000000000000000");
				if (ID != null) {
					log.info("jinjinjinjinjinjinijinjinjinijin");
					Series ser=backSeriesService.selseriesbyid(ID);
					log.info(ser.toString());
					map.put("series", ser);	
				}
			}
	@RequestMapping(value = "/selSeries")
	public String selSeries(Map<String, Object> map,
			@RequestParam(value="page",required=false,defaultValue="1") Integer page,
			@RequestParam(value="id",required=false) Integer id
			
			) {

		 PageHelper.startPage(page, 25);
		 List<Series> ls = backSeriesService.selseries(id);
		 PageInfo<Series> pageInfo = new PageInfo<Series>(ls);
		 ls = pageInfo.getList();
		
		 map.put("info", pageInfo);
		 map.put("series", ls);

		 return "/iframepage/video/xqvideo.jsp";

	}
	@RequestMapping(value = "/jsonSeries")
	@ResponseBody
	public Series jsonSeries(Map<String, Object> map,
			@RequestParam(value="id",required=false) Integer id		
			) {

		Series series = backSeriesService.selseriesbyid(id);
		return series;
	}
	 @RequestMapping(value = "/upload")  
	 @ResponseBody
	    public String upload(@RequestParam(value = "file") MultipartFile file, HttpServletRequest request) {  
	        System.out.println("开始");  
	        String path = request.getSession().getServletContext().getRealPath("cover");  
	        String uniqueName = file.getOriginalFilename(); 
	        String prefix = uniqueName
					.substring(uniqueName.lastIndexOf(".") + 1);
	        Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");// 利用时间生成新文件名后再加扩展名生成完整名字
			String sa = dateFormat.format(date);
			String key =sa + "." + prefix;
//	        String fileName = new Date().getTime()+".jpg";  
	        System.out.println(path);  
	        File targetFile = new File(path, key);  
	        
	        //保存  
	        try {  
	            file.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        return key;  
	    }  
	    @RequestMapping(value = "/addbackcourse")
		@ResponseBody
		public String addcode(Series series) {
			try {
				java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
				series.setPublishTime(nowSql);
				backSeriesService.addseries(series);
			} catch (Exception e) {
				// TODO: handle exception
				return "fal";
			}
			return "ok";
		}
	    	@RequestMapping(value = "/upseries")
	  		@ResponseBody
	  		public String upseries(Series series,@RequestParam(value = "ID", required = false) Integer ID) {
	  				
	  			boolean flag=backSeriesService.upseries(series);
	  			if(flag){
	  				return "ok";
	  			}else{
	  				return "fal";
	  			}
	  			
	  		}
	    
	    @RequestMapping(value = "/backdelete")
  		@ResponseBody
  		public String backdelete(@RequestParam("ID") int ID) {
  				
  			boolean flag=backSeriesService.backdelete(ID);
  			if(flag){
  				return "ok";
  			}else{
  				return "fal";
  			}
  		}
}
