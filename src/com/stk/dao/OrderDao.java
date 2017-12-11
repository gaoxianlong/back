package com.stk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Order;
import com.stk.entity.Tixian;
import com.stk.entity.Users;
import com.stk.entity.Wxorder;





public interface OrderDao {

	
	public List<Wxorder> selordervip();
	public List<Order> selorderk();
	
}
