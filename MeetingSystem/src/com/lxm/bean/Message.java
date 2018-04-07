package com.lxm.bean;

public class Message {
	private int messageId;
	private String messageName;
	private String sendTime;
	private String content;
	private String scan;
	private User sendUser;
	private User receiveUser;

	public Message() {
		super();
	}

	public Message(String messageName, String sendTime, String content,
			String scan, User sendUser, User receiveUser) {
		super();
		this.messageName = messageName;
		this.sendTime = sendTime;
		this.content = content;
		this.scan = scan;
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
	}

	public Message(int messageId, String messageName, String sendTime,
			String content, String scan, User sendUser, User receiveUser) {
		super();
		this.messageId = messageId;
		this.messageName = messageName;
		this.sendTime = sendTime;
		this.content = content;
		this.scan = scan;
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getMessageName() {
		return messageName;
	}

	public void setMessageName(String messageName) {
		this.messageName = messageName;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
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
		return "Message [messageId=" + messageId + ", messageName="
				+ messageName + ", sendTime=" + sendTime + ", content="
				+ content + ", scan=" + scan + ", sendUser=" + sendUser
				+ ", receiveUser=" + receiveUser + "]";
	}
}
