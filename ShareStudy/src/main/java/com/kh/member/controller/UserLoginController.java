package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.UserService;
import com.kh.member.model.vo.User;

@WebServlet("/login.shs")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/views/member/loginForm.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");

		User userInfo = new UserService().loginUser(userId, userPw);

		HttpSession session = request.getSession();
		
		if (userInfo != null) {
			session.setAttribute("userInfo", userInfo);
			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			response.sendRedirect(request.getContextPath());
			
		} else {
			session.setAttribute("alertMsg", "로그인 실패. 아이디나 비밀번호를 확인해주세요.");
			response.sendRedirect(request.getContextPath() + "/login.shs");
		}
	}
}