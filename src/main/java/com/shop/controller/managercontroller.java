package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.pojo.Goods;
import com.shop.pojo.Order;
import com.shop.pojo.User;
import com.shop.service.GoodsService;
import com.shop.service.OrderService;

@Controller
@RequestMapping(value="manage")
public class managercontroller {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	GoodsService goodsService;
	
	
	@RequestMapping(value="goods")
	public ModelAndView managegoods(){
		ModelAndView model =new ModelAndView();		
		List<Goods> goodslist=new ArrayList<Goods>();		
		goodslist=goodsService.queryallgoods();
		model.setViewName("manage");
		model.addObject("goodslist", goodslist);		
		return model;
	}
	
	
	@RequestMapping(value="delgoods")
	@ResponseBody
	public Map<String, String> register(@Param(value="gid") int gid		
			){
		boolean flag=false;
		flag=goodsService.deletegoodsbyid(gid);
		
		 Map<String,String> map = new HashMap<String, String>();
			if(flag) 
				map.put("result", "200");			
			else{
				map.put("result", "400");
			}				
		     return map;
		
		}
	
	@RequestMapping(value="query")
	@ResponseBody
	public Map<String, String> query(@Param(value="gid") int gid,HttpSession session		
			){	
	      Goods g1=goodsService.querygoodsbyid(gid);
		
		 Map<String,String> map = new HashMap<String, String>();
			if(g1!=null) {		
				map.put("result", "200");
				map.put("gname", g1.getGname());
				map.put("gid", g1.getGid().toString());
				map.put("gprice", g1.getPrice().toString());
				map.put("gstock", g1.getStock().toString());
				map.put("gdes", g1.getDes());
				}							
		     return map;
		
		}
	
	@RequestMapping(value="updategoods")
	@ResponseBody
	public Map<String, String> updategoods(Goods goods){	
		
	      boolean flag=goodsService.updategoods(goods);
	    
		 Map<String,String> map = new HashMap<String, String>();
		if(flag) 
			map.put("result", "200");			
		else{
			map.put("result", "400");
		}				
	     return map;
		
	}
	
	@RequestMapping(value="order")
	public ModelAndView order(){
		ModelAndView model =new ModelAndView();		
		List<Order> orderlist=new ArrayList<Order>();		
		orderlist=orderService.queryallorder();
		model.setViewName("manageorder");
		model.addObject("orderlist", orderlist);		
		return model;
	}
	
	@RequestMapping(value="delorder")
	@ResponseBody
	public Map<String, String> delorder(@Param(value="oid") int oid		
			){
		boolean flag=false;
		flag=orderService.deleteorderbyid(oid);
		
		 Map<String,String> map = new HashMap<String, String>();
			if(flag) 
				map.put("result", "200");			
			else{
				map.put("result", "400");
			}				
		     return map;
		
		}
	
	@RequestMapping(value="queryorder")
	@ResponseBody
	public Map<String, String> queryorder(@Param(value="oid") int oid		
			){	
	      Order o1=orderService.queryorderbyoid(oid);
		
		 Map<String,String> map = new HashMap<String, String>();
			if(o1!=null) {		
				map.put("result", "200");
				map.put("orderId", o1.getOrderId().toString());
				map.put("goodsName", o1.getGoodsName());
				map.put("address", o1.getAddress());
				map.put("phone", o1.getPhone().toString());
		
				}							
		     return map;
		
		}
	
	@RequestMapping(value="updateorder")
	@ResponseBody
	public Map<String, String> updateorder(Order order){	
		
		
	      boolean flag=orderService.updateorder(order);
	      
		 Map<String,String> map = new HashMap<String, String>();
		if(flag) 
			map.put("result", "200");			
		else{
			map.put("result", "400");
		}			
		 
		 
	     return map;
		
	}
	
	@RequestMapping(value="addgoods")
	public String  addgoods(HttpServletRequest request,@RequestParam(value="file") MultipartFile file,
			@Param(value="gname") String gname,@Param(value="price") int price,
			@Param(value="des") String des,@Param(value="stock") int stock
			) throws IllegalStateException, IOException{			
		String fileName = file.getOriginalFilename();
		  String[] split = fileName.split(".jpg");
		  fileName = split[0] ;
			Goods g1=new Goods();
			g1.setGname(gname);g1.setPrice(price);g1.setStock(stock);g1.setImg(fileName);
			
			 String path = request.getServletContext().getRealPath("/img");
			   File newfile=new File(path+File.separator +
			         fileName+"."+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1));
			   file.transferTo(newfile);		
			boolean flag=goodsService.addgoods(g1);
	          if(!flag||file==null)
				{return "ÉÏ´«Ê§°Ü";}			 			     
			return "redirect:/manage/goods";
		}
	
	
}
