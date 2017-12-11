package com.stk.dao;

import java.util.List;

import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Seriesvideo;





public interface BackVideoDao {
//MP3
	public List<Seriesvideo> getvideomp(Integer id);
	public boolean addaccountvideomp(Seriesvideo seriesvideo);
	public boolean upvideomp(Seriesvideo seriesvideo);
	public boolean deletevideomp(Integer id);
//MP3
	public List<Seriesvideo> getvideo(Integer id);
	public boolean addaccountvideo(Seriesvideo seriesvideo);
	public boolean upvideo(Seriesvideo seriesvideo);
	public boolean deletevideo(Integer id);
	public boolean upprogress(String uplo);
	public String selprogress();
	
}
