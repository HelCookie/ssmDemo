package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.UserMapper;
import com.shop.pojo.User;

@Service
public class Userservice {

	@Autowired
	UserMapper userMapper;
	

	public String querypasswordbyname(String name){
		
		return userMapper.querypasswordbyname(name);
	}


	public boolean saveuser(User user) {
		
		return this.userMapper.saveuser(user)==1;
	}


	public User queryuserbyname(String name) {
		
		return userMapper.queryuserbyname(name);
	}


	public boolean updateuser(User user) {
		
		return userMapper.updateuser(user)==1;
	}
	
}
