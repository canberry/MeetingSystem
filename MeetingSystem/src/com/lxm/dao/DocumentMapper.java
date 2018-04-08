package com.lxm.dao;

import com.lxm.bean.Document;

public interface DocumentMapper {
	public void add(Document document);
	public void remove(int docId);
}
