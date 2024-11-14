package com.kh.member.model.vo;

import java.util.Date;

public class Question {
	private String userId;
	private String qtPhone;
	private Date qtDate;
	private String qtRequest;
	
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQtPhone() {
		return qtPhone;
	}

	public void setQtPhone(String qtPhone) {
		this.qtPhone = qtPhone;
	}

	public Date getQtDate() {
		return qtDate;
	}

	public void setQtDate(Date qtDate) {
		this.qtDate = qtDate;
	}

	public String getQtRequest() {
		return qtRequest;
	}

	public void setQtRequest(String qtRequest) {
		this.qtRequest = qtRequest;
	}

	public Question() {
		super();
	}

	public Question(String userId, String qtPhone, Date qtDate, String qtRequest) {
		super();
		this.userId = userId;
		this.qtPhone = qtPhone;
		this.qtDate = qtDate;
		this.qtRequest = qtRequest;
	}
	
	

	public Question(String userId, String qtPhone, Date qtDate) {
		super();
		this.userId = userId;
		this.qtPhone = qtPhone;
		this.qtDate = qtDate;
	}

	@Override
	public String toString() {
		return "Question [userId=" + userId + ", qtPhone=" + qtPhone + ", qtDate=" + qtDate + ", qtRequest=" + qtRequest
				+ "]";
	}

	
}
