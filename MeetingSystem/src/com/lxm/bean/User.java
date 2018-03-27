package com.lxm.bean;

public class User {
	private int userId;
	private String userName;
	private String password;
	private String avatar;
	private String sex;
	private String userRole;

	public User() {
		super();
	}

	public User(String userName, String password, String avatar, String sex,
			String userRole) {
		super();
		this.userName = userName;
		this.password = password;
		this.avatar = avatar;
		this.sex = sex;
		this.userRole = userRole;
	}

	public User(int userId, String userName, String password, String avatar,
			String sex, String userRole) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.avatar = avatar;
		this.sex = sex;
		this.userRole = userRole;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", avatar=" + avatar + ", sex="
				+ sex + ", userRole=" + userRole + "]";
	}
}
