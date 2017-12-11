
package com.stk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.BackUserDao;
import com.stk.entity.Playrecord;
import com.stk.entity.Series;
import com.stk.entity.Users;

@Service
public class BackUserService {
	@Autowired
	private BackUserDao backUserDao;

	
	public List<Users> selbackuser() {
		return backUserDao.selbackuser();
	}
	
	public List<Users> selbackuserbycode(String HelpCode){
		return backUserDao.selbackuserbycode(HelpCode);
	}
	
	public List<Users> seluserlik(String name){
		return backUserDao.seluserlik(name);
	}
	public String selpro(Integer id){
		return backUserDao.selpro(id);
	}
	public List<String> selproopenid(String prolocutor){
		return backUserDao.selproopenid(prolocutor);
	}
	public List<Integer> selproopenidid(List ls){
		return backUserDao.selproopenidid(ls);
	}
	public List<Users> selprouser(@Param("ls")List ls){
		return backUserDao.selprouser(ls);
	}
	public List<Integer> playvid(Integer uid){
		return backUserDao.playvid(uid);
	}
	public List<Integer> playsid(@Param("ls")List ls){
		return backUserDao.playsid(ls);
	}
	public List<Series> series(@Param("ls")List ls){
		return backUserDao.series(ls);
	}

	public List<Playrecord> getvideodeta(Integer id){
		return backUserDao.getvideodeta(id);
	}
	
	public List<Playrecord> getvideodetaa(Integer id){
		return backUserDao.getvideodetaa(id);
	}
}
