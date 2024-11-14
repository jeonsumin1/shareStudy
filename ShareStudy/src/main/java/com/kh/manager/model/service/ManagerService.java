package com.kh.manager.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.manager.model.dao.ManagerDao;
import com.kh.manager.model.vo.Manager;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.User;
import com.kh.reservation.model.vo.Room;

public class ManagerService {

	public Manager loginManager(String manId, String manPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Manager m = new ManagerDao().loginManager(conn, manId, manPwd);

        JDBCTemplate.close(conn);
		
		return m;
	}

	public ArrayList<User> selectAllMember() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<User> list = new ManagerDao().selectAllMember(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public ArrayList<Room> selectAllRoom(){
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Room> list = new ManagerDao().selectAllRoom(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

	public ArrayList<Question> selectAllQuestion() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Question> list = new ManagerDao().selectAllQuestion(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int deleteMember(String memId) {
		
        Connection conn = JDBCTemplate.getConnection();
		
		int result = new ManagerDao().deleteMember(conn,memId);
				
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
