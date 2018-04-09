package com.lxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lxm.bean.MeetingRoom;
import com.lxm.dao.MeetingRoomMapper;
import com.lxm.service.MeetingRoomService;

@Service
public class MeetingRoomServiceImpl implements MeetingRoomService {
	
	@Resource
    MeetingRoomMapper meetingRoomMapper;
	
	public List<MeetingRoom> paginateMeetingRoomsByExample(MeetingRoom meetingRoom, int pageIndex, int pageSize) {
		int pageStart = pageSize * (pageIndex - 1);
		return meetingRoomMapper.pagination(meetingRoom, pageStart , pageSize);
	}

	public int totalPages(MeetingRoom meetingRoom, int pageSize) {
		int r = meetingRoomMapper.getRows(meetingRoom);
		return r  % pageSize == 0 ? r / pageSize : r / pageSize + 1;
	}

	public List<MeetingRoom> queryMeetingRoomsToScheduled(String startTime, String endTime, int capacity) {
		return meetingRoomMapper.queryAvailable(startTime, endTime, capacity);
	}
}
