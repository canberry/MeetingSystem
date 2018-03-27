package com.lxm.service;

import com.lxm.bean.User;

public interface UserService {
	public boolean login(User user);
	public User queryByUserId(int userId);
	public User queryByUserExample(User user);
}
