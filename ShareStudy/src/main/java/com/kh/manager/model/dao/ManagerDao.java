package com.kh.manager.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.manager.model.vo.Manager;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.User;
import com.kh.notice.model.vo.Review;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.RvBank;
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
						  rset.getString("QT_DATE")));
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
						  rset.getInt("REVIEW_NO"),
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

	public int deleteReview(Connection conn, String vNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
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
	    ResultSet rset = null;
	    int result = 0;

	    try {
	        String selectPaymentSql = "SELECT RV_PAYMENT FROM RESERVATION WHERE RV_NO = ?";
	        pstmt = conn.prepareStatement(selectPaymentSql);
	        pstmt.setString(1, rvNo);
	        rset = pstmt.executeQuery();

	        String rvPayment = null;
	        if (rset.next()) {
	            rvPayment = rset.getString("RV_PAYMENT");
	        }

	        // 'card'일 경우 카드결제 테이블에서 삭제
	        if ("card".equals(rvPayment)) {
	            String deleteCardSql = "DELETE FROM RVPAYMENT WHERE RV_NO = ?";
	            pstmt = conn.prepareStatement(deleteCardSql);
	            pstmt.setString(1, rvNo);
	            result = pstmt.executeUpdate();
	        }
	        // 'bank'일 경우 무통장입금 테이블에서 삭제
	        else if ("bank".equals(rvPayment)) {
	            String deleteBankSql = "DELETE FROM RVBANK WHERE RV_NO = ?";
	            pstmt = conn.prepareStatement(deleteBankSql);
	            pstmt.setString(1, rvNo);
	            result = pstmt.executeUpdate();
	        }

	        // 마지막으로 예약 테이블에서 해당 예약 삭제
	        if (result > 0) {
	            String deleteReservationSql = "DELETE FROM RESERVATION WHERE RV_NO = ?";
	            pstmt = conn.prepareStatement(deleteReservationSql);
	            pstmt.setString(1, rvNo);
	            result = pstmt.executeUpdate();
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCTemplate.close(pstmt);
	        JDBCTemplate.close(rset);
	    }

	    return result;
	}

	public ArrayList<Review> selectReview(Connection conn, String vNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
        ArrayList<Review> list = new ArrayList<>();
		
		String sql = prop.getProperty("detailReview");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vNo);
			
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Review(
						  rset.getInt("REVIEW_NO"),
						  rset.getString("USER_ID"),
						  rset.getString("ROOM_NO"),
						  rset.getString("REVIEW_TITLE"),
						  rset.getDate("REVIEW_DATE"),
						  rset.getString("REGION_NAME"),
						  rset.getString("REVIEW_CONTENT")
						  ));
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			JDBCTemplate.close(pstmt);
		}
	
		
		return list;
		

	}

	public Reservation selectReservation(Connection conn, String rvNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Reservation r = null;
		
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
			    r = new Reservation(rset.getString("RV_NO"),
			    		            rset.getString("ROOM_NO"),
			    		            rset.getString("USER_ID"),
			    		            rset.getInt("RV_PEOPLE"),
			    		            rset.getString("RV_DATE"),
			    		            rset.getDate("RV_CONFIRM"),
			    		            rset.getString("RV_PAYMENT"),
			    		            rset.getString("RV_REQUEST"));	
			
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return r;
	}

	public RvBank selectBank(Connection conn, String rvNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		RvBank b = null;
		
		String sql = prop.getProperty("selectBank");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new RvBank(rset.getString("RV_NO"),
						       rset.getString("RV_BANK"),
						       rset.getString("RV_NAME"),
						       rset.getString("RV_DATE"),
						       rset.getString("AMOUNT"));
			} 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		
		return b;
	}

	public int updateRoom(Connection conn, String rmNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateRoom");
		
		try {
			pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, rmNo);
			
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
