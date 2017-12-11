package com.stk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.service.BackSeriesService;
import com.stk.service.SelTypeService;

@Controller
public class SelMuluController {

	protected Logger log = Logger.getLogger(SelMuluController.class);
	@Autowired
	private SelTypeService selTypeService;

	@Autowired
	private BackSeriesService backSeriesService;

	@RequestMapping(value = "/backml")
	public String menuindex(
			Map<String, Object> map,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
					List<Type> type2 = null;
					List<Type> type3 = null;
					
					ArrayList<Type> asd = new ArrayList<Type>();
			
					type2 = selTypeService.getMulver(id);
			
					for (int i = 0; i < type2.size(); i++) {
			
						type3 = selTypeService.getMulvsan(type2.get(i).getID());
			
						asd.addAll(type3);
					}
			
					PageHelper.startPage(page, 8);
					List<Series> ls = backSeriesService.selseries(id);
					PageInfo<Series> pageInfo = new PageInfo<Series>(ls);
					ls = pageInfo.getList();
			
					map.put("info", pageInfo);
					map.put("series", ls);
			
					map.put("typeb", type2);
					map.put("asd", asd);
					if (id == 188) {
						return "/iframepage/video/xqvideo.jsp";
					}
					if (id == 189) {
						return "/iframepage/video/xxvideo.jsp";
					}
					if (id == 190) {
						return "/iframepage/video/chvideo.jsp";
					}
					return null;

	}
	
	@RequestMapping(value = "/selvideocount")
	@ResponseBody
	public Integer selvideocount(Map<String, Object> map,@RequestParam(value = "id") Integer id){
		
					Integer count=backSeriesService.selvideocount(id);
					System.out.println(count+"000000000000000000000");
					return count;
					
		
	}

}
