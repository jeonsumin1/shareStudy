package com.kh.manager.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.common.JDBCTemplate;
import com.kh.manager.model.dao.ManagerDao;
import com.kh.manager.model.vo.Manager;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.User;
import com.kh.notice.model.vo.Review;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.RvBank;
import com.kh.room.model.vo.Room;

public class ManagerService {

	public Manager loginManager(String manId, String manPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Manager m = new ManagerDao().loginManager(conn, manId, manPwd);

        JDBCTemplate.close(conn);
		
		return m;
	}

	public ArrayList<User> selectAllMember() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<User> list = new ManagerDao().selectAllMember(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public ArrayList<Room> selectAllRoom(){
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Room> list = new ManagerDao().selectAllRoom(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

	public ArrayList<Question> selectAllQuestion() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Question> list = new ManagerDao().selectAllQuestion(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public ArrayList<Review>  selectAllReview(){
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ManagerDao().selectAllReview(conn);
		
		return list;
	}
	
    public ArrayList<Reservation>  selectAllReservation(){
		
    	Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> list = new ManagerDao().selectAllReservation(conn);
		
		return list;
	}

	public int deleteMember(String memId) {
		
        Connection conn = JDBCTemplate.getConnection();
		
		int result = new ManagerDao().deleteMember(conn,memId);
				
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int deleteQuestion(String memId) {
		
		 Connection conn = JDBCTemplate.getConnection();
			
		  int result = new ManagerDao().deleteQuestion(conn,memId);
					
		  if(result>0) {
				JDBCTemplate.commit(conn);
		  }else {
				JDBCTemplate.rollback(conn);
		  }
			
		  JDBCTemplate.close(conn);
			
		  return result;
	}

	public int deleteReview(String vNo) {
		 
		Connection conn = JDBCTemplate.getConnection();
			
		int result = new ManagerDao().deleteReview(conn,vNo);
					
	    if(result>0) {
				JDBCTemplate.commit(conn);
		}else {
				JDBCTemplate.rollback(conn);
		}
			
	    JDBCTemplate.close(conn);
			
		return result;
	}

	public int deleteRoom(String roomNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ManagerDao().deleteRoom(conn,roomNo);
					
	    if(result>0) {
				JDBCTemplate.commit(conn);
		}else {
				JDBCTemplate.rollback(conn);
		}
			
	    JDBCTemplate.close(conn);
			
		return result;
	}

	public int deleteReservation(String rvNo) {
		
        Connection conn = JDBCTemplate.getConnection();
		
		int result = new ManagerDao().deleteReservation(conn,rvNo);
					
	    if(result>0) {
				JDBCTemplate.commit(conn);
		}else {
				JDBCTemplate.rollback(conn);
		}
			
	    JDBCTemplate.close(conn);
			
		return result;
	}

	public ArrayList<Review> selectReview(String vNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ManagerDao().selectReview(conn, vNo);
		
		return list;
		
	}

	public Reservation selectReservation(String rvNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		Reservation r = new ManagerDao().selectReservation(conn, rvNo);
		
		
		return r;
	}

	public RvBank selectBank(String rvNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		RvBank b = new ManagerDao().selectBank(conn, rvNo);
		
		
		return b;
	}

}
