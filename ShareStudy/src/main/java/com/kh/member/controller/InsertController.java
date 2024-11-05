package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.UserService;
import com.kh.member.model.vo.User;

/**
 * Servlet implementation class InsertController
 */
@WebServlet("/insert.me")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
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
		
        
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userRrn = request.getParameter("userRrn");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String[] agree = request.getParameterValues("agree");
		
		//System.out.println(userId);
		//System.out.println(userPwd);
		//System.out.println(userName);
		//System.out.println(userRrn);
		//System.out.println(phone);
		//System.out.println(email);
		//System.out.println(String.join(",", agree));
		
		String agreeStr = "";
		
		if(agreeStr!=null) {
			agreeStr = String.join(",", agree);
		}
		
		User u = new User();
		u.setUserId(userId);
		u.setUserPw(userPwd);
		u.setUserName(userName);
		u.setRrn(userRrn);
		u.setUserPhone(phone);
		u.setEmail(email);
		u.setAdAccept(agreeStr);
		
		int result = new UserService().insertMember(u);
		
		
		
		if(result>0) {
			request.setAttribute("u", u);
			
			request.getRequestDispatcher("/views/member/enrollCheck.jsp").forward(request, response);
			
		}else {
			request.setAttribute("errorMsg", "잘못된 정보를 입력하셨습니다. 다시 입력해주시길 바랍니다.");
			
		}
		
		
		
		
		
		
	}

}
