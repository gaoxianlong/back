package com.stk.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Playrecord;
import com.stk.entity.Series;
import com.stk.entity.Users;
import com.stk.service.BackUserService;
import com.stk.util.MD5Util;

@Controller
public class RecordController {

	protected Logger log = Logger.getLogger(RecordController.class);
	@Autowired
	private BackUserService backUserService;

	
	@RequestMapping(value = "/record")
	
	public String record(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
			@RequestParam(value="id") Integer id
			) {
		 PageHelper.startPage(page, 20);
		 
		 List<Playrecord> record=null;
		 record=backUserService.getvideodetaa(id);
		 PageInfo<Playrecord> pageInfo = new PageInfo<Playrecord>(record);
		 record = pageInfo.getList();
			
			map.put("info", pageInfo);
			map.put("playrecord", record);
			map.put("idss", id);
	
		return "/iframepage/user/recordseries.jsp";

	}

	
		


}
