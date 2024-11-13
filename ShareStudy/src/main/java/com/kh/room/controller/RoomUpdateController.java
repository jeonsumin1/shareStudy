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
import com.kh.room.model.vo.Region;
import com.kh.room.model.vo.Room;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet(name = "RoomUpdateController", urlPatterns = { "/RoomUpdateController" })
public class RoomUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 권한 체크
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userInfo");
        
        if(user == null || !"admin".equals(user.getUserId())) {
            request.getSession().setAttribute("alertMsg", "관리자만 접근 가능합니다.");
            response.sendRedirect(request.getContextPath());
            return;
        }
        
        String roomNo = request.getParameter("rno");
        
        // 수정할 상품 정보 조회
        Room room = new RoomService().selectRoom(roomNo);
        ArrayList<Attachment> atList = new RoomService().selectAttachmentList(roomNo);
        ArrayList<Region> regionList = new RoomService().selectRegionList();
        
        request.setAttribute("room", room);
        request.setAttribute("atList", atList);
        request.setAttribute("regionList", regionList);
        
        request.getRequestDispatcher("/views/room/roomUpdateForm.jsp").forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
