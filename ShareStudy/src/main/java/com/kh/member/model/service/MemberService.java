package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.User;

public class MemberService {

	public int insertMember(User u) {

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,u);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	

}
