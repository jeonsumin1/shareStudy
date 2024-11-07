package com.kh.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.RvBank;

public class ReservationDao {
	
	private Properties prop = new Properties();

	public ReservationDao() {
		String filePath = ReservationDao.class.getResource("/resources/mappers/reservation-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 예약 정보 저장 메소드 
	public int insertReservation(Connection conn, Reservation reserInfo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reserInfo.getRvNo());
			pstmt.setString(2, "1"); 
			pstmt.setString(3, reserInfo.getUserId());
			pstmt.setInt(4, reserInfo.getRePeople());
			pstmt.setString(5, reserInfo.getReDate());
			pstmt.setString(6, reserInfo.getRvPayment());
			pstmt.setString(7, reserInfo.getRvRequest());
			
			result = pstmt.executeUpdate();
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	// 상품 예약 여부 정보 업데이트 메소드 
		// → 예약 일자 지난 뒤 상품 예약 여부 정보 수정해야 한다. -> 관리자페이지에서. 지금은 자동으로 구현 불가능?  
	public int updateRoomStatement(Connection conn, String roomNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateRoomStatement");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, roomNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	// 예약 번호 시퀀스 번호 추출 메소드 
//	public String selectRvNo(Connection conn) {
//		
//		String rvNo = "";
//		ResultSet rset = null;
//		PreparedStatement pstmt = null;
//		
//		String sql = prop.getProperty("selectRvNo");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				rvNo = rset.getString("RV_NO");
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(rset);
//			JDBCTemplate.close(pstmt);
//		}
//		
//		return rvNo;
//	}

	// 무통장 입금 정보 저장 메소드 
	public int insertRvBank(Connection conn, Reservation reserInfo, RvBank rvBank) {
		// reserInfo, rvBank
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertRvBank");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reserInfo.getRvNo());
			pstmt.setString(2, reserInfo.getUserId());
			pstmt.setString(3, rvBank.getRvBank());
			pstmt.setString(4, rvBank.getRvName());
			pstmt.setString(5, rvBank.getRvDate());
			pstmt.setString(6, rvBank.getAmount());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	// 신용카드 결제 정보 저장 메소드 
	public int insertRvCard(Connection conn, Reservation reserInfo, String buyEmail, String amount) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertRvCard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reserInfo.getRvNo());
			pstmt.setString(2, reserInfo.getUserId());
			pstmt.setString(3, buyEmail);
			pstmt.setString(4, amount);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	

}
