package com.lxm.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.lxm.bean.Document;
import com.lxm.dao.DocumentMapper;
import com.lxm.service.DocumentService;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Resource
	DocumentMapper documentMapper;

	public void addDocument(Document document) {
		documentMapper.add(document);
	}

	public void removeDocument(int docId) {
		documentMapper.remove(docId);
	}
}
