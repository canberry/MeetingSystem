package com.lxm.service;

import java.util.List;

import com.lxm.bean.MeetingRoom;

public interface MeetingRoomService {
	public List<MeetingRoom> paginateMeetingRoomsByExample(MeetingRoom meetingRoom, int pageIndex, int pageSize);
	public int totalPages(MeetingRoom meetingRoom, int pageSize);
	public List<MeetingRoom> queryMeetingRoomsToScheduled(String startTime, String endTime, int capacity);
	public List<MeetingRoom> queryMeetingRoomsToScheduledWithouMid(int mId, String startTime, String endTime, int capacity);
}
