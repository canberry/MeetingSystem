package com.lxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingRoom;
import com.lxm.bean.Message;
import com.lxm.bean.User;
import com.lxm.dao.MeetingRoomMapper;
import com.lxm.service.MeetingRoomService;
import com.lxm.service.MeetingService;
import com.lxm.service.MessageService;
import com.lxm.util.Const;
import com.lxm.util.DateUtil;

@Service
public class MeetingRoomServiceImpl implements MeetingRoomService {

	@Resource
	MeetingRoomMapper meetingRoomMapper;
	@Autowired
	MeetingService meetingService;
	@Autowired
	MessageService messageService;

	public List<MeetingRoom> paginateMeetingRoomsByExample(
			MeetingRoom meetingRoom, int pageIndex, int pageSize) {
		int pageStart = pageSize * (pageIndex - 1);
		return meetingRoomMapper.pagination(meetingRoom, pageStart, pageSize);
	}

	public int totalPages(MeetingRoom meetingRoom, int pageSize) {
		int r = meetingRoomMapper.getRows(meetingRoom);
		return r % pageSize == 0 ? r / pageSize : r / pageSize + 1;
	}

	public List<MeetingRoom> queryMeetingRoomsToScheduled(String startTime,
			String endTime, int capacity) {
		return meetingRoomMapper.queryAvailable(startTime, endTime, capacity);
	}

	public List<MeetingRoom> queryMeetingRoomsToScheduledWithouMid(int mId,
			String startTime, String endTime, int capacity) {
		return meetingRoomMapper.queryAvailableWithoutMid(mId, startTime,
				endTime, capacity);
	}

	public MeetingRoom queryMeetingRoomById(int mrId) {
		return meetingRoomMapper.queryById(mrId);
	}

	public int queryMeetingRoomNumByNo(String no, int mrId) {
		return meetingRoomMapper.queryNumByNo(no, mrId);
	}

	public void modifyMeetingRoom(MeetingRoom meetingRoom) {
		meetingRoomMapper.modify(meetingRoom);
	}

	public void addMeetingRoom(MeetingRoom meetingRoom) {
		meetingRoomMapper.add(meetingRoom);
	}

	public void removeMeetingRoom(int mrId, User user) {
		meetingRoomMapper.remove(mrId);

		Meeting m = new Meeting();
		MeetingRoom meetingRoom = new MeetingRoom();
		meetingRoom.setMrId(mrId);
		String nowTime = DateUtil.formatDate(new java.util.Date(),
				Const.DATEFORMAT_HM);
		m.setCancel(Const.CANCEL_NO);
		m.setMeetingRoom(meetingRoom);
		m.setStartTime(nowTime);

		List<Meeting> meetings = meetingService.queryMeetingsByTime(m);
		System.out.println("ms: " + meetings);
		for (Meeting meeting : meetings) {
			if (meeting.getCancel().equals(Const.CANCEL_NO)) {
				// new meetingroom
				String startTime = meeting.getStartTime();
				String endTime = meeting.getEndTime();
				int capacity = meeting.getMeetingRoom().getCapacity();
				List<MeetingRoom> meetingRooms = queryMeetingRoomsToScheduled(
						startTime, endTime, capacity);
				System.out.println("new mrs: " + meetingRooms);
				Meeting md = meetingService
						.queryMeetingDetailAndResourceById(meeting.getmId());

				if (meetingRooms.isEmpty()) {
					String messageName = "会议室无效: " + meeting.getmName();
					String content = "会议: " + meeting.getmName() + ","
							+ "    开始时间: " + meeting.getStartTime() + ","
							+ "    结束时间: " + meeting.getEndTime() + "."
							+ "    预定的会议室无效, 会议系统已经自动取消该会议";

					Message message = new Message();
					message.setMessageName(messageName);
					message.setContent(content);
					message.setSendUser(user);
					Meeting mt = new Meeting();
					mt.setmId(meeting.getmId());
					mt.setCancel(Const.CANCEL_YES);
					mt.setMeetingDetails(md.getMeetingDetails());
					meetingService.modifyMeetingCancel(mt, message);

					String newcontent = "您预定的会议: " + meeting.getmName() + ","
							+ "    开始时间: " + meeting.getStartTime() + ","
							+ "    结束时间: " + meeting.getEndTime() + "."
							+ "    预定的会议室无效, 会议系统已经自动帮您取消该会议";
					message.setContent(newcontent);
					message.setReceiveUser(meeting.getScheduler());
					messageService.addMessage(message);
				} else {
					MeetingRoom newMeetingRoom = meetingRooms.get(0);
					System.out.println("new room: " + newMeetingRoom);

					String messageName = "会议室更换: " + meeting.getmName();
					String content = "会议: " + meeting.getmName() + ","
							+ "    开始时间: " + meeting.getStartTime() + ","
							+ "    结束时间: " + meeting.getEndTime() + "."
							+ "    原会议室已经更换, 新的会议室: " + newMeetingRoom.getNo()
							+ ", " + "可容纳 " + newMeetingRoom.getCapacity()
							+ " 人";
					Message message = new Message();
					message.setMessageName(messageName);
					message.setContent(content);
					message.setSendUser(user);
					Meeting meet = new Meeting();
					meet.setmId(meeting.getmId());
					meet.setMeetingRoom(newMeetingRoom);
					meet.setMeetingDetails(md.getMeetingDetails());
					System.out.println("meet: " + meet);
					meetingService.modifyMeetingCancel(meet, message);

					String newcontent = "您预定的会议: " + meeting.getmName() + ","
							+ "    开始时间: " + meeting.getStartTime() + ","
							+ "    结束时间: " + meeting.getEndTime() + "."
							+ "    原会议室已经更换, 系统自动帮您选定新的会议室: "
							+ newMeetingRoom.getNo() + ", " + "可容纳 "
							+ newMeetingRoom.getCapacity() + " 人";
					message.setContent(newcontent);
					message.setReceiveUser(meeting.getScheduler());
					messageService.addMessage(message);
				}
			}
		}
	}
}
