package com.kh.reservation.model.vo;

import java.sql.Date;

public class ReservationSelect {
	private String rvNo;
	private String roomName;
	private String userId;
	private String rvPeople;
	private Date rvDate;
	private String rvConfirm;
	private String payment;
	private String rvRequest;
	private String bAmount;
	private String pAmount;

	public ReservationSelect() {
		super();
	}

	public ReservationSelect(String rvNo, String roomName, String userId, String rvPeople, Date rvDate,
			String rvConfirm, String payment, String rvRequest, String bAmount, String pAmount) {
		super();
		this.rvNo = rvNo;
		this.roomName = roomName;
		this.userId = userId;
		this.rvPeople = rvPeople;
		this.rvDate = rvDate;
		this.rvConfirm = rvConfirm;
		this.payment = payment;
		this.rvRequest = rvRequest;
		this.bAmount = bAmount;
		this.pAmount = pAmount;
	}

	public String getRvNo() {
		return rvNo;
	}

	public void setRvNo(String rvNo) {
		this.rvNo = rvNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRvPeople() {
		return rvPeople;
	}

	public void setRvPeople(String rvPeople) {
		this.rvPeople = rvPeople;
	}

	public Date getRvDate() {
		return rvDate;
	}

	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}

	public String getRvConfirm() {
		return rvConfirm;
	}

	public void setRvConfirm(String rvConfirm) {
		this.rvConfirm = rvConfirm;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getRvRequest() {
		return rvRequest;
	}

	public void setRvRequest(String rvRequest) {
		this.rvRequest = rvRequest;
	}

	public String getbAmount() {
		return bAmount;
	}

	public void setbAmount(String bAmount) {
		this.bAmount = bAmount;
	}

	public String getpAmount() {
		return pAmount;
	}

	public void setpAmount(String pAmount) {
		this.pAmount = pAmount;
	}

	@Override
	public String toString() {
		return "ReservationSelect [rvNo=" + rvNo + ", roomName=" + roomName + ", userId=" + userId + ", rvPeople="
				+ rvPeople + ", rvDate=" + rvDate + ", rvConfirm=" + rvConfirm + ", payment=" + payment + ", rvRequest="
				+ rvRequest + ", bAmount=" + bAmount + ", pAmount=" + pAmount + "]";
	}

}
