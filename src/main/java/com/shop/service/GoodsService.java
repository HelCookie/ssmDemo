package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.GoodsMapper;
import com.shop.pojo.Goods;
import com.shop.pojo.Order;

@Service
public class GoodsService {

	@Autowired
	GoodsMapper goodsMapper;

	public Goods querygoodsbyid(int id) {
		
		return goodsMapper.selectgoodsbyid(id);
	}

	public List<Goods> querygoodsbyname(String gname) {
		
		return goodsMapper.querygoodsbyname(gname);
	}

	public void updatestockbyid(int id, int stock1) {
		goodsMapper.updatestockbyid(id,stock1);
		
	}

	public List<Goods> queryallgoods() {

		return goodsMapper.queryallgoods();
	}

	public boolean deletegoodsbyid(int gid) {
		
		return goodsMapper.deleteByPrimaryKey(gid)==1;
	}

	public boolean updategoods(Goods goods) {
		return goodsMapper.updateByPrimaryKey(goods)==1;
		
	}

	public boolean addgoods(Goods g1) {
		
		return goodsMapper.insert(g1)==1;
	}

	

	
}
