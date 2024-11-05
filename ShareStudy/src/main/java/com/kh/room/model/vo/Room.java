package com.kh.room.model.vo;

public class Room {
	private String roomNo;			//	ROOM_NO	VARCHAR2(100 BYTE)
	private String regionNo;			//	REGION_NO	VARCHAR2(100 BYTE) STRING으로 처리
	private String roomSize;			//	ROOM_SIZE	VARCHAR2(1000 BYTE)
	private String roomName;			//	ROOM_NAME	VARCHAR2(1000 BYTE)
	private String roomAddress;			//	ROOM_ADDRESS	VARCHAR2(1000 BYTE)
	private String price;			//	PRICE	VARCHAR2(1000 BYTE)
	private String useNight;			//	USE_NIGHT	VARCHAR2(1 BYTE)
	private String parking;			//	PARKING	VARCHAR2(1 BYTE)
	private String eating;			//	EATING	VARCHAR2(1 BYTE)
	private String status;			//	STATUS	VARCHAR2(1 BYTE)
	
	private String titleImg;
	
	public Room() {
		super();
	}
	public Room(String roomNo, String regionNo, String roomSize, String roomName, String roomAddress, String price,
			String useNight, String parking, String eating, String status) {
		super();
		this.roomNo = roomNo;
		this.regionNo = regionNo;
		this.roomSize = roomSize;
		this.roomName = roomName;
		this.roomAddress = roomAddress;
		this.price = price;
		this.useNight = useNight;
		this.parking = parking;
		this.eating = eating;
		this.status = status;
	}
	
	public Room(String roomNo, String regionNo, String roomSize, String roomName, String roomAddress, String price,
			String useNight, String parking, String eating) {
		super();
		this.roomNo = roomNo;
		this.regionNo = regionNo;
		this.roomSize = roomSize;
		this.roomName = roomName;
		this.roomAddress = roomAddress;
		this.price = price;
		this.useNight = useNight;
		this.parking = parking;
		this.eating = eating;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getRegionNo() {
		return regionNo;
	}
	public void setRegionNo(String regionNo) {
		this.regionNo = regionNo;
	}
	public String getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomAddress() {
		return roomAddress;
	}
	public void setRoomAddress(String roomAddress) {
		this.roomAddress = roomAddress;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getUseNight() {
		return useNight;
	}
	public void setUseNight(String useNight) {
		this.useNight = useNight;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getEating() {
		return eating;
	}
	public void setEating(String eating) {
		this.eating = eating;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", regionNo=" + regionNo + ", roomSize=" + roomSize + ", roomName=" + roomName
				+ ", roomAddress=" + roomAddress + ", price=" + price + ", useNight=" + useNight + ", parking="
				+ parking + ", eating=" + eating + ", status=" + status + "]";
	}

	
	
	
}
