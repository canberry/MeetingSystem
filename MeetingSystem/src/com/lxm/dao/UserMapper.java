package com.lxm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lxm.bean.User;

public interface UserMapper {
	public int login(User user);
	public User queryById(int userId);
	public List<User> queryByExample(User user);
	public void add(User user);
	public void modify(User user);
	public List<User> queryLikeExample(@Param("userName")String userName);
	public List<User> queryAvailableUsersByIds(Map<String, Object> params);
	public List<User> queryAvailableUsersByIdsAndMId(Map<String, Object> params);
}
