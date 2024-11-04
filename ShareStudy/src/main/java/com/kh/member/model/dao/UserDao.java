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

}
