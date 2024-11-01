package com.kh.reservation.model.vo;

import java.sql.Date;

public class Reservation {

	private String rv_no; // RV_NO VARCHAR2(100 BYTE)
	private String roomNo;// ROOM_NO VARCHAR2(100 BYTE)
	private String userId;// USER_ID VARCHAR2(100 BYTE)
	private int rePeople; // RV_PEOPLE NUMBER
	private Date reDate; // 방문시간//RV_DATE DATE
	private Date rvConfirm; // 예약확정일(예약한 날짜)//RV_CONFIRM DATE
	private String pvPayment; // RV_PAYMENT VARCHAR2(100 BYTE)
	private String rvRequest; // RV_REQUEST VARCHAR2(1000 BYTE)

	public Reservation() {
		super();
	}

	public Reservation(String rv_no, String roomNo, String userId, int rePeople, Date reDate, Date rvConfirm,
			String pvPayment, String rvRequest) {
		super();
		this.rv_no = rv_no;
		this.roomNo = roomNo;
		this.userId = userId;
		this.rePeople = rePeople;
		this.reDate = reDate;
		this.rvConfirm = rvConfirm;
		this.pvPayment = pvPayment;
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

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}

	public Date getRvConfirm() {
		return rvConfirm;
	}

	public void setRvConfirm(Date rvConfirm) {
		this.rvConfirm = rvConfirm;
	}

	public String getPvPayment() {
		return pvPayment;
	}

	public void setPvPayment(String pvPayment) {
		this.pvPayment = pvPayment;
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
				+ ", reDate=" + reDate + ", rvConfirm=" + rvConfirm + ", pvPayment=" + pvPayment + ", rvRequest="
				+ rvRequest + "]";
	}

}
