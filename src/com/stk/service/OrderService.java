package com.stk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.BackDao;
import com.stk.dao.OrderDao;
import com.stk.entity.Backcode;
import com.stk.entity.Backuser;
import com.stk.entity.Order;
import com.stk.entity.Tixian;
import com.stk.entity.Users;
import com.stk.entity.Wxorder;

@Service
public class OrderService {
	@Autowired
	private OrderDao orderDao;

	public List<Wxorder> selordervip(){
		return orderDao.selordervip();
	}
	public List<Order> selorderk(){
		return orderDao.selorderk();
	}
	
}
