package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.model.service.ManagerService;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.User;
import com.kh.notice.model.vo.Review;
import com.kh.reservation.model.vo.Reservation;
import com.kh.room.model.vo.Room;

/**
 * Servlet implementation class ManagerSelectMember
 */
@WebServlet("/selectAll.ma")
public class ManagerSelectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSelectAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
		//모든 정보를 조회해서 표에 넣을예정
		//회원, 예약내역, 상품, 상담신청, 리뷰 
        //SELECT 문을 이용
		
		//회원
		ArrayList<User> list = new ManagerService().selectAllMember();		
		request.getSession().setAttribute("mList", list);
		
		//룸(상품)
		ArrayList<Room> list2 = new ManagerService().selectAllRoom();
		request.getSession().setAttribute("rList", list2);
		
		//리뷰
		ArrayList<Review> list3 = new ManagerService().selectAllReview();
		request.getSession().setAttribute("vList", list3);
		
		//1:1 문의내역
		ArrayList<Question> list4 = new ManagerService().selectAllQuestion();
		request.getSession().setAttribute("qList", list4);
		
		//룸 예약
        ArrayList<Reservation> list5 = new ManagerService().selectAllReservation();
		request.getSession().setAttribute("rvList", list5);
		
		
		request.getRequestDispatcher("/views/manager/m_Frame.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
