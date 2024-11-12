package com.kh.reservation.model.vo;

public class RvBank {
	private String rvNo;// RV_NO VARCHAR2(100 BYTE)
	private String userId; // USER_ID VARCHAR2(100 BYTE)
	private String rvBank;// RV_BANK VARCHAR2(100 BYTE)
	private String rvName;// RV_NAME VARCHAR2(100 BYTE)
	private String rvDate;// RV_DATE DATE
	private String amount;

	public RvBank() {
		super();
	}

	public RvBank(String rvBank, String rvName, String rvDate, String amount) {
		super();
		this.rvBank = rvBank;
		this.rvName = rvName;
		this.rvDate = rvDate;
		this.amount = amount;
	}

	public RvBank(String rvNo, String userId, String rvBank, String rvName, String rvDate, String amount) {
		super();
		this.rvNo = rvNo;
		this.userId = userId;
		this.rvBank = rvBank;
		this.rvName = rvName;
		this.rvDate = rvDate;
		this.amount = amount;
	}

	public String getRvNo() {
		return rvNo;
	}

	public void setRvNo(String rvNo) {
		this.rvNo = rvNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRvBank() {
		return rvBank;
	}

	public void setRvBank(String rvBank) {
		this.rvBank = rvBank;
	}

	public String getRvName() {
		return rvName;
	}

	public void setRvName(String rvName) {
		this.rvName = rvName;
	}

	public String getRvDate() {
		return rvDate;
	}

	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "RvBank [rvNo=" + rvNo + ", userId=" + userId + ", rvBank=" + rvBank + ", rvName=" + rvName + ", rvDate="
				+ rvDate + ", amount=" + amount + "]";
	}

}
