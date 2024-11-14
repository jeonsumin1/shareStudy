package com.kh.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.ReservationSelect;

/**
 * Servlet implementation class reservationInsertCard
 */
@WebServlet("/reservationInsertCard.re")
public class ReservationInsertCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInsertCard() {
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
		
		// 신용카드 결제시 생성되는 주문번호 (신용카드 결제 예약 번호 != 시퀀스) 
		String rvNo = request.getParameter("rvNo");
		
		String roomNo = request.getParameter("rno"); 
		
		String userId = request.getParameter("userId"); 
		String rvDate = request.getParameter("rvDate"); //방문 날짜
		int rePeople = Integer.parseInt(request.getParameter("rePeople")); // 예약 인원수 
		String rvRequest = request.getParameter("rvRequest"); //요청사항
		String rvPayment = request.getParameter("rvPayment"); // 결제 수단
		String buyEmail = request.getParameter("buyEmail"); // 결제 수단
		String amount = request.getParameter("amount");
		
		Reservation reserInfo = new Reservation(rvNo,roomNo,userId,rePeople,rvDate,rvPayment,rvRequest);
		
		int result = new ReservationService().insertRvCard(reserInfo, buyEmail, amount);
		
		if(result>0) {
			response.getWriter().print(result);
			System.out.println(result);
			ReservationSelect rePaySuccessInfo = new ReservationService().selReSuccessInfo(rvNo);
			request.getSession().setAttribute("reSuccessInfo", rePaySuccessInfo);
			
		}else {
			response.getWriter().print("예약 실패");
		}
		
		
	}

}
