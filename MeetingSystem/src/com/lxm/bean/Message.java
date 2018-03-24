package com.lxm.bean;

import java.sql.Timestamp;

public class Message {
	private int id;
	private String name;
	private Timestamp sendTime;
	private String content;
	private String scan;
	private User sendUser;
	private User receiveUser;

	public Message() {
		super();
	}

	public Message(String name, Timestamp sendTime, String content,
			String scan, User sendUser, User receiveUser) {
		super();
		this.name = name;
		this.sendTime = sendTime;
		this.content = content;
		this.scan = scan;
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
	}

	public Message(int id, String name, Timestamp sendTime, String content,
			String scan, User sendUser, User receiveUser) {
		super();
		this.id = id;
		this.name = name;
		this.sendTime = sendTime;
		this.content = content;
		this.scan = scan;
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
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

	public Timestamp getSendTime() {
		return sendTime;
	}

	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getScan() {
		return scan;
	}

	public void setScan(String scan) {
		this.scan = scan;
	}

	public User getSendUser() {
		return sendUser;
	}

	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}

	public User getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(User receiveUser) {
		this.receiveUser = receiveUser;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", name=" + name + ", sendTime="
				+ sendTime + ", content=" + content + ", scan=" + scan
				+ ", sendUser=" + sendUser + ", receiveUser=" + receiveUser
				+ "]";
	}
}
