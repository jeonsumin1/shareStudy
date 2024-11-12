package com.kh.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.room.model.service.RoomService;
import com.kh.room.model.vo.Attachment;
import com.kh.room.model.vo.Room;

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
		
		// 예약할 룸 정보 불러오는 메소드 
//		String roomNo = request.getParameter("rno");
//	    System.out.println(roomNo);
//	    
//        RoomService rService = new RoomService();
//        
//        Room room = rService.selectRoom(roomNo);
//        
//        request.setAttribute("room", room);
		
        
		request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
