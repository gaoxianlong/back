
package com.stk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.BackSeriesDao;
import com.stk.entity.Series;
import com.stk.entity.Seriesmp;
import com.stk.entity.Seriesvideo;


@Service
public class BackSeriesService {
	@Autowired
	private BackSeriesDao backSeriesDao;
//mp3
	public List<Series> selseriesmp(Integer id) {
		return backSeriesDao.selseriesmp(id);
	}
	public void addseriesmp(Series series){
		backSeriesDao.addseriesmp(series);
	}
	
	public boolean upseriesmp(Seriesmp series){
		return backSeriesDao.upseriesmp(series);
		
	}
	public boolean backdeletemp(Integer id){
		return backSeriesDao.backdeletemp(id);
	}
	
	public Seriesmp selseriesbyidmp(Integer id){
		
		return backSeriesDao.selseriesbyidmp(id);
	}

	public Integer selmpcount(Integer id){
		return backSeriesDao.selmpcount(id);
	}
//mp3
	public Series selseriesbyid(Integer id){
		
		return backSeriesDao.selseriesbyid(id);
	}
	public List<Series> selseries(Integer id) {
		return backSeriesDao.selseries(id);
	}
	public void addseries(Series series){
		backSeriesDao.addseries(series);
	}
	public boolean upseries(Series series){
		return backSeriesDao.upseries(series);	
	}
	public boolean backdelete(Integer id){
		return backSeriesDao.backdelete(id);
	}
	public Integer selvideocount(Integer id){
		return backSeriesDao.selvideocount(id);
	}

}
