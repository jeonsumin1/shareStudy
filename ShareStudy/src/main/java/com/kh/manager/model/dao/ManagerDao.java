package com.kh.manager.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.manager.model.vo.Manager;

public class ManagerDao {
	
	private Properties prop = new Properties();
	
       public ManagerDao() {
		
		String filePath = ManagerDao.class.getResource("/resources/mappers/manager-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Manager loginManager(Connection conn, String manId, String manPwd) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Manager m = null;
		
		String sql = prop.getProperty("loginManager");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, manId);
			pstmt.setString(2, manPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Manager(rset.getString("MANAGER_ID"),
						        rset.getString("MANAGER_PASSWORD"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		
		return m;
	}

}
