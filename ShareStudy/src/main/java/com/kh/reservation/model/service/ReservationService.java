package com.kh.reservation.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Reservation;

public class ReservationService {

	// 예약 정보 저장 및 예약 여부 변경 메소드 
	public int insertReservation(Reservation reserInfo, String userId, String bank, String rvName, String payDate) {		

		Connection conn = JDBCTemplate.getConnection();
		
		// RV_NO 예약 번호를 미리 뽑아놓고 
		// 해당 번호로 룸 예약 정보 넣고, 
		// 결제 방법에 따라 결제 정보 저장 // 무통장, 신용카드 미리 뽑아둔 예약 번호와 userId를 전달하여 정보 저장 
		
		
		String rvNo = new ReservationDao().selectRvNo(conn);
		String roomNo = reserInfo.getRoomNo();
		
		System.out.println(rvNo);
		int result1 = 0; 
		int result2 = 0;
		int rvPayment = 0;

		if(!rvNo.equals("")) {
			reserInfo.setRvNo(rvNo); // 예약 번호 
			
			// 룸 예약시 입력한 정보 넣기 
			result1 = new ReservationDao().insertReservation(conn, reserInfo);
			//room 예약 여부 변경 메소드 
			result2 = new ReservationDao().updateRoomStatement(conn, roomNo); // 상품의 번호를 전달해야 한다.
			
			if(result1*result2 > 0) {
				// 무통장 입금 정보 저장 메소드 
				rvPayment = new ReservationDao().insertRvPayment(conn, rvNo, userId, bank, rvName, payDate);
			}else {
				System.out.println("예약정보 저장 실패--");
			}
		}else { 
			System.out.println("예약정보 저장 실패--");
		}
		
		
		if(result1*result2*rvPayment > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result1*result2*rvPayment;
	}
	
	

	
}
