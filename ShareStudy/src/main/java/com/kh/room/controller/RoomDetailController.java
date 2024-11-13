package com.kh.room.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.User;
import com.kh.room.model.service.RoomService;
import com.kh.room.model.vo.Attachment;
import com.kh.room.model.vo.Room;

@WebServlet("/detail.room")
public class RoomDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public RoomDetailController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomNo = request.getParameter("rno");
        
        // 상품 상세정보와 첨부파일 리스트 조회
        RoomService rService = new RoomService();
        
        Room room = rService.selectRoom(roomNo);
        // session 객체 얻기
        HttpSession session = request.getSession();
        
    	User user = (User) session.getAttribute("userInfo");
    	if(user != null) {
    		request.setAttribute("userid", user.getUserId());
    	}
        ArrayList<Attachment> atList = rService.selectAttachmentList(roomNo);
        
       
        // room 정보를 session에 저장
        session.setAttribute("room", room);

        //첨부파일 정보는 여기서만 필요하니 request로 저장ㄴ
        request.setAttribute("atList", atList);
        
        request.getRequestDispatcher("/views/room/roomDetailView.jsp").forward(request, response);
    }
    
  
}