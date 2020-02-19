package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.OrderMapper;
import com.shop.pojo.Order;

@Service
public class OrderService {

	@Autowired
	OrderMapper orderMapper;
	
	public void insertorder(Order o1) {
		orderMapper.insertorder(o1);
	}

	public List<Order> queryorderbyuserid(String uid) {
	
		return orderMapper.queryorderbyuserid(uid);
	}

	public boolean cancelorder(int oid) {
		
		return orderMapper.cancelorder(oid)==1;
	}

	public boolean finishorder(int oid) {
		
		return orderMapper.finishorder(oid)==1;
	}

	public List<Order> queryallorder() {
		
		return orderMapper.queryallorder();
	}

	public boolean deleteorderbyid(int oid) {
		
		return orderMapper.deleteByPrimaryKey(oid)==1;
	}

	public Order queryorderbyoid(int oid) {
		
		return orderMapper.selectByPrimaryKey(oid);
	}

	public boolean updateorder(Order order) {
		
		return orderMapper.updateByPrimaryKey(order)==1;
	}

	
}
