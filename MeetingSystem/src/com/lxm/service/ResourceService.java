package com.lxm.service;

import java.util.List;

import com.lxm.bean.Resource;

public interface ResourceService {
	public List<Resource> queryAvailableResources();

	public List<Resource> queryUnAddResources(int meetingId);

	public List<Resource> paginateResourcesByExample(Resource resource,
			int pageIndex, int pageSize);

	public int totalPages(Resource resource, int pageSize);

	public void modifyResource(Resource resource);

	public void addResource(Resource resource);

	public void removeResource(int rId);
}
