package com.kh.room.model.vo;

import java.sql.Date;

public class Attachment {
    private String fileNo;          // FILE_NO VARCHAR2(100 BYTE)
    private String roomNo;          // ROOM_NO VARCHAR2(100 BYTE)
    private String originName;      // ORIGIN_NAME VARCHAR2(255 BYTE)
    private String changeName;      // CHANGE_NAME VARCHAR2(255 BYTE)
    private String filePath;        // FILE_PATH VARCHAR2(1000 BYTE)
    private Date uploadDate;        // UPLOAD_DATE DATE
    private int fileLevel;          // FILE_LEVEL NUMBER
    private String status;          // STATUS VARCHAR2(1 BYTE)
    
    public Attachment() {
        super();
    }
    
    public Attachment(String fileNo, String roomNo, String originName, String changeName, String filePath,
            Date uploadDate, int fileLevel, String status) {
        super();
        this.fileNo = fileNo;
        this.roomNo = roomNo;
        this.originName = originName;
        this.changeName = changeName;
        this.filePath = filePath;
        this.uploadDate = uploadDate;
        this.fileLevel = fileLevel;
        this.status = status;
    }

    public String getFileNo() {
        return fileNo;
    }

    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
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

    public int getFileLevel() {
        return fileLevel;
    }

    public void setFileLevel(int fileLevel) {
        this.fileLevel = fileLevel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Attachment [fileNo=" + fileNo + ", roomNo=" + roomNo + ", originName=" + originName + ", changeName="
                + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
                + ", status=" + status + "]";
    }
}