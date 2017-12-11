package com.stk.entity;

import java.sql.Date;

public class Backcode {

	private int ID;
	private String Schools;
	private String HelpCode;
	public int Num; 
	private Date CreateTime;
	private String quan;
	private int total;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(Date createTime) {
		CreateTime = createTime;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getSchools() {
		return Schools;
	}
	public void setSchools(String schools) {
		Schools = schools;
	}
	public String getHelpCode() {
		return HelpCode;
	}
	public void setHelpCode(String helpCode) {
		HelpCode = helpCode;
	}
	public int getNum() {
		return Num;
	}
	public void setNum(int num) {
		Num = num;
	}
	
	public String getQuan() {
		return quan;
	}
	public void setQuan(String quan) {
		this.quan = quan;
	}
	@Override
	public String toString() {
		return "Backcode [ID=" + ID + ", Schools=" + Schools + ", HelpCode="
				+ HelpCode + ", Num=" + Num + ", CreateTime=" + CreateTime
				+ ", quan=" + quan + "]";
	}
	
	
	
}
