package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.notice.model.service.ReviewService;
import com.kh.notice.model.vo.ReAttachment;
import com.kh.notice.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insertReview.shs")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/notice/reviewEnroll.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*2024*2024; //최대 용량
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/reviewUploadFiles/");
			System.out.println(savePath);
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String[] region = multiRequest.getParameterValues("region");
			String content = multiRequest.getParameter("content");
			String writer = multiRequest.getParameter("userId");
			String place = multiRequest.getParameter("place");
			
			String regionStr = "";
			
			if(regionStr!=null) {
				regionStr = String.join(",", region);
			}
			
			Review r = new Review();
			r.setReviewTitle(title);
			r.setRegionName(regionStr);
			r.setReviewContent(content);
			r.setRoomNo(place);
			r.setUserId(writer);
			
			ArrayList<ReAttachment> reList = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String key = "file"+i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					            //원본파일명이 null이 아닐때
					ReAttachment rAt = new ReAttachment();
					
					rAt.setOriginName(multiRequest.getOriginalFileName(key));
					//원본파일명 추출
					rAt.setChangeName(multiRequest.getFilesystemName(key));
					//변경된 파일명 추출
					rAt.setFilePath("/resources/reviewUploadFiles/");
					//저장 경로
					reList.add(rAt);
				}
			}
			
			System.out.println(reList);
			int result = new ReviewService().insertReview(r,reList);
			
			HttpSession session = request.getSession();
			String alertMsg = "";
			
			if(result>0) {
				alertMsg = "리뷰게시글 작성 완료!";
			}else {
				alertMsg = "리뷰게시글 작성 실패입니다. 다시 확인해주시길 바랍니다.";
			}
			
			session.setAttribute("alertMsg", alertMsg);
			response.sendRedirect(request.getContextPath()+"/reviewList.shs?currentPage=1");
		}
	}

}
