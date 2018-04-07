package com.lxm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxm.bean.Meeting;

public interface MeetingMapper {
	public List<Meeting> queryByTime(Meeting meeting);
	public Meeting queryById(int meetingId);
	public Meeting queryDetailById(int meetingId);
	public Meeting queryByIds(@Param("meetingId")int meetingId, @Param("userId")int userId);
}
