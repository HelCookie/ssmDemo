package com.shop.dao;

import com.shop.pojo.Goods;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    Goods selectByPrimaryKey(Integer id);

    List<Goods> selectAll();

    int updateByPrimaryKey(Goods goods);

	Goods selectgoodsbyid(@Param(value="gid")int id);

	List<Goods> querygoodsbyname(@Param(value="gname")String gname);

	void updatestockbyid(@Param(value="gid")int id, @Param(value="stock")int stock1);

	List<Goods> queryallgoods();
}