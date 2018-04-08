package com.lxm.bean;

public class Document {
	private int docId;
	private String docName;
	private String path;
	private Meeting meeting;

	public Document() {
		super();
	}

	public Document(String docName, String path, Meeting meeting) {
		super();
		this.docName = docName;
		this.path = path;
		this.meeting = meeting;
	}

	public Document(int docId, String docName, String path, Meeting meeting) {
		super();
		this.docId = docId;
		this.docName = docName;
		this.path = path;
		this.meeting = meeting;
	}

	public int getDocId() {
		return docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	@Override
	public String toString() {
		return "Document [docId=" + docId + ", docName=" + docName + ", path="
				+ path + ", meeting=" + meeting + "]";
	}
}
