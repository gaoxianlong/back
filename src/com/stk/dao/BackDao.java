package com.stk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Tixian;
import com.stk.entity.Users;





public interface BackDao {

	public Backuser login(Backuser back);
	public List<Backcode> selcode();
	public void addcode(Backcode backcode);
	public void updatecode(Backcode backcode);
	public void deletecode(Integer id);
	public List<Backcode> selcodelik(String name);
	public Integer selcodetotal();
	public Integer selcodetotalfact();
	
	public Integer selusercode(String code);
	
	public List<Backcode> selcodenot(Integer id);
	
	public List<Backcode> selectList(@Param("ls")List ls);
	//提现表 
	public List<Tixian> seltixian();
	
	public Users seltixianuser(Integer id);
	
	public String selwxopenid(Integer id);
}
