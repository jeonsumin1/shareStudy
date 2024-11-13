package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.User;

public class UserDao {
	
	private Properties prop = new Properties();
	
	public UserDao() {
		String filePath = UserDao.class.getResource("/resources/mappers/user-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public User loginUser(Connection conn, String userId, String userPw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser");
		User userInfo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				userInfo = new User(rset.getString("USER_ID"),
									rset.getString("USER_PW"),
									rset.getString("USER_NAME"),
									rset.getString("USER_PHONE"),
									rset.getString("RRN"),
									rset.getString("EMAIL"),
									rset.getString("ADACCEPT"),
									rset.getDate("ENROLLDATE"),
									rset.getString("STATUS"),
									rset.getString("ZIP_CODE"),
									rset.getString("ADDRESS"),
									rset.getString("DETAIL_ADDRESS"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return userInfo;
	}
	
	public int insertMember(Connection conn, User u) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPw());
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, u.getRrn());
			pstmt.setString(5, u.getUserPhone());
			pstmt.setString(6, u.getEmail());
			pstmt.setString(7, u.getAdAccept());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public boolean idCheck(Connection conn, String chId) {
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	boolean flag = false;
	
	String sql = prop.getProperty("idCheck");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, chId);
		
		rset = pstmt.executeQuery();
		
		flag = rset.next();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
	}
	
	
	
	
	return flag;
}

	public int updateUser(Connection conn, User u) {

	PreparedStatement pstmt = null;
	int result = 0;
	
	String sql = prop.getProperty("updateUser");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, u.getUserPhone());
		pstmt.setString(2, u.getEmail());
		pstmt.setString(3, u.getAdAccept());
		pstmt.setString(4, u.getUserId());
		
		
		
		result = pstmt.executeUpdate();

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		JDBCTemplate.close(pstmt);
	}

	return result;
}

	public int updatePwd(Connection conn, String userId,String userPw,String updatePw) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePw);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPw);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int deleteUser(Connection conn, String userId,String delPwd) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteUser");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, delPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public String findId(Connection conn, String findName, String findPhone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findId = null;
		String sql = prop.getProperty("FindId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, findName);
			pstmt.setString(2, findPhone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				findId = rset.getString("USER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return findId;
	}

	public String findPw(Connection conn, String findId, String findName, String findPhone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findPw = null;
		String sql = prop.getProperty("FindPw");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, findId);
			pstmt.setString(2, findName);
			pstmt.setString(3, findPhone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				findPw = rset.getString("USER_PW");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return findPw;
	}

	// 상담 신청
	public int insertQuestion(Connection conn, String userId, String qTime, String qContent) {

		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "userId");
			pstmt.setString(2, "qTime");
			pstmt.setString(3, "qContent");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
