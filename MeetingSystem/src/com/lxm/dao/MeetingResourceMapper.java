package com.lxm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxm.bean.MeetingResource;

public interface MeetingResourceMapper {
	public void add(MeetingResource meetingResource);
	public void subResourceRemain(MeetingResource meetingResource);
	public void remove(@Param("mId")int mId, @Param("rId")int rId);
	public List<MeetingResource> queryByMId(int mId);
	public void addResourceRemain(MeetingResource meetingResource);
}
