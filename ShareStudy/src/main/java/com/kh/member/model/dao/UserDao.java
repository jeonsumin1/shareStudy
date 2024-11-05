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
		pstmt.setString(1, u.getUserName());
		pstmt.setString(2, u.getRrn());
		pstmt.setString(3, u.getUserPw());
		pstmt.setString(4, u.getUserPhone());
		pstmt.setString(5, u.getEmail());
		pstmt.setString(6, u.getAdAccept());
		pstmt.setString(7, u.getUserId());
		
		result = pstmt.executeUpdate();

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		JDBCTemplate.close(pstmt);
	}

	return result;
}

}
