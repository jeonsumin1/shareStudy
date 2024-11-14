package com.kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.model.service.ManagerService;

/**
 * Servlet implementation class ManagerDeleteQuestion
 */
@WebServlet("/qdelete.ma")
public class ManagerDeleteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerDeleteQuestion() {
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
        String memId = request.getParameter("userId");
        
        int result = new ManagerService().deleteQuestion(memId);
        
        if(result>0) { //삭제 성공
			request.setAttribute("altMsg", memId+"상담 완료");
			request.getRequestDispatcher("/views/manager/m_main.jsp").forward(request, response);
//			response.sendRedirect(request.getContextPath()+"/views/manager/m_main.jsp");
			
		}else {  //실패
			
			request.setAttribute("errorMessage", "오류");
		    request.getRequestDispatcher("/views/manager/m_main.jsp").forward(request, response);
			
		}
	
	}

}
