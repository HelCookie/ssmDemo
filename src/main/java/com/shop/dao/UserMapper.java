package com.shop.dao;

import com.shop.pojo.User;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    User selectByPrimaryKey(Integer userid);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

	String querypasswordbyname(String name);

	int saveuser(User user);

	User queryuserbyname(String name);

	int updateuser(User user);
}