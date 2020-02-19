package com.shop.dao;

import com.shop.pojo.Order;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    Order selectByPrimaryKey(Integer orderId);

    List<Order> selectAll();

    int updateByPrimaryKey(Order record);

	void insertorder(Order o1);

	List<Order> queryorderbyuserid(@Param(value="uid")String uid);

	int cancelorder(int oid);

	int finishorder(int oid);

	List<Order> queryallorder();
}