package com.lxm.dao;

import com.lxm.bean.User;

public interface UserMapper {
	public int login(User user);
	public User queryById(int userId);
	public User queryByExample(User user);
}
