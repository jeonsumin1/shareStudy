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
	
}
