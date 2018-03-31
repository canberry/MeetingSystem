package com.lxm.dao;

import java.util.List;

import com.lxm.bean.User;

public interface UserMapper {
	public int login(User user);
	public User queryById(int userId);
	public List<User> queryByExample(User user);
	public void add(User user);
	public void modify(User user);
}
