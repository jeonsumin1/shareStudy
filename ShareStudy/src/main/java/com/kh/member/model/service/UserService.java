package com.kh.member.model.service;

import java.sql.Connection;


import com.kh.member.model.dao.UserDao;
import com.kh.member.model.vo.User;
import com.kh.common.JDBCTemplate;

public class UserService {

	public User loginUser(String userId, String userPw) {
		Connection conn = JDBCTemplate.getConnection();
		
		User userInfo = new UserDao().loginUser(conn, userId, userPw);
		
		JDBCTemplate.close(conn);
		
		return userInfo;
	}
	
	public int insertMember(User u) {

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().insertMember(conn,u);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public boolean idCheck(String chId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		boolean flag = new UserDao().idCheck(conn,chId);
		
		JDBCTemplate.close(conn);
		
		return flag;
	}

	public int updateUser(User u) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().updateUser(conn,u);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	
		
		
	}
	
	public int updatePwd(String userId, String userPw,String updatePw) {
		

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().updatePwd(conn,userId,userPw,updatePw);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

	public int deleteUser(String userId,String delPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().deleteUser(conn,userId,delPwd);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	
	}
	
}
