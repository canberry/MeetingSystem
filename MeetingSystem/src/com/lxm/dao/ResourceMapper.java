package com.lxm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxm.bean.Resource;

public interface ResourceMapper {
	public List<Resource> queryAvailable();

	public List<Resource> queryUnAddResources(int meetingId);

	public List<Resource> pagination(@Param("resource") Resource resource,
			@Param("pageStart") int pageStart, @Param("pageSize") int pageSize);

	public int getRows(Resource resource);

	public void modify(Resource resource);

	public Resource queryById(int rId);

	public void add(Resource resource);

	public void remove(int rId);
}
