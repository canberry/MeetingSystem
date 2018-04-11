package com.lxm.service;

import java.util.List;

import com.lxm.bean.Message;

public interface MessageService {
	public List<Message> queryUnReadMsgByRcvUserId(int userId);
	public void addMessage(Message message);
	public List<Message> queryMessagesByExample(Message message);
	public List<Message> queryMessagesFromMeByExample(Message message);
	public void modifyMessage(Message message);
	public Message queryMessageById(int msgId);
	public Message queryMessageFromMeById(int msgId);
}
