package com.stk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stk.entity.Playrecord;
import com.stk.entity.Series;
import com.stk.entity.Users;





public interface BackUserDao {


	public List<Users> selbackuser();
	
	public List<Users> selbackuserbycode(String HelpCode);
	public List<Users> seluserlik(String name);
	public String selpro(Integer id);
	public List<String> selproopenid(String prolocutor);
	public List<Integer> selproopenidid(@Param("ls")List ls);
	public List<Users> selprouser(@Param("ls")List ls);
	public List<Integer> playvid(Integer uid);
	public List<Integer> playsid(@Param("ls")List ls);
	public List<Series> series(@Param("ls")List ls);
	public List<Playrecord> getvideodeta(Integer id);
	public List<Playrecord> getvideodetaa(Integer id);
	
	
}
