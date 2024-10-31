package com.kh.member.model.vo;

public class Manager {
	private String managerId;
	private String magagerPwd;
	
	
	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getMagagerPwd() {
		return magagerPwd;
	}

	public void setMagagerPwd(String magagerPwd) {
		this.magagerPwd = magagerPwd;
	}

	public Manager() {
		super();
	}

	public Manager(String managerId, String magagerPwd) {
		super();
		this.managerId = managerId;
		this.magagerPwd = magagerPwd;
	}

	@Override
	public String toString() {
		return "Manager [managerId=" + managerId + ", magagerPwd=" + magagerPwd + "]";
	}
	
	

}
