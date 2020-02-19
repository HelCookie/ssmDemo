package com.shop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.pojo.User;
import com.shop.service.OrderService;
import com.shop.service.Userservice;

@Controller
@RequestMapping(value="login")
public class Logincontroller {

	@Autowired
	Userservice userservice;
	
	@Autowired
	OrderService orderservice;
	
	
	@RequestMapping(value="reg")
	@ResponseBody
	public Map<String, String> register(@Param(value="username") String username,
			@Param(value="password") String password,
			@Param(value="role") String role ,HttpSession session
			){
		
		 Map<String,String> map = new HashMap<String, String>();
		 
		if (role.equals("管理员")) {
			if (username.equals("admin") && password.equals("123456"))
				map.put("result", "201");
			else {
				map.put("result", "400");
			}
		}		
		if (role.equals("用户")) {
			User u1=userservice.queryuserbyname(username);
			session.setAttribute("User", u1);
			String pw=userservice.querypasswordbyname(username);
			if (password.equals(pw)) {
				map.put("result", "200");
			} else {
				map.put("result", "400");

			}
		}
	     return map;
		
	}
	
	
	@RequestMapping(value="save")
	@ResponseBody
	public Map<String, String> saveuser(User user){		
	boolean flag=userservice.saveuser(user);
		
		 Map<String,String> map = new HashMap<String, String>();
		if(flag) 
			map.put("result", "200");			
		else{
			map.put("result", "400");
		}				
	     return map;
		
	}
	
	
}
