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

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/noticeUpdate.shs")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userInfo");
		if (userInfo == null || !userInfo.getUserName().equals("관리자")) {
	        session.setAttribute("alertMsg", "접근 권한이 없습니다.");
	        response.sendRedirect(request.getContextPath());
	        return;
	    }
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String nTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		
		request.getRequestDispatcher("views/notice/noticeUpdateView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userInfo");
		if (userInfo == null || !userInfo.getUserName().equals("관리자")) {
	        session.setAttribute("alertMsg", "접근 권한이 없습니다.");
	        response.sendRedirect(request.getContextPath());
	        return;
	    }
		
		request.setCharacterEncoding("UTF-8");
		String nDetailKeyStr = request.getParameter("nDetailKey");
		
		int nDetailKey = 0;
		String nUpdateTitle = request.getParameter("nUpdateTitle");
		String nUpdateContent = request.getParameter("nUpdateContent");
		
		if (nDetailKeyStr != null && !nDetailKeyStr.isEmpty()) {
		    try {
		        nDetailKey = Integer.parseInt(nDetailKeyStr);
		    } catch (NumberFormatException e) {
		        e.printStackTrace();
		    }
		} else {
		    System.out.println("nDetailKey가 null이거나 비어 있습니다.");
		}
		
		int result = new NoticeService().UpdateNotice(nDetailKey, nUpdateTitle, nUpdateContent);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath() + "/detail.shs?noticeNo=" + nDetailKey);
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}

}
