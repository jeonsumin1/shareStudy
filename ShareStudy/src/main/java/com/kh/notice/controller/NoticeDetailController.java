package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

@WebServlet("/detail.shs")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int result = new NoticeService().increaseCount(noticeNo);
		
		if(result>0) {
			
			Notice n = new NoticeService().noticeDetailView(noticeNo);
			// n에 담겨있는 정보 : 번호, 제목, 내용, 작성일
			// 수정에 필요한 정보가 다 담겨있다... 가서 빼내기만 하자.
		
			request.setAttribute("noticeDetail", n);
			
			request.getRequestDispatcher("/views/notice/noticeDetailView.jsp").forward(request, response);
		} else {
			String alertMsg = "공지글 조회 실패.";
			response.sendRedirect("/views/notice/noticeListView.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
