package com.kh.user.model.vo;

import java.sql.Date;

public class User {
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String rrn;
	private String email;
	private String adAccept;
	private Date enrollDate;
	private String status;
	private String zipCode;
	private String address;
	private String detailAddress;
	
	public User() {
		super();
	}

	public User(String userId, String userPw, String userName, String userPhone, String rrn, String email,
			String adAccept, Date enrollDate, String status, String zipCode, String address, String detailAddress) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.rrn = rrn;
		this.email = email;
		this.adAccept = adAccept;
		this.enrollDate = enrollDate;
		this.status = status;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdAccept() {
		return adAccept;
	}

	public void setAdAccept(String adAccept) {
		this.adAccept = adAccept;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", rrn=" + rrn + ", email=" + email + ", adAccept=" + adAccept + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", zipCode=" + zipCode + ", address=" + address + ", detailAddress="
				+ detailAddress + "]";
	}
	
	
}
