package com.lxm.bean;

public class MeetingDetail {
	private Meeting meeting;
	private User user;
	private String role;
	private String will;

	public MeetingDetail() {
		super();
	}

	public MeetingDetail(String role, String will) {
		super();
		this.role = role;
		this.will = will;
	}

	public MeetingDetail(Meeting meeting, User user, String role, String will) {
		super();
		this.meeting = meeting;
		this.user = user;
		this.role = role;
		this.will = will;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getWill() {
		return will;
	}

	public void setWill(String will) {
		this.will = will;
	}

	@Override
	public String toString() {
		return "MeetingDetail [meeting=" + meeting + ", user=" + user
				+ ", role=" + role + ", will=" + will + "]";
	}
}
