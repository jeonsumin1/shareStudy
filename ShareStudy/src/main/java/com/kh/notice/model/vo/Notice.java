package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {
    private int key;
	private String nTitle;
	private String nContent;
	private int count;
	private Date createDate;
	private String status;
	
	public Notice() {
		super();
	}

	public Notice(int key, String nTitle, String nContent, int count, Date createDate, String status) {
		super();
		this.key = key;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public Notice(int key, String nTitle, String nContent, int count, Date createDate) {
		super();
		this.key = key;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.count = count;
		this.createDate = createDate;
	}
	
	

	public Notice(int key, String nTitle, String nContent, Date createDate) {
		super();
		this.key = key;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.createDate = createDate;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [key=" + key + ", nTitle=" + nTitle + ", nContent=" + nContent + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
}
