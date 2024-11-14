package com.kh.manager.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.manager.model.vo.Manager;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.User;
import com.kh.notice.model.vo.Review;
import com.kh.reservation.model.vo.Reservation;
import com.kh.room.model.vo.Room;

public class ManagerDao {
	
	private Properties prop = new Properties();
	
       public ManagerDao() {
		
		String filePath = ManagerDao.class.getResource("/resources/mappers/manager-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Manager loginManager(Connection conn, String manId, String manPwd) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Manager m = null;
		
		String sql = prop.getProperty("loginManager");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, manId);
			pstmt.setString(2, manPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Manager(rset.getString("MANAGER_ID"),
						        rset.getString("MANAGER_PASSWORD"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		
		return m;
	}

	public ArrayList<User> selectAllMember(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
	    
		ArrayList<User> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAllMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				 list.add(new User(
						    rset.getString("USER_ID"),
						    rset.getString("USER_NAME"),
						    rset.getString("USER_PHONE"),
						    rset.getString("EMAIL"),
						    rset.getDate("ENROLLDATE"),
						    rset.getString("ADACCEPT")));
			}
//			 while (rset.next()) {
//		            User user = new User(
//		                rset.getString("USER_ID"),
//		                rset.getString("USER_NAME"),
//		                rset.getString("EMAIL"),
//		                rset.getString("USER_PHONE"),
//		                rset.getDate("ENROLLDATE"),
//		                rset.getString("ADACCEPT")
//		            );
//		            System.out.println("Retrieved User: " + user); // 디버깅 출력
//		            list.add(user);
//			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Room> selectAllRoom(Connection conn){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
	    
		ArrayList<Room> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAllRoom");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				 list.add(new Room(
						    rset.getString("ROOM_NO"),
						    rset.getString("REGION_NO"),
						    rset.getString("ROOM_NAME"),
						    rset.getString("ROOM_SIZE"),
						    rset.getString("PRICE"),
						    rset.getString("STATUS")));
			}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		} 
		
		return list;
	}

	public ArrayList<Question> selectAllQuestion(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
	    
		ArrayList<Question> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAllQuestion");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Question(
						  rset.getString("USER_ID"),
						  rset.getString("QT_PHONE"),
						  rset.getDate("QT_DATE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		} 
		
		return list;
	}

	public int deleteMember(Connection conn, String memId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}

	public ArrayList<Review> selectAllReview(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
        ArrayList<Review> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAllReview");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Review(
						  rset.getDate("REVIEW_DATE"),
						  rset.getString("USER_ID"),
						  rset.getString("REVIEW_TITLE")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return list;
	}

	public ArrayList<Reservation> selectAllReservation(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
        ArrayList<Reservation> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAllReservation");
		

		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Reservation(
						  rset.getString("RV_NO"),
						  rset.getString("ROOM_NO"),
						  rset.getString("USER_ID"),
						  rset.getString("RV_DATE"),
						  rset.getDate("RV_CONFIRM"),
						  rset.getString("RV_PAYMENT")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public int deleteQuestion(Connection conn, String memId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int deleteReview(Connection conn, String memId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int deleteRoom(Connection conn, String roomNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteRoom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, roomNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int deleteReservation(Connection conn, String rvNo) {
		
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

}
