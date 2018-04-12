package com.lxm.service;

import java.util.List;

import com.lxm.bean.MeetingRoom;
import com.lxm.bean.User;

public interface MeetingRoomService {
	public List<MeetingRoom> paginateMeetingRoomsByExample(MeetingRoom meetingRoom, int pageIndex, int pageSize);
	public int totalPages(MeetingRoom meetingRoom, int pageSize);
	public List<MeetingRoom> queryMeetingRoomsToScheduled(String startTime, String endTime, int capacity);
	public List<MeetingRoom> queryMeetingRoomsToScheduledWithouMid(int mId, String startTime, String endTime, int capacity);
	public MeetingRoom queryMeetingRoomById(int mrId);
	public int queryMeetingRoomNumByNo(String no, int mrId);
	public void modifyMeetingRoom(MeetingRoom meetingRoom);
	public void addMeetingRoom(MeetingRoom meetingRoom);
	public void removeMeetingRoom(int mrId, User user);
}
