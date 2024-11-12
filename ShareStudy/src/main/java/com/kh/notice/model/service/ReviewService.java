package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.PageInfo;
import com.kh.notice.model.dao.ReviewDao;
import com.kh.notice.model.vo.ReAttachment;
import com.kh.notice.model.vo.Review;

public class ReviewService {

	public ArrayList<Review> selectReviewList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Review> rList = new ReviewDao().selectReviewList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return rList;
	
	}

	public int insertReview(Review r, ArrayList<ReAttachment> reList) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int reviewNo = new ReviewDao().selectReviewNo(conn);
		
		//게시글 정보 등록
		int result = new ReviewDao().insertReview(conn,r);
		
		//첨부파일 등록
		//첨부파일 목록 + 참조 게시글 번호
		r.setReviewNo(reviewNo);
		int result2 = new ReviewDao().insertAttachmentList(conn,reList,reviewNo); 
		
		if(result*result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2;
	}

	public int listCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new ReviewDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public int increaseCount(int rno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().increaseCount(conn,rno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Review selectReview(int rno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Review r = new ReviewDao().selectReview(conn,rno);
		
		JDBCTemplate.close(conn);
		
		return r;
	}

	public ReAttachment selectAttachment(int rno) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ReAttachment rt = new ReviewDao().selectAttachment(conn,rno);
		
		JDBCTemplate.close(conn);
		
		return rt;
	}

}
