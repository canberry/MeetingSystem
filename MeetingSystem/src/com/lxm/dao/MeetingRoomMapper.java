package com.lxm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxm.bean.MeetingRoom;

public interface MeetingRoomMapper {
	public List<MeetingRoom> pagination(@Param("meetingRoom")MeetingRoom meetingRoom, @Param("pageStart")int pagestart, @Param("pageSize")int pageSize);
	public int getRows(MeetingRoom meetingRoom);
	public List<MeetingRoom> queryAvailable(@Param("startTime")String startTime, @Param("endTime")String endTime, @Param("capacity")int capacity);
	public List<MeetingRoom> queryAvailableWithoutMid(@Param("mId")int mId, @Param("startTime")String startTime, @Param("endTime")String endTime, @Param("capacity")int capacity);
}
