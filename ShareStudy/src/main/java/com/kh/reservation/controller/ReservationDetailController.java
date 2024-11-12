package com.kh.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.ReservationSelect;

/**
 * Servlet implementation class ReservationController
 */
@WebServlet("/reservationDetail.shs")
public class ReservationDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String rvNo = request.getParameter("rvNo");
		
		// 예약 내역에서 상세 보기로 갈 경우 예약 내역 정보 select 메소드 (예약 완료 후 정보는 insertController에서 정보를 바로 전달한다.)
		ReservationSelect reSuccessInfo = new ReservationService().selReSuccessInfo(rvNo);
		request.setAttribute("reSuccessInfo", reSuccessInfo);
		
		request.getRequestDispatcher("/views/reservation/reDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
