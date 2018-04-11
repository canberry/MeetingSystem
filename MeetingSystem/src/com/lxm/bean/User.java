package com.lxm.bean;

public class User {
	private int userId;
	private String userName;
	private String password;
	private String signature;
	private String avatar;
	private String sex;
	private String userRole;
	private String nickname;
	private String mobile;
	private String email;
	private String address;
	private String position;
	private String userState;

	public User() {
		super();
	}

	public User(String userName, String password, String signature,
			String avatar, String sex, String userRole, String nickname,
			String mobile, String email, String address, String position) {
		super();
		this.userName = userName;
		this.password = password;
		this.signature = signature;
		this.avatar = avatar;
		this.sex = sex;
		this.userRole = userRole;
		this.nickname = nickname;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.position = position;
	}

	public User(int userId, String userName, String password, String signature,
			String avatar, String sex, String userRole, String nickname,
			String mobile, String email, String address, String position) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.signature = signature;
		this.avatar = avatar;
		this.sex = sex;
		this.userRole = userRole;
		this.nickname = nickname;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.position = position;
	}

	public User(User u) {
		this.userId = u.getUserId();
		this.userName = u.getUserName();
		this.password = u.getPassword();
		this.signature = u.getSignature();
		this.avatar = u.getAvatar();
		this.sex = u.getSex();
		this.userRole = u.getUserRole();
		this.nickname = u.getNickname();
		this.mobile = u.getMobile();
		this.email = u.getEmail();
		this.address = u.getAddress();
		this.position = u.getPosition();
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

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", signature=" + signature
				+ ", avatar=" + avatar + ", sex=" + sex + ", userRole="
				+ userRole + ", nickname=" + nickname + ", mobile=" + mobile
				+ ", email=" + email + ", address=" + address + ", position="
				+ position + ", userState=" + userState + "]";
	}
}
