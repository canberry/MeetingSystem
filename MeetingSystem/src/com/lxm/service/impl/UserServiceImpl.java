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
		if (userMapper.login(user) == 1) {
			return true;
		} 
		
		return false;
	}
}
