package com.lxm.dao;

import java.util.List;

import com.lxm.bean.Resource;

public interface ResourceMapper {
	public List<Resource> queryAvailable();
	public List<Resource> queryUnAddResources(int meetingId);
}
