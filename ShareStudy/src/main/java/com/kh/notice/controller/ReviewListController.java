package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.notice.model.service.ReviewService;
import com.kh.notice.model.vo.Review;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/reviewList.shs")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//System.out.println(rList);
		
		
		//페이징 처리 부분
		int listCount; //총 게시글 개수
		int currentPage; //현재 페이지
		int pageLimit; //페이지 하단에 보여질 페이징바 최대 개수
		int boardLimit; //한 페이지에 보여질 게시글 개수
		
		int maxPage; //총 페이지 개수
		int startPage; //페이지 하단에 보여질 페이징바 시작 수 
		int endPage; //페이지 하단에 보여질 페이징바 끝 수 
		
		//총 게시글 개수
		listCount = new ReviewService().listCount();
		//System.out.println(listCount); 확인V
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//System.out.println(currentPage);
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		//listCount와 boardLimit 모두 int 자료형이기 때문에 나누기 계산시 나오는 소수점은 절삭됨(정수형 자료형이기 때문)
		//소수점 표현이 필요하다면 둘중 하나를 double자료형으로 형변환해서 처리해야한다.
		//System.out.println(maxPage); 확인V
		
		/*
		 * currentPage가 1~10 일땐 1
		 * currentPage가 11~20 일땐 11
		 * currentPage가 21~30 일땐 21
		 * 
		 * 0~9 / 10 == 0 *10 == 0+1 == 1
		 * 10~19 / 10 == 1 *10 == 10+1 == 11
		 * 
		 * (currentPage - 1)/pageLimit * pageLimit +1;
		 * */
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		//endPage : 페이징바의 끝 수 
		
		endPage = startPage+pageLimit-1; //시작페이지로부터 몇개를 보여줄지에 따라 처리됨
		
		//ShareStudy는 리뷰가 109개이므로 11개의 페이지만 필요하다.
		/*
		 * 마지막 페이지수는 11번 페이지인데
		 * 페이징 시작수에 따라 끝수를 정해버렸기 때문에 11페이지가 시작하면 끝 페이지가 20이 될수 밖에 없음
		 * 만약 최대페이지 수가 끝페이지 수보다 작다면 끝 페이지 수를 최대페이지 수로 변경해야한다.
		 * endPage값을 maxPage값으로 변경하기
		 * 
		 * 
		 * */
		
		if(maxPage<endPage) {
			endPage = maxPage; 
		}
		
		//페이징바에 필요한 데이터 7개를 담아줄 수 있는 PageInfo vo 만들어주기
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		//System.out.println(pi);
		
		//System.out.println(pi); 확인V
		
		ArrayList<Review> rList = new ReviewService().selectReviewList(pi);
		
		//for(Review r : rList) {
			//System.out.println(r);
		//} 확인V
		
		request.setAttribute("rList", rList);
		request.setAttribute("pi", pi);
		//System.out.println(rList);
		
		request.getRequestDispatcher("/views/notice/reviewList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
