package com.kh.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.reservation.model.vo.Reservation;

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
			
			pstmt.setString(1, reserInfo.getUserId());
			pstmt.setInt(2, reserInfo.getRePeople());
			pstmt.setString(3, reserInfo.getReDate());
			pstmt.setString(4, reserInfo.getRvPayment());
			pstmt.setString(5, reserInfo.getRvRequest());
			
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

}
