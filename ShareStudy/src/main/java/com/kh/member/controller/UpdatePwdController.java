package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.UserService;

/**
 * Servlet implementation class UpdatePwdController
 */
@WebServlet("/updatePwd.shs")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
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
		String userPw = request.getParameter("uPwd");
		String updatePw = request.getParameter("upPwd");
		
		//System.out.println(userId);
		//System.out.println(userPw);
		//System.out.println(updatePw);
		
	
		
		int result = new UserService().updatePwd(userId,userPw,updatePw);
		
		
		if(result>0) {
			HttpSession session = request.getSession();
			
			session.setAttribute("alertMsg", "비밀번호변경 완료되었으니 다시 로그인해주세요!");
			
			session.removeAttribute("userInfo");
			response.sendRedirect(request.getContextPath());
			
			
		}else {
			request.setAttribute("errorMsg", "정보수정 실패했습니다. 다시 입력해주세요.");
		
		}
	}

}
