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
import com.kh.room.model.vo.Room;

@WebServlet("/room/list.shs")
public class ThumbnailListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public ThumbnailListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인할때 session에 저장했으니 저장되어있는걸 가져오기
    	HttpSession session = request.getSession();
    	//user클래스 타입 맞추기위해서 user형변환
    	User user = (User) session.getAttribute("userInfo");
    	//비회원일때를 위해서 user값이 널이 아닐때 만나오게
    	if(user != null) {
    		request.setAttribute("userid", user.getUserId());
    	}
        ArrayList<Room> list = new RoomService().selectThumbnailList();
        
        request.setAttribute("list", list);
        request.getRequestDispatcher("/views/room/thumbnailListView.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
}