package com.lxm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxm.bean.MeetingDetail;

public interface MeetingDetailMapper {
	public List<MeetingDetail> pagination(@Param("meetingDetail")MeetingDetail meetingDetail, @Param("pageStart")int pageStart, @Param("pageSize")int pageSize);
	public int getRows(MeetingDetail meetingDetail);
	public void modify(MeetingDetail meetingDetail);
	public List<MeetingDetail> paginationBeforeNow(@Param("meetingDetail")MeetingDetail meetingDetail, @Param("nowTime")String nowTime, @Param("pageStart")int pageStart, @Param("pageSize")int pageSize);
	public int getRowsBeforeNow(@Param("meetingDetail")MeetingDetail meetingDetail, @Param("nowTime")String nowTime);
	public void add(MeetingDetail meetingDetail);
	public void removByMId(int mId);
}
