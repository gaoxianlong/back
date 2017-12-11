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
import com.stk.entity.Series;
import com.stk.entity.Users;
import com.stk.service.BackUserService;
import com.stk.util.MD5Util;

@Controller
public class BackUserController {

	protected Logger log = Logger.getLogger(BackUserController.class);
	@Autowired
	private BackUserService backUserService;

	
	@RequestMapping(value = "/selbackuser")
	public String selbackuser(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page) {

		 PageHelper.startPage(page, 20);
		 List<Users> ls = backUserService.selbackuser();
		 PageInfo<Users> pageInfo = new PageInfo<Users>(ls);
		 ls = pageInfo.getList();
		 log.info(ls.size()+"0000000");
		 map.put("info", pageInfo);
		 map.put("user", ls);

		return "/iframepage/user/myuser.jsp";

	}
	@RequestMapping(value = "/selbackuserbycode")
	public String selbackuserbycode(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
			@RequestParam(value="HelpCode") String HelpCode) {

		 PageHelper.startPage(page, 20);
		 List<Users> ls = backUserService.selbackuserbycode(HelpCode);
		 PageInfo<Users> pageInfo = new PageInfo<Users>(ls);
		 ls = pageInfo.getList();
		
		 map.put("info", pageInfo);
		 map.put("user", ls);

		return "/iframepage/fpschool/yhmgl/yhmgl.jsp";

	}
	
	
	@RequestMapping(value = "/seluserlik")
	public String seluserlik(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
			@RequestParam(value="name") String name) {

		List<Users> ls = backUserService.seluserlik(name);
		map.put("user", ls);
		return "/iframepage/user/searchdetuser.jsp";

	}
	//查询代言人
	@RequestMapping(value = "/seldaiyan")
	public String seldaiyan(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
			@RequestParam(value="id") Integer id) {
				String pro="a";
				List<String> openid=null;
				List<Integer> openidid=null;
				List<Users> ls = null;
		
				try {
					pro=backUserService.selpro(id);
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					if(!pro.equals("a")){
						openid=backUserService.selproopenid(pro);
						System.out.println(openid+"555555555555");
					}
					if(openid != null){
						openidid=backUserService.selproopenidid(openid);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				 PageHelper.startPage(page, 20);
				 if(openidid != null){ 
					 ls=backUserService.selprouser(openidid);
				 }
				
				PageInfo<Users> pageInfo = new PageInfo<Users>(ls);
				ls = pageInfo.getList();
				
				map.put("info", pageInfo);
				map.put("user", ls);
				map.put("idss", id);
				return "/iframepage/user/daiyanuser.jsp";

	}
	//查询播放记录 old
			@RequestMapping(value = "/playrecordold")
			public String playrecordold(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
					@RequestParam(value="id") Integer id) {
				
				List<Integer> lsvid=null;
				List<Integer> lssid=null;
				List<Series> ls=null;
				try {
					lsvid=backUserService.playvid(id);
				if(lsvid !=null){
					lssid=backUserService.playsid(lsvid);	
				}
				
				 PageHelper.startPage(page, 20);
				 if(lssid != null){ 
					 ls=backUserService.series(lssid);
				 }
				} catch (Exception e) {
					// TODO: handle exception
					}
				PageInfo<Series> pageInfo = new PageInfo<Series>(ls);
				ls = pageInfo.getList();
				
				map.put("info", pageInfo);
				map.put("series", ls);
				map.put("idss", id);
				return "/iframepage/user/series.jsp";
			}
	
	//查询播放记录 new 
		@RequestMapping(value = "/playrecord")
		public String playrecord(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
				@RequestParam(value="id") Integer id) {
			
				List<Integer> lsvid=null;
				List<Integer> lssid=null;
				List<Series> ls=null;
				
				try {
					lsvid=backUserService.playvid(id);
				if(lsvid !=null){
					lssid=backUserService.playsid(lsvid);	
				}
				 PageHelper.startPage(page, 20);
				 if(lssid != null){ 
					 ls=backUserService.series(lssid);
				 	}
				} catch (Exception e) {
					// TODO: handle exception
					}
				PageInfo<Series> pageInfo = new PageInfo<Series>(ls);
				ls = pageInfo.getList();
				
				map.put("info", pageInfo);
				map.put("series", ls);
				map.put("idss", id);
				return "/iframepage/user/series.jsp";

		}


}
