package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.ReservationSelect;
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
	
		String roomNo = request.getParameter("rno");
		
		String userId = request.getParameter("userId"); // (전달받은 회원의 아이디를 전달해야 한다.)
		String rvDate = request.getParameter("rvDate"); //방문 날짜
		
		int rePeople = Integer.parseInt(request.getParameter("rePeople")); // 예약 인원수 
		String rvRequest = request.getParameter("rvRequest"); //요청사항
		String rvPayment = request.getParameter("rvPayment"); // 결제 수단
		String bank = request.getParameter("bank"); 			
		String rvName = request.getParameter("rvName"); 			
		String payDate = request.getParameter("payDate"); 			
		String amount = request.getParameter("amount");
		
		// 예약시 입력 정보   // 예약 번호는 시퀀스로 생성. 
		Reservation reserInfo = new Reservation(roomNo,userId,rePeople,rvDate,rvPayment,rvRequest);
		RvBank rvBank = new RvBank(bank, rvName, payDate, amount);
		
//		int result = new ReservationService().insertReservation(reserInfo, rvBank);
		String rvNo = new ReservationService().insertReservation(reserInfo, rvBank);
//		System.out.println(rvNo);
		
//		System.out.println(result);
		
		
//		if(result>0) {
//			response.getWriter().print(result);
//		}else {
//			response.getWriter().print("예약 불가능");
//		}
		
//		
		if(rvNo != null) {
//			// rvNo 결제 번호를 가져온다면 결제 정보 select session에 정보 넣기. 
			ReservationSelect reSuccessInfo = new ReservationService().selReSuccessInfo(rvNo);
			request.getSession().setAttribute("reSuccessInfo", reSuccessInfo);
			response.getWriter().print(rvNo);
				
		}else {
			response.getWriter().print("예약 불가능");
		}
		
	}

}

