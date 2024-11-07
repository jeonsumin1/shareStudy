package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.notice.model.dao.ReviewDao;
import com.kh.notice.model.vo.Review;

public class ReviewService {

	public ArrayList<Review> selectReviewList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Review> rList = new ReviewDao().selectReviewList(conn);
		
		JDBCTemplate.close(conn);
		
		return rList;
	
	}

}
