package com.kh.notice.model.vo;

import java.sql.Date;

public class Review {

	private int reviewNo;
	private String userId;
	private String roomNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private int reviewCount;
	private String reviewStatus;
	private String regionName;
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	
	
	public Review(int reviewNo, Date reviewDate, String userId, String reviewTitle) {
		super();
		this.reviewNo = reviewNo;
		this.reviewDate = reviewDate;
		this.userId = userId;
		this.reviewTitle = reviewTitle;
	}
	


	public Review(int reviewNo, String userId, String roomNo, String reviewTitle, Date reviewDate, String reviewContent,
			String regionName) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.roomNo = roomNo;
		this.reviewTitle = reviewTitle;
		this.reviewDate = reviewDate;
		this.reviewContent = reviewContent;
		this.regionName = regionName;
	}



	public Review(Date reviewDate, String userId, String reviewTitle) {
		super();
		this.reviewDate = reviewDate;
		this.userId = userId;
		this.reviewTitle = reviewTitle;
	}



	public Review(int reviewNo, String userId, String roomNo, String reviewTitle, String reviewContent, Date reviewDate,
			int reviewCount, String reviewStatus, String regionName) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.roomNo = roomNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.reviewStatus = reviewStatus;
		this.regionName = regionName;
	}
	
	
	
	public Review(int reviewNo, String userId, String reviewTitle, Date reviewDate, int reviewCount,
			String regionName) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.reviewTitle = reviewTitle;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.regionName = regionName;
	}

	public Review(int reviewNo, String userId, String roomNo, String reviewTitle, String reviewContent, Date reviewDate,
			int reviewCount, String regionName) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.roomNo = roomNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewCount = reviewCount;
		this.regionName = regionName;
	}

	
	
	

	

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", userId=" + userId + ", roomNo=" + roomNo + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate + ", reviewCount="
				+ reviewCount + ", reviewStatus=" + reviewStatus + ", regionName=" + regionName + "]";
	}
	
}
	
	
	
	
	
	
	