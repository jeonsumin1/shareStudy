package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {

	public int createNotice(String nTitle, String nContent) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().createNotice(conn, nTitle, nContent);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<Notice> SelectNotice() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Notice> n = new NoticeDao().SelectNotice(conn);
		
		JDBCTemplate.close(conn);
		
		return n;
	}

	public int increaseCount(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
			JDBCTemplate.close(conn);
			return result;
	}

	public Notice noticeDetailView(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Notice n = new NoticeDao().noticeDetailView(conn, noticeNo);
		
		JDBCTemplate.close(conn);
		
		return n;
	}

	public int updateNotice(String nDetailTitle, String nDetailContent, int nDetailKey) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().updateNotice(conn, nDetailTitle, nDetailContent, nDetailKey); 
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}	JDBCTemplate.close(conn);
		
		return result;
	}

	public int UpdateNotice(int nDetailKey, String nUpdateTitle, String nUpdateContent) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().UpdateNotice(conn, nDetailKey, nUpdateTitle, nUpdateContent);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}	JDBCTemplate.close(conn);
		
		return result;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}	JDBCTemplate.close(conn);
		
		return result;
	}

	
}
