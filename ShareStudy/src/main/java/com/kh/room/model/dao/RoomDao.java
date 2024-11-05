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
import com.kh.room.model.vo.Room;

public class RoomDao {
	
	private Properties prop = new Properties();
	
	public RoomDao() {
		
		String filePath = RoomDao.class.getResource("/resources/mappers/room-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertPhoto(Connection conn, Room r) {
	    int result = 0;
	    PreparedStatement pstmt = null;
	    
	    String sql = "INSERT INTO ROOM (ROOM_NO, REGION_NO, ROOM_SIZE, ROOM_NAME, ROOM_ADDRESS, "
	                + "PRICE, USE_NIGHT, PARKING, EATING, STATUS) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'Y')";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, r.getRoomNo());
	        pstmt.setString(2, r.getRegionNo());
	        pstmt.setString(3, r.getRoomSize());
	        pstmt.setString(4, r.getRoomName());
	        pstmt.setString(5, r.getRoomAddress());
	        pstmt.setString(6, r.getPrice());
	        pstmt.setString(7, r.getUseNight());
	        pstmt.setString(8, r.getParking());
	        pstmt.setString(9, r.getEating());
	        
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
	    
	    String sql = "INSERT INTO ATTACHMENT (FILE_NO, ROOM_NO, ORIGIN_NAME, CHANGE_NAME, "
	                + "FILE_PATH, UPLOAD_DATE, FILE_LEVEL, STATUS) "
	                + "VALUES (SEQ_FNO.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, 'Y')";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        
	        for(Attachment at : atList) {
	            pstmt.setString(1, at.getRoomNo());
	            pstmt.setString(2, at.getOriginName());
	            pstmt.setString(3, at.getChangeName());
	            pstmt.setString(4, at.getFilePath());
	            pstmt.setInt(5, at.getFileLevel());
	            
	            result *= pstmt.executeUpdate();
	        }
	    } catch (SQLException e) {
	        result = 0;
	        e.printStackTrace();
	    } finally {
	        JDBCTemplate.close(pstmt);
	    }
	    return result;
	}

	public ArrayList<Room> selectThumbnailList(Connection conn) {
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    ArrayList<Room> list = new ArrayList<>();
	    
	    // ROOM과 ATTACHMENT 테이블을 조인하여 대표이미지(FILE_LEVEL = 1)와 함께 조회
	    String sql = "SELECT R.*, A.FILE_PATH || A.CHANGE_NAME AS TITLE_IMG "
	               + "FROM ROOM R "
	               + "LEFT JOIN (SELECT * FROM ATTACHMENT WHERE FILE_LEVEL = 1) A ON R.ROOM_NO = A.ROOM_NO "
	               + "WHERE R.STATUS = 'Y' "
	               + "ORDER BY R.ROOM_NO DESC";
	    
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
			
			


	public int insertRoom(Connection conn, Room r) {

			PreparedStatement pstmt = null;
			
			int result = 0 ; 
			
			String sql = prop.getProperty("insertRoom");
	
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, r.getRoomNo());
				pstmt.setString(2, r.getRegionNo());
				pstmt.setString(3, r.getRoomName());
				pstmt.setString(4, r.getRoomAddress());
				pstmt.setString(5, r.getRoomSize());
				pstmt.setString(6, r.getPrice());
				pstmt.setString(7, r.getUseNight());
				pstmt.setString(8, r.getParking());
				pstmt.setString(9, r.getEating());
				
				result = pstmt.executeUpdate();
				

				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
			
			
	}

}
