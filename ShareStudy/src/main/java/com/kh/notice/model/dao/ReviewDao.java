package com.kh.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.UserDao;
import com.kh.notice.model.vo.Review;

	public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String filePath = ReviewDao.class.getResource("/resources/mappers/review-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Review> selectReviewList(Connection conn) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Review> rList = new ArrayList<>();
		
		String sql = prop.getProperty("selectReview");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				rList.add(new Review(
									  rset.getInt("REVIEW_NO"),
									  rset.getString("REGION_NAME"),
									  rset.getString("ROOM_NAME"),
									  rset.getString("REVIEW_TITLE"),
									  rset.getString("USER_ID"),
									  rset.getInt("REVIEW_COUNT"),
									  rset.getDate("REVIEW_DATE")
						
						
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
	
		return rList;
	}

}
