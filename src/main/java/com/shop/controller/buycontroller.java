package com.shop.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.pojo.Goods;
import com.shop.pojo.Order;
import com.shop.pojo.User;
import com.shop.service.GoodsService;
import com.shop.service.OrderService;
import com.shop.service.Userservice;

@Controller
@RequestMapping(value="buy")
public class buycontroller {
     @Autowired
	GoodsService goodsservice;
     
     @Autowired
     OrderService orderservice;
     
     @Autowired
     Userservice userservice;
     
       @RequestMapping(value="tobuy")
     public ModelAndView maintobuy(@Param(value="id") int id){
    	   
    	   ModelAndView model=new ModelAndView();
    	   Goods g1=goodsservice.querygoodsbyid(id);
    	   model.setViewName("buy");
    	   model.addObject("goods",g1);
    	   return model;
       }
       
       @RequestMapping(value="search")
       public ModelAndView searchgoods(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="gname") String gname){   	   	       	  
      	   ModelAndView model=new ModelAndView();
      	   PageHelper.orderBy("gid asc");   
      	   PageHelper.startPage(pn,8);
      	   List<Goods> list=new ArrayList<Goods>();
      	   list=goodsservice.querygoodsbyname(gname);     	   
      	   PageInfo page=new PageInfo(list,5);     	 
      	   model.setViewName("search");
      	   model.addObject("pageinfo", page);
      	   return model;
         }
       
       
   	@RequestMapping(value="order")
   	@ResponseBody
   	public Map<String, String> order(@Param(value="id") int id,@Param(value="num") int num
   			,@Param(value="ph") String ph,@Param(value="address") String address,
   			@Param(value="userid") String userid
   			){
   		
   		Goods g1=goodsservice.querygoodsbyid(id);
   		Map<String,String> map = new HashMap<String, String>();
   		int stock=g1.getStock();   	
   		if(num>stock)
   		{
   		map.put("result", "408");	
   		return map;
   		}
   		
   		Date now = new Date(); 
		SimpleDateFormat f = new SimpleDateFormat("MMddHHmmss");//可以方便地修改日期格式
		String order = f.format(now); 	
		order=order+g1.getGid().toString();		
	  	Integer orderid=Integer.parseInt(order);
	  	
        Order o1=new Order();
	  	o1.setGoodsId(g1.getGid());o1.setBuyer(userid);o1.setGoodsName(g1.getGname());o1.setAddress(address);
	  	o1.setOrderId(orderid);o1.setPhone(ph);o1.setPrice((double) (g1.getPrice()*num));o1.setState(0);o1.setSum(num);
        o1.setGoodsImg(g1.getImg());
	    orderservice.insertorder(o1);   
	    int stock1=g1.getStock()-num;
	    goodsservice.updatestockbyid(id,stock1);
	    
	    map.put("result", "200");		

   	     return map;
   		
   	}   
       
}
