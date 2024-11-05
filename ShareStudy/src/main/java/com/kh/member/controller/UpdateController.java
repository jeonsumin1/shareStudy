package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.UserService;
import com.kh.member.model.vo.User;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/update.shs")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateController() {
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
		//아이디 이름 주민등록번호 비밀번호 전화번호 이메일 동의변경
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String rrn = request.getParameter("rrn");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		String[] agree = request.getParameterValues("agree");
		
		String agreeStr = "";
		
		if(agree != null) {
			agreeStr = String.join("," , agree);
		};
		
		User u = new User();
		u.setUserId(userId);
		u.setUserName(userName);
		u.setRrn(rrn);
		u.setUserPw(userPwd);
		u.setUserPhone(phone);
		u.setAdAccept(agreeStr);
		
		int result = new UserService().updateUser(u);
		
		if(result>0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "정보가 수정되었습니다.");
			
			String userPw = ((User)session.getAttribute("userInfo")).getUserPw();
			User updateUser = new UserService().loginUser(userId, userPw);
			
			session.setAttribute("loginUser", updateUser);
			
			response.sendRedirect(request.getContextPath()+"mypage.shs");
			
		}else {
			request.setAttribute("errorMsg", "정보수정이 실패되었습니다. 확인해주세요");
			
		}
		
		
		
	}

}
