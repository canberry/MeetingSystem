package com.lxm.service;

import java.util.List;

import com.lxm.bean.User;

public interface UserService {
	public boolean login(User user);
	public User queryByUserId(int userId);
	public List<User> queryUsersByExample(User user);
	public void addUser(User user);
	public void modifyUser(User user);
	public List<User> queryUsersLikeName(String userName);
	public List<User> queryAvailableUsersByIds(List<Integer> userIds, String startTime, String endTime);
}
