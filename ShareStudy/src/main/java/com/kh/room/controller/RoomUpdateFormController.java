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

@WebServlet("/updateForm.shs")
public class RoomUpdateFormController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 관리자 권한 체크
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userInfo");
        
        if(user == null || !"admin".equals(user.getUserId())) {
            session.setAttribute("alertMsg", "관리자만 접근 가능합니다.");
            response.sendRedirect(request.getContextPath());
            return;
        }
        
        String roomNo = request.getParameter("rno");
        
        // 수정할 상품 정보 조회
        RoomService rService = new RoomService();
        Room room = rService.selectRoom(roomNo);
        ArrayList<Attachment> atList = rService.selectAttachmentList(roomNo);
        ArrayList<Region> regionList = rService.selectRegionList();
        
        request.setAttribute("room", room);
        request.setAttribute("atList", atList);
        request.setAttribute("regionList", regionList);
        
        request.getRequestDispatcher("/views/room/roomUpdateForm.jsp").forward(request, response);
    }
}