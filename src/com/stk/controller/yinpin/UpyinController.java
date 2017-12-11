package com.stk.controller.yinpin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Series;
import com.stk.entity.Seriesmp;
import com.stk.entity.Type;
import com.stk.service.BackSeriesService;
import com.stk.service.SelTypeService;

@Controller
public class UpyinController {

	protected Logger log = Logger.getLogger(UpyinController.class);
	
	@Autowired
	private BackSeriesService backSeriesService;
	@ModelAttribute
	public void getSeriesmp(
			@RequestParam(value = "ID", required = false) Integer ID,
			Map<String, Object> map) {
		if (ID != null) {
			log.info("jinjinjinjinjinjinijinjinjinijin");
			Seriesmp sermp=backSeriesService.selseriesbyidmp(ID);
			map.put("seriesmp", sermp);
		}
	}
	 	@RequestMapping(value = "/upseriesmp")
		@ResponseBody
		public String upseriesmp(Seriesmp seriesmp,@RequestParam(value = "ID", required = false) Integer ID) {
				
			boolean flag=backSeriesService.upseriesmp(seriesmp);
			if(flag){
				return "ok";
			}else{
				return "fal";
			}
		}
	 
	 	@RequestMapping(value = "/backdeletemp")
		@ResponseBody
		public String backdeletemp(@RequestParam("ID") int ID) {
		
			boolean flag=backSeriesService.backdeletemp(ID);
			if(flag){
				return "ok";
			}else{
				return "fal";
			}
		}
	 
	 	@RequestMapping(value = "/selmpcount")
		@ResponseBody
		public Integer selmpcount(Map<String, Object> map,@RequestParam(value = "id") Integer id){
			
			Integer count=backSeriesService.selmpcount(id);
			System.out.println(count+"000000000000000000000");
			return count;	
		}
}
