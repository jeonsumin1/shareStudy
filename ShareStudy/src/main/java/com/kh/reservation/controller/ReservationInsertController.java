package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationInsertController
 */
@WebServlet("/reservation.re")
public class ReservationInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	
		
		// 임시 → 상품 상세 페이지에서 전달받은 roomNumber값으로 지정해야 한다. 
		String roomNo = "1";
		
		String userId = request.getParameter("userName"); // (전달받은 회원의 아이디를 전달해야 한다.)
		int rePeople = Integer.parseInt(request.getParameter("rePeople")); // 예약 인원수 
		String rvDate = request.getParameter("rvDate"); //방문 날짜
		String rvPayment = request.getParameter("rvPayment"); // 결제 수단
		String rvRequest = request.getParameter("rvRequest"); //요청사항
		
		System.out.println(roomNo+" "+userId+" "+rePeople+" "+rvDate+" "+rvPayment+" "+rvRequest);
		
		Reservation reserInfo = new Reservation(roomNo, userId,rePeople,rvDate,rvPayment,rvRequest);
		
		
		int result = new ReservationService().insertReservation(reserInfo);
		
		String alertMsg = "";
		
		if(result>0) {
			System.out.println("성공");
			alertMsg = "예약이 완도되었습니다.";
		}else { // 예약 정보, 예약여부 변경 실패			
			System.out.println("실패");
			alertMsg = "예약에 실패하셨습니다. 다시 시도해 주세요.";
		}
		
		request.getSession().setAttribute("alertMsg", alertMsg);
	}

}

