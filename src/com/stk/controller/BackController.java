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
import com.stk.entity.Tixian;
import com.stk.entity.Users;
import com.stk.service.BackService;
import com.stk.util.MD5Util;

@Controller
public class BackController {

	protected Logger log = Logger.getLogger(BackController.class);
	@Autowired
	private BackService backService;

	@RequestMapping(value="/loginadmin")
	@ResponseBody
	public String loginadmin(Backuser back) {
		
			String pass=MD5Util.getMD5String(back.getPasswd());
			
			Backuser ba=new Backuser();
			ba.setName(back.getName());
			ba.setPasswd(pass);
			if(backService.login(ba) !=null)
			{
			
				return "ok";
			}else{
				return "fal"; 
			}	
	}

	//login
	
	@RequestMapping(value="/log")
	public String log() {
		
			return "WEB-INF/index/index.html";
	}

	//like
	
	
	@RequestMapping(value = "/selbackcodelike")
	public String selbackcodelike(Map<String, Object> map,@RequestParam(value="name") String name) {

		log.info(name+"0200000");
		List<Backcode> ls = backService.selcodelik(name);
		
		map.put("code", ls);
        map.put("dis", 0);
		return "/iframepage/fpschool/fpschool.jsp";

	}
	
	
	
	@RequestMapping(value = "/selbackcode")
	public String selbackcode(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page) {

		 PageHelper.startPage(page, 15);
		List<Backcode> ls = backService.selcode();
		 PageInfo<Backcode> pageInfo = new PageInfo<Backcode>(ls);
		 ls = pageInfo.getList();
		 
		 int total=backService.selcodetotal();
		 int totalfact=backService.selcodetotalfact();
		 int fact=totalfact-total;
		 map.put("fact", fact);
		 map.put("total", total);
		 map.put("info", pageInfo);
		map.put("code", ls);
		map.put("dis", 1);
		return "/iframepage/fpschool/fpschool.jsp";

	}

	@RequestMapping(value = "/addcode")
	@ResponseBody
	public String addcode(Backcode backcode) {
		try {

			java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
			backcode.setCreateTime(nowSql);
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");// 设置日期格式
			String a = df.format(new Date());// new Date()为获取当前系统时间
			int b = (int) ((Math.random() * 9 + 1) * 10000);
			String s = String.valueOf(b);
			String key = "STK" + a + s;
			backcode.setHelpCode(key);
			backService.addcode(backcode);
		} catch (Exception e) {
			// TODO: handle exception
			return "fal";
		}
		return "ok";
	}

	// txsave
	@RequestMapping(value = "/txsave")
	@ResponseBody
	public String txsave(Backcode backcode) {
		try {
			
			backService.updatecode(backcode);
		} catch (Exception e) {
			// TODO: handle exception
			return "fal";
		}

		return "ok";

	}
	// deletecode
		@RequestMapping(value = "/deletecode")
		@ResponseBody
		public String deletecode(@RequestParam("ID") int ID) {
			try {
				
				backService.deletecode(ID);
			} catch (Exception e) {
				// TODO: handle exception
				return "fal";
			}

			return "ok";

		}
		
		
		
		
		
		@RequestMapping(value = "/selcodenotuse")
		public String selcodenotuse(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,HttpSession session) {

			ArrayList<Integer> ids=new ArrayList<Integer>();
			//ids=(ArrayList<Integer>) session.getAttribute("ids");
			
				
			
			ArrayList<Backcode> codelist = new ArrayList<Backcode>();
			//List codelist=null;
			List<Backcode> ls = backService.selcode();
			for(int i=0;i<ls.size();i++){
				
				if(backService.selusercode(ls.get(i).getHelpCode())){
					codelist.add(ls.get(i));
					
				}
			}
			
			for(int i=0;i<codelist.size();i++){
				//ids.add(codelist.get(i).getID());
				ids.add(codelist.get(i).getID());
				//System.out.println(codelist.get(i).getID());
			}
			//session.setAttribute("ids", ids);
			System.out.println(ids.size()+"0000000000000000000000000000000000000000000000000000");
			
			//System.out.println(codelist.size()+"5555555555555555555555555555555555555555555555555555555555555555555555");
			
			//map.put("code", codelist);
			
			
			 PageHelper.startPage(page, 20);
			 
			 
			 
			 List<Backcode> lsnot = backService.selectList(ids);
			
			
			
			 PageInfo<Backcode> pageInfo = new PageInfo<Backcode>(lsnot);
			 ls = pageInfo.getList();
			 
			 int total=backService.selcodetotal();
			 int totalfact=backService.selcodetotalfact();
			 int fact=totalfact-total;
			 map.put("fact", fact);
			 map.put("total", total);
			 map.put("info", pageInfo);
			map.put("code", ls);
			map.put("dis", 1);
			return "/iframepage/fpschool/yhmgl/notschool.jsp";

		}
		
		
		
		
		@RequestMapping(value = "/down")
		public ModelAndView dowm(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,HttpSession session) {

			ArrayList<Integer> ids=new ArrayList<Integer>();
			
			
				
			
			ArrayList<Backcode> codelist = new ArrayList<Backcode>();
			
			List<Backcode> ls = backService.selcode();
			for(int i=0;i<ls.size();i++){
				
				if(backService.selusercode(ls.get(i).getHelpCode())){
					codelist.add(ls.get(i));
					
				}
			}
			
			for(int i=0;i<codelist.size();i++){
				
				ids.add(codelist.get(i).getID());
				
			}
			
			 List<Backcode> lsnot = backService.selectList(ids);
			
			    Map<String, Object> model = new HashMap<>();
		        model.put("userList", lsnot);
		        return new ModelAndView(new HelloView(), model);
			

		}
		
		//提现Controller
		@RequestMapping(value = "/seltixian")
		public String seltixian(Map<String, Object> map,@RequestParam(value="page",required=false,defaultValue="1") Integer page,HttpSession session) {

			 List<Tixian> ls=null;
			 PageHelper.startPage(page, 15);
			 List<Tixian> tixian = backService.seltixian();
			 PageInfo<Tixian> pageInfo = new PageInfo<Tixian>(tixian);
			 ls = pageInfo.getList();
			 
			
			 
			map.put("info", pageInfo);
			map.put("tixian", ls);
			
			return "/iframepage/tixian/tixiandeta.jsp";

		}
		
		//查看微信openid
				@RequestMapping(value = "/wxopenid")
				public String wxopenid(Map<String, Object> map,@RequestParam(value="id") Integer id) {

					Users user=(Users) backService.seltixianuser(id);
					System.out.println(user.toString());
					Integer wxid=user.getWXopendID();
					
					String wxopenid=backService.selwxopenid(wxid);
					
					 
				
					map.put("wxopenid", wxopenid);
					map.put("user", user);
					return "/iframepage/tixian/tuser.jsp";

				}
		
}
