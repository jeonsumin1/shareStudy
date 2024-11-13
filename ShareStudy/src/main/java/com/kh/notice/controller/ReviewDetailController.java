package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.ReviewService;
import com.kh.notice.model.vo.ReAttachment;
import com.kh.notice.model.vo.Review;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/detailReview.shs")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		int result = new ReviewService().increaseCount(rno);
		
		if(result>0) {
			
			Review r = new ReviewService().selectReview(rno);
			
			ReAttachment rt = new ReviewService().selectAttachment(rno);
			
			request.setAttribute("r", r);
			
			request.setAttribute("rt", rt);
			
			request.getRequestDispatcher("views/notice/reviewDetail.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "리뷰 게시글 조회 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/reviewList.shs?currentPage=1");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
	}

}
