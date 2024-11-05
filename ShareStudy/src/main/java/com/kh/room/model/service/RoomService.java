package com.kh.room.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.Jdbc41Bridge;

import com.kh.common.JDBCTemplate;
import com.kh.room.model.dao.RoomDao;
import com.kh.room.model.vo.Attachment;
import com.kh.room.model.vo.Room;

public class RoomService {
	//룸나열페이지 작성 메소드
	public int insertPhoto(Room r, ArrayList<Attachment> atList) {
	    Connection conn = JDBCTemplate.getConnection();
	    
	    RoomDao dao = new RoomDao();
	    
	    int result1 = dao.insertPhoto(conn, r);
	    int result2 = 1;
	    
	    if(result1 > 0 && !atList.isEmpty()) {
	        result2 = dao.insertAttachmentList(conn, atList);
	    }
	    
	    if(result1 > 0 && result2 > 0) {
	        JDBCTemplate.commit(conn);
	    } else {
	        JDBCTemplate.rollback(conn);
	    }
	    
	    JDBCTemplate.close(conn);
	    
	    return (result1 * result2);
	}

	public ArrayList<Room> selectThumbnailList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Room> list = new RoomDao().selectThumbnailList(conn);
		
		JDBCTemplate.close(conn);
		
		
		return list;
	}
	
	
	public int insertRoom(Room r) {
		
		Connection conn =  JDBCTemplate.getConnection();
		
		int result =  new RoomDao().insertRoom(conn,r);
		
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}

}
