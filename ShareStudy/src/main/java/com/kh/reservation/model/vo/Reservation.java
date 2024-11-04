package com.kh.reservation.model.vo;

import java.sql.Date;

public class Reservation {

	private String rv_no; // RV_NO VARCHAR2(100 BYTE)
	private String roomNo;// ROOM_NO VARCHAR2(100 BYTE)
	private String userId;// USER_ID VARCHAR2(100 BYTE)
	private int rePeople; // RV_PEOPLE NUMBER
	private String reDate; // 방문시간//RV_DATE DATE
	private Date rvConfirm; // 예약확정일(예약한 날짜)//RV_CONFIRM DATE
	private String rvPayment; // RV_PAYMENT VARCHAR2(100 BYTE)
	private String rvRequest; // RV_REQUEST VARCHAR2(1000 BYTE)

	

	public Reservation() {
		super();
	}

	public Reservation(String roomNo, String userId, int rePeople, String reDate, String rvPayment, String rvRequest) {
		super();
		this.roomNo = roomNo;
		this.userId = userId;
		this.rePeople = rePeople;
		this.reDate = reDate;
		this.rvPayment = rvPayment;
		this.rvRequest = rvRequest;
	}

	public Reservation(String rv_no, String roomNo, String userId, int rePeople, String reDate, Date rvConfirm,
			String rvPayment, String rvRequest) {
		super();
		this.rv_no = rv_no;
		this.roomNo = roomNo;
		this.userId = userId;
		this.rePeople = rePeople;
		this.reDate = reDate;
		this.rvConfirm = rvConfirm;
		this.rvPayment = rvPayment;
		this.rvRequest = rvRequest;
	}

	public String getRv_no() {
		return rv_no;
	}

	public void setRv_no(String rv_no) {
		this.rv_no = rv_no;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRePeople() {
		return rePeople;
	}

	public void setRePeople(int rePeople) {
		this.rePeople = rePeople;
	}

	public String getReDate() {
		return reDate;
	}

	public void setReDate(String reDate) {
		this.reDate = reDate;
	}

	public Date getRvConfirm() {
		return rvConfirm;
	}

	public void setRvConfirm(Date rvConfirm) {
		this.rvConfirm = rvConfirm;
	}

	public String getRvPayment() {
		return rvPayment;
	}

	public void setrvPayment(String rvPayment) {
		this.rvPayment = rvPayment;
	}

	public String getRvRequest() {
		return rvRequest;
	}

	public void setRvRequest(String rvRequest) {
		this.rvRequest = rvRequest;
	}

	@Override
	public String toString() {
		return "Reservation [rv_no=" + rv_no + ", roomNo=" + roomNo + ", userId=" + userId + ", rePeople=" + rePeople
				+ ", reDate=" + reDate + ", rvConfirm=" + rvConfirm + ", rvPayment=" + rvPayment + ", rvRequest="
				+ rvRequest + "]";
	}

}
