package com.kh.reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.ReservationSelect;
import com.kh.reservation.model.vo.RvBank;

public class ReservationService {

	// 예약 정보 저장 및 예약 여부 변경 메소드 
//	public int insertReservation(Reservation reserInfo, RvBank rvBank) {		
	public String insertReservation(Reservation reserInfo, RvBank rvBank) {		

		Connection conn = JDBCTemplate.getConnection();
		
		// RV_NO 예약 번호를 미리 뽑아놓고 → 예약 번호를 jsp 에서 뽑고 데이터베이스에 바로 저장  
		// 해당 번호로 룸 예약 정보 넣고, 
		// 결제 방법에 따라 결제 정보 저장 // 무통장, 신용카드 미리 뽑아둔 예약 번호와 userId를 전달하여 정보 저장 
		
		String roomNo = reserInfo.getRoomNo();
		String rvNo = new ReservationDao().selectRvNo(conn);
		
		int result1 = 0; 
		int result2 = 0;
		int rvPayment = 0;
		
		if(rvNo != "") { // 예약번호가 null "" 이 아닐 때 
			reserInfo.setRvNo(rvNo);
			
			// 룸 예약시 입력한 정보 넣기 
			result1 = new ReservationDao().insertReservation(conn, reserInfo);
			//room 예약 여부 변경 메소드 
			result2 = new ReservationDao().updateRoomStatement(conn, roomNo); // 상품의 번호를 전달해야 한다.
			
			if(result1*result2 > 0) {
				// 무통장 입금 정보 저장 메소드 
				rvPayment = new ReservationDao().insertRvBank(conn, reserInfo, rvBank);
				
				if(rvPayment>0) {
					if(result1*result2*rvPayment > 0) {
						// 모든 정보가 저장되었을 때 rvNo값 전달.
						JDBCTemplate.commit(conn);
						return rvNo;
					}else {
						JDBCTemplate.rollback(conn);
					}
				}else {
					System.out.println("");
				}
					
			}else {
				System.out.println("예약정보 저장 실패--");
			}
		}
		
		JDBCTemplate.close(conn);
		
//		return result1*result2*rvPayment;
		return null;
	}

	
	public int insertRvCard(Reservation reserInfo, String buyEmail, String amount) {

		Connection conn = JDBCTemplate.getConnection();
		
		String roomNo = reserInfo.getRoomNo();
		
		int result1 = 0; 
		int result2 = 0;
		int rvPayment = 0;
		
		// 룸 예약시 입력한 정보 넣기 
		result1 = new ReservationDao().insertReservation(conn, reserInfo);
		//room 예약 여부 변경 메소드 
		result2 = new ReservationDao().updateRoomStatement(conn, roomNo); // 상품의 번호를 전달해야 한다.
		
		if(result1*result2 > 0) {
			// 카드결제 입금 정보 저장 메소드 
			rvPayment = new ReservationDao().insertRvCard(conn, reserInfo, buyEmail, amount);
			
		}else {
			System.out.println("예약정보 저장 실패--");
		}
		
		// 트랜잭션처리; 
		if(result1*result2*rvPayment > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result1*result2*rvPayment;
	}

	
	// 결제 완료 내역 확인 메소드 
	public ReservationSelect selReSuccessInfo(String rvNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ReservationSelect reSuccessInfo = new ReservationDao().selReSuccessInfo(conn, rvNo);
		
		JDBCTemplate.close(conn);
		
		return reSuccessInfo;
	}


	// 예약 내역 리스트 
	public ArrayList<Reservation> selectReserList(String userId) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reservation> relist = new ReservationDao().selectReserList(conn, userId);
		
		JDBCTemplate.close(conn);

		return relist;
	}
	
	

	
}
