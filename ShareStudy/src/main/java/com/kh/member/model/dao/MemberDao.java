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

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/resources/mappers/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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

	

}
