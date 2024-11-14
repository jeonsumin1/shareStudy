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

		//이전 URL 정보 
		String reUrl = (String) request.getSession().getAttribute("reUrl");
		
		HttpSession session = request.getSession();
		
		if (userInfo != null) {
			
			// 로그인 성공 시 이전 페이지로 이동 reUrl 값이 있을 경우에만 해당 경로로 이동. 아닐 경우 홈페이지로 이동. 
			if(reUrl != null) {
				response.sendRedirect(reUrl);
			}else {
				// 이전 경로가 없을 경우 메인페이지로 이동
				response.sendRedirect(request.getContextPath());
			}
			
			session.setAttribute("userInfo", userInfo);
			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			
			// 세션에서 
			session.removeAttribute("reUrl"); // session에서 해당 값을 지워주지 않으면 일반 로그인 시 reUrl이 session에 남아 있어 상품 예약 페이지로 이동이 된다. 
			
		}else {
			session.setAttribute("alertMsg", "로그인 실패. 아이디나 비밀번호를 확인해주세요.");
			response.sendRedirect(request.getContextPath() + "/login.shs");
		}
	}
}