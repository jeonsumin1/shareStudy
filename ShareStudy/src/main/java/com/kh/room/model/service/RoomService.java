package com.kh.room.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.User;
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
}