package com.lxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lxm.bean.Message;
import com.lxm.bean.User;
import com.lxm.dao.MessageMapper;
import com.lxm.dao.UserMapper;
import com.lxm.service.MessageService;
import com.lxm.util.Const;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Resource
	MessageMapper messageMapper;
	@Resource
	UserMapper userMapper;

	public List<Message> queryUnReadMsgByRcvUserId(int userId) {
		return messageMapper.queryUnReadMsgByRcvUserId(userId);
	}
	
	public void addMessage(Message message) {
		messageMapper.add(message);
	}

	public List<Message> queryMessagesByExample(Message message) {
		return messageMapper.queryByExample(message);
	}

	public List<Message> queryMessagesFromMeByExample(Message message) {
		return messageMapper.queryFromMwByExample(message);
	}

	public void modifyMessage(Message message) {
		messageMapper.modify(message);
	}

	public Message queryMessageById(int msgId) {
		Message message = messageMapper.queryById(msgId);
		User receiveUser = userMapper.queryById(message.getReceiveUser().getUserId());
		message.setReceiveUser(receiveUser );
		
		Message msg = new Message();
		msg.setMessageId(message.getMessageId());
		msg.setScan(Const.SCAN_YES);
		messageMapper.modify(msg );
		return message;
	}

	public Message queryMessageFromMeById(int msgId) {
		Message message = messageMapper.queryById(msgId);
		User receiveUser = userMapper.queryById(message.getReceiveUser().getUserId());
		message.setReceiveUser(receiveUser );
		return message;
	}
}
