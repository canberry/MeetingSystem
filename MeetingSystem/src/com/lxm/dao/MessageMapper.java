package com.lxm.dao;

import java.util.List;

import com.lxm.bean.Message;

public interface MessageMapper {
	public List<Message> queryUnReadMsgByRcvUserId(int userId);
	public void add(Message message);
	public List<Message> queryByExample(Message message);
	public List<Message> queryFromMwByExample(Message message);
	public void modify(Message message);
	public Message queryById(int msgId);
}
