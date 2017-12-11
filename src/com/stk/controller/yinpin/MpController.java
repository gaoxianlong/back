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
public class MpController {

	protected Logger log = Logger.getLogger(MpController.class);
	@Autowired
	private SelTypeService selTypeService;
	@Autowired
	private BackSeriesService backSeriesService;
	@RequestMapping(value = "/mpseries")
	public String menuindex(
			Map<String, Object> map,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		List<Type> type2 = null;
		List<Type> type3 = null;
		ArrayList<Type> asd = new ArrayList<Type>();
		type2 = selTypeService.getMulvermp(0);
		for (int i = 0; i < type2.size(); i++) {
			type3 = selTypeService.getMulvsanmp(type2.get(i).getID());
			asd.addAll(type3);
		}
		PageHelper.startPage(page, 8);
		List<Series> ls = backSeriesService.selseriesmp(id);
		PageInfo<Series> pageInfo = new PageInfo<Series>(ls);
		ls = pageInfo.getList();
		map.put("info", pageInfo);
		map.put("series", ls);
		map.put("typeb", type2);
		map.put("asd", asd);
		if (id == 189) {
			return "/iframepage/video/mpseries.jsp";
		}	
		return null;
	}
}
