package com.kh.member.model.vo;

public class Question {
	private String userId;
	private String qtPhone;
	private String qtDate;
	private String qtRequest;


	
	
	
	public Question() {
		super();
	}


	public Question(String userId, String qtPhone, String qtDate, String qtRequest) {
		super();
		this.userId = userId;
		this.qtPhone = qtPhone;
		this.qtDate = qtDate;
		this.qtRequest = qtRequest;
	}



	public Question(String userId, String qtPhone, String qtDate) {
		super();
		this.userId = userId;
		this.qtPhone = qtPhone;
		this.qtDate = qtDate;
	}


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


	public String getQtDate() {
		return qtDate;
	}

	public void setQtDate(String qtDate) {
		this.qtDate = qtDate;
	}


	public String getQtRequest() {
		return qtRequest;
	}


	public void setQtRequest(String qtRequest) {
		this.qtRequest = qtRequest;
	}


	@Override
	public String toString() {
		return "Question [userId=" + userId + ", qtPhone=" + qtPhone + ", qtDate=" + qtDate + ", qtRequest=" + qtRequest
				+ "]";
	}



