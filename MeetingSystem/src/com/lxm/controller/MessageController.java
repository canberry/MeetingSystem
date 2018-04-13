package com.lxm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lxm.bean.Message;
import com.lxm.bean.User;
import com.lxm.service.MessageService;
import com.lxm.util.Const;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	private static Logger logger = Logger.getLogger(MessageController.class);
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping("/queryUnReadMessage")
	public void queryUnReadMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			JSONArray datas = JSONArray.fromObject(new ArrayList<Message>());
			response.setCharacterEncoding(Const.ENCODING_UTF8);
			response.getWriter().print(datas.toString());
			return;
		}
		
		int userId = user.getUserId();
		List<Message> ms = messageService.queryUnReadMsgByRcvUserId(userId);
		int msgNum = ms.size();
		List<Message> messages = ms;
		if (msgNum > 3) {			
			messages = ms.subList(0, 4); // only three
		}
		
		Map<String, Object> mns = new HashMap<String, Object>();
		mns.put("msgNum", msgNum);
		mns.put("messages", messages);
		
		JSONArray datas = JSONArray.fromObject(mns);
		response.setCharacterEncoding(Const.ENCODING_UTF8);
		response.getWriter().print(datas.toString());
	}
	
	@RequestMapping("/queryMessageToMe")
	public String queryMessageToMe(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		Message message = new Message();
		message.setReceiveState(Const.STATE_NO);
		message.setReceiveUser(user);
		List<Message> messagesToMe = messageService.queryMessagesByExample(message);
		logger.info("size: " + messagesToMe.size() + " all msgs tome: " + messagesToMe);
		message.setScan(Const.SCAN_NO);
		List<Message> unReadMessages = messageService.queryMessagesByExample(message);
		logger.info("size: " + unReadMessages.size() + " unread msgs: " + unReadMessages);
		message.setScan(Const.SCAN_YES);
		List<Message> alreadMessages = messageService.queryMessagesByExample(message);
		logger.info("size: " + alreadMessages.size() + " alread msgs: " + alreadMessages);
		
		Message msg = new Message();
		msg.setSendUser(user);
		msg.setSendState(Const.STATE_NO);
		List<Message> messagesFromMe = messageService.queryMessagesFromMeByExample(msg);
		logger.info("size: " + messagesFromMe.size() + " msgs from me: " + messagesFromMe);
		
		request.setAttribute("messagesToMe", messagesToMe);
		request.setAttribute("unReadMessages", unReadMessages);
		request.setAttribute("alreadMessages", alreadMessages);
		request.setAttribute("messagesFromMe", messagesFromMe);
		return "/query_message";
	}
	
	@RequestMapping("/removeMessageToMe")
	public String removeMessageToMe(int msgId) {
		Message message = new Message();
		message.setMessageId(msgId);
		message.setReceiveState(Const.STATE_YES);
		messageService.modifyMessage(message);
		
		return "redirect:/message/queryMessageToMe";
	}
	
	@RequestMapping("/removeMessageFromMe")
	public String removeMessageFromMe(int msgId) {
		Message message = new Message();
		message.setMessageId(msgId);
		message.setSendState(Const.STATE_YES);
		messageService.modifyMessage(message);
		
		return "redirect:/message/queryMessageToMe";
	}
	
	@RequestMapping("/queryMessageById")
	public String queryMessageById(int msgId, HttpServletRequest request) {
		Message message = messageService.queryMessageById(msgId);
		logger.info("msg to me: " + message);
		request.setAttribute("message", message);
		return "/query_message_detail";
	}
	
	@RequestMapping("/queryMessageFromMe")
	public String queryMessageFromMe(int msgId, HttpServletRequest request) {
		Message message = messageService.queryMessageFromMeById(msgId);
		logger.info("msg from me: " + message);
		request.setAttribute("message", message);
		return "/query_message_detail";
	}
}
