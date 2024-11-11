package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.User;
import com.kh.notice.model.service.NoticeService;


@WebServlet("/createNotice.shs")
public class NoticeCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NoticeCreateController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userInfo");
		
		if (userInfo == null || !userInfo.getUserName().equals("관리자")) {
	        session.setAttribute("alertMsg", "접근 권한이 없습니다.");
	        response.sendRedirect(request.getContextPath()+"/");
	        return;
	    } else {
	    	request.getRequestDispatcher("/views/notice/createNotice.jsp").forward(request, response);
	    }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userInfo");
		
		if (userInfo == null || !userInfo.getUserName().equals("관리자")) {
	        session.setAttribute("alertMsg", "접근 권한이 없습니다.");
	        response.sendRedirect(request.getContextPath() + "/");
	        return;
	    }
		
		request.setCharacterEncoding("UTF-8");
		
		String nTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		
		int result = new NoticeService().createNotice(nTitle,nContent);
		
		
		
		session.setAttribute("nTitle", nTitle);
		session.setAttribute("nContent", nContent);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지가 등록되었습니다.");
		}else {
			session.setAttribute("alertMsg", "공지 등록에 실패하였습니다.");
		}
//		request.getRequestDispatcher("/noticeBoard.shs").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/noticeBoard.shs");
	}
	
}