package com.kh.notice.model.vo;

import java.sql.Date;

public class ReAttachment {
	
	private String fileNo;  
	private int reviewNo;  
	private String originName;  
	private String changeName; 
	private String filePath; 
	private Date uploadDate; 
	private String status; 
	private int fileLevel;
	
	public ReAttachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReAttachment(String fileNo, int reviewNo, String originName, String changeName, String filePath,
			Date uploadDate, String status, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.reviewNo = reviewNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.fileLevel = fileLevel;
	}
	
	

	
	public ReAttachment(String fileNo, int reviewNo, String originName, String changeName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.reviewNo = reviewNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "ReAttachment [fileNo=" + fileNo + ", reviewNo=" + reviewNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status="
				+ status + ", fileLevel=" + fileLevel + "]";
	} 
	
	
	

}
