package com.kh.room.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.room.model.dao.RoomDao;
import com.kh.room.model.vo.Attachment;
import com.kh.room.model.vo.Region;
import com.kh.room.model.vo.Room;

public class RoomService {
    
    public int insertPhoto(Room r, ArrayList<Attachment> atList) {
        Connection conn = null;
        int result = 0;
        
        try {
            conn = JDBCTemplate.getConnection();
            conn.setAutoCommit(false);
            
            RoomDao dao = new RoomDao();
            
            // Room 데이터 삽입
            int result1 = dao.insertRoom(conn, r);
            int result2 = 1;
            
            // 첨부파일이 있는 경우 삽입
            if(result1 > 0 && !atList.isEmpty()) {
            	result2 = dao.insertAttachmentList(conn, atList);
            }
            
            // 모든 작업이 성공한 경우에만 커밋
            if(result1 > 0 && result2 > 0) {
                JDBCTemplate.commit(conn);
                result = 1;
            } else {
                JDBCTemplate.rollback(conn);
            }
            
        } catch (Exception e) {
            JDBCTemplate.rollback(conn);
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(conn);
        }
        
        return result;
    }

    public ArrayList<Room> selectThumbnailList() {
        Connection conn = JDBCTemplate.getConnection();
        ArrayList<Room> list = new RoomDao().selectThumbnailList(conn);
        JDBCTemplate.close(conn);
        return list;
    }

    public ArrayList<Region> selectRegionList() {
        Connection conn = JDBCTemplate.getConnection();
        ArrayList<Region> list = new RoomDao().selectRegionList(conn);
        JDBCTemplate.close(conn);
        return list;
    }
    public Room selectRoom(String roomNo) {
        Connection conn = JDBCTemplate.getConnection();
        Room room = new RoomDao().selectRoom(conn, roomNo);
        JDBCTemplate.close(conn);
        return room;
    }
    
    public ArrayList<Attachment> selectAttachmentList(String roomNo) {
        Connection conn = JDBCTemplate.getConnection();
        ArrayList<Attachment> list = new RoomDao().selectAttachmentList(conn, roomNo);
        JDBCTemplate.close(conn);
        return list;
    }

	

	public int updateRoom(Room room, ArrayList<Attachment> newAtList) {
	    Connection conn = null;
	    int result = 0;
	    
	    try {
	        conn = JDBCTemplate.getConnection();
	        conn.setAutoCommit(false);
	        
	        RoomDao dao = new RoomDao();
        // 1. 스터디룸 정보 수정
	        result = dao.updateRoom(conn, room);
	        
	        // 2. 첨부파일 처리
	        if(result > 0 && !newAtList.isEmpty()) {
	            int atResult = 1;
	            
	            for(Attachment at : newAtList) {
	                if(at.getFileNo() != null) { // 기존 파일 수정
	                    atResult *= dao.updateAttachment(conn, at);
	                } else { // 새로운 파일 추가
	                    atResult *= dao.insertNewAttachment(conn, at);
	                }
	            }
	            
	            if(atResult > 0) {
	                JDBCTemplate.commit(conn);
	                result = 1;
	            } else {
	                JDBCTemplate.rollback(conn);
	                result = 0;
	            }
	        } else if(result > 0) { // 첨부파일 없이 스터디룸 정보만 수정
	            JDBCTemplate.commit(conn);
	        } else {
	            JDBCTemplate.rollback(conn);
	        }
	        
	    } catch (Exception e) {
	        JDBCTemplate.rollback(conn);
	        e.printStackTrace();
	    } finally {
	        JDBCTemplate.close(conn);
	    }
	    
	    return result;
	}
	//상품 삭제메소드
	public int deleteRoom(int roomNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new RoomDao().deleteRoom(conn,roomNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}
	}