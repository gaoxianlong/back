package com.stk.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Order;
import com.stk.entity.Tixian;
import com.stk.entity.Users;
import com.stk.entity.Wxorder;
import com.stk.service.BackService;
import com.stk.service.OrderService;
import com.stk.util.MD5Util;

@Controller
public class OrderController {

	protected Logger log = Logger.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;

	@RequestMapping(value="/ordervip")

	public String ordervip(Map<String, Object> map,
			@RequestParam(value="page",required=false,defaultValue="1") Integer page) {
		
		 PageHelper.startPage(page, 15);
		 List<Wxorder> ls = orderService.selordervip();
		 PageInfo<Wxorder> pageInfo = new PageInfo<Wxorder>(ls);
		 ls = pageInfo.getList();
		 
		 map.put("viporder", ls);
		 map.put("info", pageInfo);
		  
		return "/iframepage/order/vipdeta.jsp";
		
	}
	
	@RequestMapping(value="/orderk")

	public String orderk(Map<String, Object> map,
			@RequestParam(value="page",required=false,defaultValue="1") Integer page) {
		
		 PageHelper.startPage(page, 15);
		 List<Order> ls = orderService.selorderk();
		 PageInfo<Order> pageInfo = new PageInfo<Order>(ls);
		 ls = pageInfo.getList();
		 
		 map.put("korder", ls);
		 map.put("info", pageInfo);
		 
		 
		return "/iframepage/order/kdeta.jsp";
		
	}
		
}
