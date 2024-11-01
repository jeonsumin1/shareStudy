package com.kh.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.catalina.util.ParameterMap;

public class JDBCTemplate {

	public static Connection getConnection() {
		Properties prop= new Properties();
		
		String filePath = JDBCTemplate.class.getResource("/resources/driver/driver.properties").getPath();
		
		Connection conn = null;
		
		try {
			prop.load(new FileInputStream(filePath));
			
			// 드라이버 등록
			Class.forName(prop.getProperty("driver"));
			
			conn = DriverManager.getConnection(prop.getProperty("url"),
											   prop.getProperty("username"),
											   prop.getProperty("password"));

			
					
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return conn;
		
	}
	
	
	//2. 전달받은 Connection 객체를 이용하여 commit 처리 메소드
		public static void commit(Connection conn) {
			
			//conn이 null이 아니고 닫혀있지도 않을 때 반납하기
			try {
				if(conn!=null && !conn.isClosed()) {
					conn.commit();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//3. 전달받은 Connection 객체를 이용하여 rollback 처리 메소드 
		public static void rollback(Connection conn) {
			
			//conn이 null이 아니고 닫혀있지도 않을 때 반납하기
			try {
				if(conn!=null && !conn.isClosed()) {
					conn.rollback();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//4. 전달받은 Connection 객체 반환 메소드 
		public static void close(Connection conn) {
			
			//conn이 null이 아니고 닫혀있지도 않을 때 반납하기
			try {
				if(conn!=null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//5. 전달받은 Statement 객체 반환 메소드 
		public static void close(Statement stmt) {
			
			//stmt이 null이 아니고 닫혀있지도 않을 때 반납하기
			try {
				if(stmt!=null && !stmt.isClosed()) {
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//6. 전달받은 ResultSet 객체 반환 메소드 
		public static void close(ResultSet rset) {
			
			//rset이 null이 아니고 닫혀있지도 않을 때 반납하기
			try {
				if(rset!=null && !rset.isClosed()) {
					rset.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
}
