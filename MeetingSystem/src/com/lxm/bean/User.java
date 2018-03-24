package com.lxm.bean;

public class User {
	private int id;
	private String name;
	private String password;
	private String avatar;
	private String sex;
	private String role;

	public User() {
		super();
	}

	public User(String name, String password, String avatar, String sex,
			String role) {
		super();
		this.name = name;
		this.password = password;
		this.avatar = avatar;
		this.sex = sex;
		this.role = role;
	}

	public User(int id, String name, String password, String avatar,
			String sex, String role) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.avatar = avatar;
		this.sex = sex;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password
				+ ", avatar=" + avatar + ", sex=" + sex + ", role=" + role
				+ "]";
	}
}
