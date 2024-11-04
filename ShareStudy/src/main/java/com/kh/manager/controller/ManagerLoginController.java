package com.kh.manager.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.manager.model.service.ManagerService;
import com.kh.manager.model.vo.Manager;


/**
 * Servlet implementation class ManagerLoginController
 */
@WebServlet("/login.ma")
public class ManagerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerLoginController() {
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
		
		String manId = request.getParameter("mid");
		String manPwd = request.getParameter("mpwd");
		
		
		Manager loginManager = new ManagerService().loginManager(manId,manPwd);
		
		HttpSession session = request.getSession(); 
		String contextPath = request.getContextPath();
		
		if (loginManager != null) {
	        session.setAttribute("loginManager", loginManager);
	        session.setAttribute("alertMsg", manId + "관리자로 접속하셨습니다");
	        
	        response.sendRedirect(contextPath + "/views/manager/m_Frame.jsp");
	    } else {
	        
	    	 response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('로그인 실패!'); window.location.href='" + request.getHeader("Referer") + "';</script>");
	         out.flush();
	    }
	
	}

}
