package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.UserService;

@WebServlet("/findPw.shs")
public class UserFindPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserFindPwController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String findId = request.getParameter("findId"); 
		String findName = request.getParameter("findName");
		String findPhone = request.getParameter("findPhone");
		
		String findPw = new UserService().findPw(findId, findName, findPhone);
		
		HttpSession session = request.getSession();
		
		if(findPw != null) {
			session.setAttribute("alertMsg", "회원님의 비밀번호는 "+findPw+"입니다.<br>비밀번호 변경을 권장합니다.");
		} else {
			session.setAttribute("alertMsg", "입력하신 정보와 일치하는 데이터가 없습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/findPw.jsp");
		view.forward(request, response);
	}

}
