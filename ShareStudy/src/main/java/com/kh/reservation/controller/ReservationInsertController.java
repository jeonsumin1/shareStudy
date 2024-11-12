package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.User;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.RvBank;

/**
 * Servlet implementation class ReservationInsertController
 */
@WebServlet("/reservationInsert.re")
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
		
		String userId = request.getParameter("userId"); // (전달받은 회원의 아이디를 전달해야 한다.)
		String rvNo = request.getParameter("rvNo");
		String rvDate = request.getParameter("rvDate"); //방문 날짜
		int rePeople = Integer.parseInt(request.getParameter("rePeople")); // 예약 인원수 
		String rvRequest = request.getParameter("rvRequest"); //요청사항
		String rvPayment = request.getParameter("rvPayment"); // 결제 수단
		String bank = request.getParameter("bank"); 			
		String rvName = request.getParameter("rvName"); 			
		String payDate = request.getParameter("payDate"); 			
		String amount = request.getParameter("amount");
		
		// 예약시 입력 정보  
		Reservation reserInfo = new Reservation(rvNo,roomNo,userId,rePeople,rvDate,rvPayment,rvRequest);
		RvBank rvBank = new RvBank(bank, rvName, payDate, amount);
		
		int result = new ReservationService().insertReservation(reserInfo, rvBank);
		
		if(result>0) {
			response.getWriter().print(result);
		}else {
			
		}
		
		
	}

}

