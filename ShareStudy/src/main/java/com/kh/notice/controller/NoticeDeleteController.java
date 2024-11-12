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

@WebServlet("/noticeDelete.shs")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userInfo");
		if (userInfo == null || !userInfo.getUserName().equals("관리자")) {
	        session.setAttribute("alertMsg", "접근 권한이 없습니다.");
	        response.sendRedirect(request.getContextPath());
	        return;
	    }
		
		String noticeNoStr = request.getParameter("noticeNo");
		
		int noticeNo = Integer.parseInt(noticeNoStr);
		
		int result = new NoticeService().deleteNotice(noticeNo);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/noticeBoard.shs");
		}else {
			response.sendRedirect(request.getContextPath() + "/detail.shs?noticeNo=" + noticeNo);
		}
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지사항이 삭제되었습니다.");
		}else {
			session.setAttribute("alertMsg", "공지 삭제에 실패하였습니다.");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userInfo");
		
		if (userInfo == null || !userInfo.getUserName().equals("관리자")) {
	        session.setAttribute("alertMsg", "접근 권한이 없습니다.");
	        response.sendRedirect(request.getContextPath());
	        return;
	    }
	}

}
