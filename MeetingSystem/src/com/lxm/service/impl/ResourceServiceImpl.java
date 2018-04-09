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

}
