package com.kh.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.User;
import com.kh.room.model.service.RoomService;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/RoomDeleteController")
public class RoomDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDeleteController() {
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
        
        int result = new RoomService().deleteRoom(roomNo);
        
        if(result > 0) {
            request.getSession().setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/room/list.shs");
        } else {
            request.setAttribute("errorMsg", "상품 삭제 실패");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
