package com.lxm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<User> queryUsersByExample(User user) {
		return userMapper.queryByExample(user);
	}

	public void addUser(User user) {
		userMapper.add(user);
	}

	public void modifyUser(User user) {
		userMapper.modify(user);
	}

	public List<User> queryUsersLikeName(String userName) {
		return userMapper.queryLikeExample(userName);
	}

	public List<User> queryAvailableUsersByIds(List<Integer> userIds, String startTime, String endTime) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userIds", userIds);
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		return userMapper.queryAvailableUsersByIds(params);
	}
}
