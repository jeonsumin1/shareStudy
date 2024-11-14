package com.kh.room.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.room.model.vo.Attachment;
import com.kh.room.model.vo.Region;
import com.kh.room.model.vo.Room;

public class RoomDao {
    private Properties prop = new Properties();
    
    public RoomDao() {
        String filePath = RoomDao.class.getResource("/resources/mappers/room-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Region> selectRegionList(Connection conn) {
        ArrayList<Region> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectRegionList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Region region = new Region();
                region.setRegionNo(rset.getString("REGION_NO"));
                region.setRegionName(rset.getString("REGION_NAME"));
                list.add(region);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return list;
    }

    public int insertRoom(Connection conn, Room r) {
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("insertRoom");

        try {
            pstmt = conn.prepareStatement(sql);

            // 컬럼 순서: ROOM_NO, REGION_NO, ROOM_SIZE, ROOM_NAME, ROOM_ADDRESS, 
            //          PRICE, USE_NIGHT, PARKING, EATING, STATUS
            pstmt.setString(1, r.getRoomNo());
            pstmt.setString(2, r.getRegionNo());
            pstmt.setString(3, r.getRoomSize());
            pstmt.setString(4, r.getRoomName());
            pstmt.setString(5, r.getRoomAddress());
            pstmt.setString(6, r.getPrice());
            pstmt.setString(7, r.getUseNight());
            pstmt.setString(8, r.getParking());
            pstmt.setString(9, r.getEating());
            // STATUS는 'Y'로 기본값 설정됨

            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public int insertAttachmentList(Connection conn, ArrayList<Attachment> atList) {
        int result = 1;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("insertAttachment");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            for(Attachment at : atList) {
              
                pstmt.setString(1, at.getRoomNo());
                pstmt.setString(2, at.getOriginName());
                pstmt.setString(3, at.getChangeName());
                pstmt.setString(4, at.getFilePath());
                pstmt.setInt(5, at.getFileLevel());
                
                result *= pstmt.executeUpdate();
                
                // 한 건이라도 실패하면 result는 0이 됨
                if(result == 0) {
                    break;
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            result = 0;
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }

    public ArrayList<Room> selectThumbnailList(Connection conn) {
        ArrayList<Room> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("selectThumbnailList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Room r = new Room();
                r.setRoomNo(rset.getString("ROOM_NO"));
                r.setRegionNo(rset.getString("REGION_NO"));
                r.setRoomName(rset.getString("ROOM_NAME"));
                r.setRoomAddress(rset.getString("ROOM_ADDRESS"));
                r.setRoomSize(rset.getString("ROOM_SIZE"));
                r.setPrice(rset.getString("PRICE"));
                r.setUseNight(rset.getString("USE_NIGHT"));
                r.setParking(rset.getString("PARKING"));
                r.setEating(rset.getString("EATING"));
                r.setTitleImg(rset.getString("TITLE_IMG"));
                r.setRegionName(rset.getString("regionName"));
                
                list.add(r);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return list;
    }
    
    public Room selectRoom(Connection conn, String roomNo) {
        Room room = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectRoom");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, roomNo);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                room = new Room();
                room.setRoomNo(rset.getString("ROOM_NO"));
                room.setRegionNo(rset.getString("REGION_NO"));
                room.setRoomName(rset.getString("ROOM_NAME"));
                room.setRoomAddress(rset.getString("ROOM_ADDRESS"));
                room.setRoomSize(rset.getString("ROOM_SIZE"));
                room.setPrice(rset.getString("PRICE"));
                room.setUseNight(rset.getString("USE_NIGHT"));
                room.setParking(rset.getString("PARKING"));
                room.setEating(rset.getString("EATING"));
                room.setStatus(rset.getString("STATUS"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return room;
    }
    
    public ArrayList<Attachment> selectAttachmentList(Connection conn, String roomNo) {
        ArrayList<Attachment> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectAttachmentList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, roomNo);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Attachment at = new Attachment();
                at.setFileNo(rset.getString("FILE_NO"));
                at.setOriginName(rset.getString("ORIGIN_NAME"));
                at.setChangeName(rset.getString("CHANGE_NAME"));
                at.setFilePath(rset.getString("FILE_PATH"));
                at.setUploadDate(rset.getDate("UPLOAD_DATE"));
                at.setFileLevel(rset.getInt("FILE_LEVEL"));
                
                list.add(at);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        
        return list;
    }

	public int deleteRoom(Connection conn, String roomNo) {
		 int result = 0;
		    PreparedStatement pstmt = null;
		    
		    String sql = prop.getProperty("deleteRoom");
		    
		    try {
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, roomNo);
		        
		        result = pstmt.executeUpdate();
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        JDBCTemplate.close(pstmt);
		    }
		    
		    return result;
	}
}