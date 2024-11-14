package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.notice.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/reviewDelete.shs")
public class ReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteController() {
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
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		int result = new ReviewService().deleteReview(reviewNo);
		
		System.out.println(result);
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 삭제 완료");
			response.sendRedirect(request.getContextPath()+"/reviewList.shs?currentPage=1");
		}else {
			session.setAttribute("alertMsg", "게시글 삭제 실패! 다시 확인해주세요.");
			response.sendRedirect(request.getContextPath()+"/detailReview.shs?rno="+reviewNo);
		}
		
	}

}
