package com.lxm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lxm.bean.User;
import com.lxm.dao.UserMapper;
import com.lxm.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	public boolean login(User user) {
		return userMapper.login(user) == 1;
	}

	public User queryByUserId(int userId) {
		return userMapper.queryById(userId);
	}

	public User queryByUserExample(User user) {
		return userMapper.queryByExample(user);
	}
}
