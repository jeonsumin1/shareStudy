package com.kh.reservation.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Reservation;

public class ReservationService {

	// 예약 정보 저장 및 예약 여부 변경 메소드 
	public int insertReservation(Reservation reserInfo) {		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReservationDao().insertReservation(conn, reserInfo);
		
		String roomNo = reserInfo.getRoomNo();
		
		int result2 = 0;
		if(result>0) {
			// 정보가 저장될 경우 해당 상품 예약 여부 변경!
			// room 예약 여부 변경 메소드 
			result2 = new ReservationDao().updateRoomStatement(conn, roomNo); // 상품의 번호를 전달해야 한다.
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	
//	public int updateRoomStatement(int roomNo) {
//		Connection conn = JDBCTemplate.getConnection();
//		
//		int result = new ReservationDao().updateRoomStatement(conn, roomNo);
//		
//		if(result>0) {
//			JDBCTemplate.commit(conn);
//		}else {
//			JDBCTemplate.rollback(conn);
//		}
//		
//		JDBCTemplate.close(conn);
//		
//		return result;
//	}
	
}
