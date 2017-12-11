package com.stk.dao;

import java.util.List;

import com.stk.entity.Series;
import com.stk.entity.Seriesmp;
import com.stk.entity.Seriesvideo;
import com.stk.entity.Users;





public interface BackSeriesDao {
//MP3
	public List<Series> selseriesmp(Integer id);
	public void addseriesmp(Series series);
	public boolean upseriesmp(Seriesmp series);
	public boolean backdeletemp(Integer id);
	public Seriesmp selseriesbyidmp(Integer id);
	public Integer selmpcount(Integer id);
//MP3

	public Series selseriesbyid(Integer id);
	public List<Series> selseries(Integer id);
	public void addseries(Series series);
	public boolean upseries(Series series);
	public boolean backdelete(Integer id);
	public Integer selvideocount(Integer id);
	
	
}
