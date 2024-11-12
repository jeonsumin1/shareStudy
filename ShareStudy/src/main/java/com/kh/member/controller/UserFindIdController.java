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

@WebServlet("/findId.shs")
public class UserFindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserFindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String findName = request.getParameter("findName");
		String findPhone = request.getParameter("findPhone");
		
		String findId = new UserService().findId(findName, findPhone);
		
		HttpSession session = request.getSession();
		
		if(findId != null) {
			session.setAttribute("alertMsg", "회원님의 아이디는 "+findId+"입니다.");
		} else {
			session.setAttribute("alertMsg", "입력하신 정보와 일치하는 아이디가 없습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/findId.jsp");
		view.forward(request, response);
	}

}
