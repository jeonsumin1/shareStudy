package com.kh.user.model.service;

import java.sql.Connection;

import com.kh.user.model.dao.UserDao;
import com.kh.user.model.vo.User;
import com.kh.common.JDBCTemplate;

public class UserService {

	public User loginUser(String userId, String userPw) {
		Connection conn = JDBCTemplate.getConnection();
		
		User userInfo = new UserDao().loginUser(userId, userPw, conn);
		
		JDBCTemplate.close(conn);
		
		return userInfo;
	}
	
}
