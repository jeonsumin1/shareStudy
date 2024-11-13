package com.kh.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.User;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class reservationListViewController
 */
@WebServlet("/rvlist.shs")
public class ReservationListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		// 로그인한 회원의 번호로만 조회해 와야 한다. 
		User userInfo = (User)session.getAttribute("userInfo");
		String userId = userInfo.getUserId();		
		
		ArrayList<Reservation> relist = new ReservationService().selectReserList(userId);  // 전달값 없이 메소드 호출
		
		request.setAttribute("relist", relist);
		
		request.getRequestDispatcher("/views/reservation/reservationListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
