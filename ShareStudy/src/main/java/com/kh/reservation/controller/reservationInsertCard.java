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
 * Servlet implementation class reservationInsertCard
 */
@WebServlet("/reservationInsertCard.re")
public class reservationInsertCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reservationInsertCard() {
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
		
		
		
		// 임시 → 상품 상세 페이지에서 전달받은 roomNumber값으로 지정해야 한다. 
		
		String rvNo = request.getParameter("rvNo");
		
		String roomNo = "1"; // 수정 필요. 
		
		String userId = request.getParameter("userId"); 
		String rvDate = request.getParameter("rvDate"); //방문 날짜
		int rePeople = Integer.parseInt(request.getParameter("rePeople")); // 예약 인원수 
		String rvRequest = request.getParameter("rvRequest"); //요청사항
		String rvPayment = request.getParameter("rvPayment"); // 결제 수단
		String buyEmail = request.getParameter("buyEmail"); // 결제 수단
		String amount = request.getParameter("amount");
		System.out.println(amount);
		
		Reservation reserInfo = new Reservation(rvNo,roomNo,userId,rePeople,rvDate,rvPayment,rvRequest);
		
		//int result = new ReservationService().insertRvCard(reserInfo, buyEmail, amount);
		int result = new ReservationService().insertRvCard(reserInfo, buyEmail, amount);
		
		if(result>0) {
			response.getWriter().print(result);
		}else {
			//response.sendRedirect(request.getContextPath());
		}
		
		
	}

}
