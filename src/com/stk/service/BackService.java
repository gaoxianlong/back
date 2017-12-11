package com.stk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.BackDao;
import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Tixian;
import com.stk.entity.Users;

@Service
public class BackService {
	@Autowired
	private BackDao backdao;

	//提现表 
	public List<Tixian> seltixian(){
		return 	backdao.seltixian();
	}
	
	public boolean selusercode(String code){
		return backdao.selusercode(code)==0;
	}
	
	public List<Backcode> selcodenot(Integer id){
		return backdao.selcodenot(id);
		
	}
	
	public Backuser login(Backuser back) {

		return backdao.login(back);
	}

	public List<Backcode> selcode() {
		return backdao.selcode();
	}
	
	
	public List<Backcode> selectList(List ls){
		return backdao.selectList(ls);
	}

	public void addcode(Backcode backcode) {
		backdao.addcode(backcode);
	}

	public void updatecode(Backcode backcode) {
		backdao.updatecode(backcode);
	}

	public void deletecode(Integer id) {
		backdao.deletecode(id);
	}
	public List<Backcode> selcodelik(String name){
		return backdao.selcodelik(name);
		
	}
	public Integer selcodetotal(){
		return backdao.selcodetotal();
	}
	public Integer selcodetotalfact(){
		return backdao.selcodetotalfact();
	}
	
	public Users seltixianuser(Integer ID){
		return backdao.seltixianuser(ID);
	}
	public String selwxopenid(Integer id){
		return backdao.selwxopenid(id);
	}
}
