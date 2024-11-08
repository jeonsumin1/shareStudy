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
import com.kh.notice.model.vo.Notice;

public class NoticeDao {
			
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String filePath = UserDao.class.getResource("/resources/mappers/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int createNotice(Connection conn, String nTitle, String nContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("createNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nTitle);
			pstmt.setString(2, nContent);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> SelectNotice(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		ArrayList<Notice> n = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				n.add(new Notice(rset.getInt("KEY"),
								 rset.getString("N_TITLE"),
								 rset.getString("N_CONTENT"),
								 rset.getInt("COUNT"),
								 rset.getDate("CREATEDATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return n;
	}

	public int increaseCount(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Notice noticeDetailView(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		String sql = prop.getProperty("noticeDetailView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice(rset.getInt("KEY"),
							   rset.getString("N_TITLE"),
							   rset.getString("N_CONTENT"),
							   rset.getDate("CREATEDATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return n;
	}

	public int updateNotice(Connection conn, String nDetailTitle, String nDetailContent, int nDetailKey) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("UpdateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nDetailTitle);
			pstmt.setString(2, nDetailContent);
			pstmt.setInt(3, nDetailKey);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int UpdateNotice(Connection conn, int nDetailKey, String nUpdateTitle, String nUpdateContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("UpdateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nUpdateTitle);
			pstmt.setString(2, nUpdateContent);
			pstmt.setInt(3, nDetailKey);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	
}
