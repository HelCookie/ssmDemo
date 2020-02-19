package com.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.shop.pojo.Goods;
import com.shop.pojo.Order;
import com.shop.pojo.User;
import com.shop.service.GoodsService;
import com.shop.service.OrderService;
import com.shop.service.Userservice;


@Controller
@RequestMapping(value="register")
public class registercontroller {

	@Autowired
	Userservice userservice;
	
	@Autowired
	OrderService orderservice;
	

	@RequestMapping(value="update",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> updateuser(User user,HttpSession session){
				
	boolean flag=userservice.updateuser(user);
	User u1=userservice.queryuserbyname(user.getUsername());
	session.setAttribute("User", u1);
		 Map<String,String> map = new HashMap<String, String>();
		if(flag) {
			map.put("result", "200");			
		}
		else{
			map.put("result", "400");
		}
	     return map;
		
	}
	
	@RequestMapping(value="myorder")
	public ModelAndView querymyorder(@RequestParam(value="id") String userid){		
		
		
		ModelAndView model =new ModelAndView();
		
		List<Order> list = new ArrayList<Order>();
		list = orderservice.queryorderbyuserid(userid);
		model.setViewName("order");
		model.addObject("list", list);
	
		return model;
		
	}

	@RequestMapping(value="updatestate",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> updateuser(@Param(value="oid") int oid,@Param(value="option") int option){
		 boolean flag=false;	
		 
		 if(option==1){
			 flag=orderservice.finishorder(oid);
		 }
		if(option==2){
	     flag=orderservice.cancelorder(oid);
		}
		 Map<String,String> map = new HashMap<String, String>();
		if(flag) {
			map.put("result", "200");			
		}
		else{
			map.put("result", "400");
		}
	     return map;
		
	}
	
	
	
	
}
