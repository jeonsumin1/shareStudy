package com.kh.room.model.vo;

public class Region {
    private String regionNo;        // REGION_NO VARCHAR2(100 BYTE)
    private String regionName;      // REGION_NAME VARCHAR2(100 BYTE)
    
    public Region() {
        super();
    }
    
    public Region(String regionNo, String regionName) {
        super();
        this.regionNo = regionNo;
        this.regionName = regionName;
    }

    public String getRegionNo() {
        return regionNo;
    }

    public void setRegionNo(String regionNo) {
        this.regionNo = regionNo;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    @Override
    public String toString() {
        return "Region [regionNo=" + regionNo + ", regionName=" + regionName + "]";
    }
}
