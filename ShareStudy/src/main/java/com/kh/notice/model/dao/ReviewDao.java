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
import com.kh.common.PageInfo;
import com.kh.notice.model.vo.ReAttachment;
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

	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Review> rList = new ArrayList<>();
		
		String sql = prop.getProperty("selectReviewList");
		
		//현재 페이지에 따라서 보여줘야하는 게시글 번호 계산하기
		//1페이지 : 1~10번까지 보여주기
        //2페이지 : 11~10번
		
		//시작번호 : (현제페이지-1) * 게시글 보여줄 수 + 1
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		
		//끝번호  : 현재페이지 수 * 게시글 보여줄 수 
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			//위치홀더 채워주기(게시글 시작번호 / 끝번호)
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				rList.add(new Review(
									  rset.getInt("REVIEW_NO"),
									  rset.getString("USER_ID"),
									  rset.getString("REVIEW_TITLE"),
									  rset.getDate("REVIEW_DATE"),
									  rset.getInt("REVIEW_COUNT"),
									  rset.getString("REGION_NAME")
						
						
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

	//리뷰게시글 r의 정보들만 insert하는 dao
	public int insertReview(Connection conn, Review r) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getRegionName());
			pstmt.setString(3, r.getReviewContent());
			pstmt.setString(4, r.getUserId());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int listCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int listCount = 0;//조회된 게시글 개수 담을 변수
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int insertAttachmentList(Connection conn, ArrayList<ReAttachment> reList, int reviewNo) {
		
		PreparedStatement pstmt = null;
		int result = 1; //insert문을 여러번 사용하여 하나라도 0이면 0이 될 수 있도록 처리하기
		
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//reList에 추가되어있는 참부파일 전부다 처리 하기
			//향상된 for문 사용하기
			for(ReAttachment re : reList) {
				pstmt.setInt(1, reviewNo);
				pstmt.setString(2, re.getOriginName());
				pstmt.setString(3, re.getChangeName());
				pstmt.setString(4, re.getFilePath());
				pstmt.setInt(5, re.getFileLevel());
				
				//1로 초기화해두었으니 result에 결과값을 곱셈복합대입연산으로 처리하기 
				//하나도 0이면 0값으로 변하니 실패를 확인 가능
				result *= pstmt.executeUpdate();
			}
			
			
			
			
		
			
		} catch (SQLException e) {
			//만약 처음 반복에서 예외가 발생하여 처리되지 않았다면
			//result를 0으로 변경하여 실패 판별 처리
			result = 0; //예외에서 잡아준다.
			
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int selectReviewNo(Connection conn) {
		
		int ReviewNo = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectReviewNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ReviewNo = rset.getInt("RNO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return ReviewNo;
	}

	public int increaseCount(Connection conn, int rno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("increaseCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Review selectReview(Connection conn, int rno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Review r = null;
		
		String sql = prop.getProperty("selectReview");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				r = new Review(rset.getInt("REVIEW_NO"),
							   rset.getString("USER_ID"),
							   rset.getString("REVIEW_TITLE"),
							   rset.getString("REVIEW_CONTENT"),
							   rset.getDate("REVIEW_DATE"),
							   rset.getInt("REVIEW_COUNT"),
							   rset.getString("REGION_NAME"));		
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
	
		return r;
	}

	public ReAttachment selectAttachment(Connection conn, int rno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ReAttachment rt = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				rt = new ReAttachment(rset.getString("FILE_NO"),
									  rset.getString("ORIGIN_NAME"),
									  rset.getString("CHANGE_NAME"),
									  rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
			
		
		
		return rt;
	}

		
	

}
