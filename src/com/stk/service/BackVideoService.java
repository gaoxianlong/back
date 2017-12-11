package com.stk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.BackDao;
import com.stk.dao.BackVideoDao;
import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Seriesvideo;

@Service
public class BackVideoService {
	@Autowired
	private BackVideoDao backVideoDao;
//MP3
	
	public List<Seriesvideo> getvideomp(Integer id){
			return backVideoDao.getvideomp(id);	
	}
	
	public boolean addaccountvideomp(Seriesvideo seriesvideo){
		return backVideoDao.addaccountvideomp(seriesvideo);
	}
	
	public boolean upvideomp(Seriesvideo seriesvideo){
		return backVideoDao.upvideomp(seriesvideo);
	}
	public boolean deletevideomp(Integer id){
		return backVideoDao.deletevideomp(id);	
	}

//MP3
	public List<Seriesvideo> getvideo(Integer id){
		return backVideoDao.getvideo(id);	
	}
	public boolean addaccountvideo(Seriesvideo seriesvideo){
		return backVideoDao.addaccountvideo(seriesvideo);
	}
	public boolean upvideo(Seriesvideo seriesvideo){
		return backVideoDao.upvideo(seriesvideo);
	}
	public boolean deletevideo(Integer id){
		return backVideoDao.deletevideo(id);	
	}
	public boolean upprogress(String uplo){	
		return backVideoDao.upprogress(uplo);
	}
	public String selprogress(){
		return backVideoDao.selprogress();
	}

}
