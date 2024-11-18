package com.kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.model.service.ManagerService;

/**
 * Servlet implementation class ManagerDeleteReservation
 */
@WebServlet("/rvdelete.ma")
public class ManagerDeleteReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerDeleteReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
        String rvNo = request.getParameter("rvNo");
        String rmNo = request.getParameter("rmNo");
        
        System.out.println(rmNo);
                
        int result = new ManagerService().deleteReservation(rvNo);
        
        int result2 = new ManagerService().updateRoom(rmNo);
        
        if(result*result2>0) { //삭제 성공
			request.setAttribute("altMsg", "예약 삭제 완료");
			request.getRequestDispatcher("/views/manager/m_main.jsp").forward(request, response);
			
		}else {  //실패
			
			request.setAttribute("errorMessage", "오류");
		    request.getRequestDispatcher("/views/manager/m_main.jsp").forward(request, response);
			
		}
	
	

	}

}
