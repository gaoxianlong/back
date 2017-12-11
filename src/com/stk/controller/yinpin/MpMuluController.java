package com.stk.controller.yinpin;

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
public class MpMuluController {

	protected Logger log = Logger.getLogger(MpMuluController.class);
	@Autowired
	private SelTypeService selTypeService;
	@Autowired
	private BackSeriesService backSeriesService;

	@RequestMapping(value = "/backmlmp")
	public String backmlmp(
			Map<String, Object> map,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
			List<Type> type = null;
			List<Type> type2 = null;
			type = selTypeService.getMulver(0);
			type2 = selTypeService.getMulvsan(id);
			PageHelper.startPage(page, 8);
			List<Series> ls = backSeriesService.selseries(id);
			PageInfo<Series> pageInfo = new PageInfo<Series>(ls);
			ls = pageInfo.getList();
			
			map.put("info", pageInfo);
			map.put("series", ls);
			map.put("type", type);
			map.put("typeb", type2);
		
			return "/iframepage/video/chvideo.jsp";
	
		

	}
	
	
}
