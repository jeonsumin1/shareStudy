package com.kh.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.User;

/**
 * Servlet implementation class ReservationConttroller
 */
@WebServlet("/reservation.re")
public class ReservationConttroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationConttroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		User userInfo = (User)request.getSession().getAttribute("userInfo"); 
		
		HttpSession session = request.getSession();
		
		// 예약 시 로그인되어 있지 않은 경우 로그인 후 예약 가능하도록 로그인 페이지로  
		if(userInfo != null) {
			request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);			
		}else {
			// 로그인 되어 있지 않을 경우 현재 url 경로 저장해서 세션에 넣어주기 
			String reUrl = request.getRequestURI();
			session.setAttribute("reUrl", reUrl);
			
			System.out.println(reUrl);
			
			session.setAttribute("alertMsg", "비회원인 경우 예약이 불가합니다. 로그인을 해주세요.");
			response.sendRedirect(request.getContextPath()+"/login.shs");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
