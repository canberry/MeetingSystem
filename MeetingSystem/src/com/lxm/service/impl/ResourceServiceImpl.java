package com.lxm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxm.bean.Resource;
import com.lxm.dao.ResourceMapper;
import com.lxm.service.ResourceService;

@Service
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	ResourceMapper resourceMapper;

	public List<Resource> queryAvailableResources() {
		return resourceMapper.queryAvailable();
	}

	public List<Resource> queryUnAddResources(int meetingId) {
		return resourceMapper.queryUnAddResources(meetingId);
	}

	public List<Resource> paginateResourcesByExample(Resource resource,
			int pageIndex, int pageSize) {
		int pageStart = pageSize * (pageIndex - 1);
		return resourceMapper.pagination(resource, pageStart, pageSize);
	}

	public int totalPages(Resource resource, int pageSize) {
		int r = resourceMapper.getRows(resource);
		return r % pageSize == 0 ? r / pageSize : r / pageSize + 1;
	}

	public void modifyResource(Resource resource) {
		Resource r = resourceMapper.queryById(resource.getrId());
		int v = resource.getRemain() - r.getRemain();
		resource.setTotal(r.getTotal() + v);

		resourceMapper.modify(resource);
	}

	public void addResource(Resource resource) {
		resourceMapper.add(resource);
	}

	public void removeResource(int rId) {
		resourceMapper.remove(rId);
	}
}
