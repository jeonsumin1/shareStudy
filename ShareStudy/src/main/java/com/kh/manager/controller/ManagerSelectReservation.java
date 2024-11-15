package com.kh.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.model.service.ManagerService;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.RvBank;

/**
 * Servlet implementation class ManagerSelectReservation
 */
@WebServlet("/rvselect.ma")
public class ManagerSelectReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerSelectReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rvNo = request.getParameter("rvNo");
		
		Reservation r = new ManagerService().selectReservation(rvNo);
		RvBank b = new ManagerService().selectBank(rvNo);
		
        request.getSession().setAttribute("rvList", r);
        request.getSession().setAttribute("baList", b);
		
		request.getRequestDispatcher("/views/manager/m_reservationDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
