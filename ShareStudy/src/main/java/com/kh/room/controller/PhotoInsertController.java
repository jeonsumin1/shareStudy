package com.kh.room.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.room.model.service.RoomService;
import com.kh.room.model.vo.Attachment;
import com.kh.room.model.vo.Room;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PhotoInsertController
 */
@WebServlet("/productInsert.shs")
public class PhotoInsertController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public PhotoInsertController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/room/photoEnrollForm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        if(ServletFileUpload.isMultipartContent(request)) {
            int maxSize = 10*1024*1024;
            String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
            
            MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
            
            // Room 객체 생성 및 데이터 설정
            Room r = new Room();
            r.setRoomNo(multiRequest.getParameter("roomNo"));
            r.setRegionNo(multiRequest.getParameter("regionNo"));
            r.setRoomSize(multiRequest.getParameter("roomSize"));
            r.setRoomName(multiRequest.getParameter("roomName"));
            r.setRoomAddress(multiRequest.getParameter("roomAddress"));
            r.setPrice(multiRequest.getParameter("price"));
            r.setUseNight(multiRequest.getParameter("useNight"));
            r.setParking(multiRequest.getParameter("parking"));
            r.setEating(multiRequest.getParameter("eating"));
            
            // Attachment 리스트 생성
            ArrayList<Attachment> atList = new ArrayList<>();
            
            for(int i=1; i<=4; i++) {
                String key = "file"+i;
                if(multiRequest.getOriginalFileName(key) != null) {
                    Attachment at = new Attachment();
                    at.setRoomNo(multiRequest.getParameter("roomNo")); // Room 번호 설정
                    at.setOriginName(multiRequest.getOriginalFileName(key));
                    at.setChangeName(multiRequest.getFilesystemName(key));
                    at.setFilePath("/resources/uploadFiles/");
                    at.setFileLevel(i == 1 ? 1 : 2);
                    
                    atList.add(at);
                }
            }
            
            // 서비스 호출하여 데이터 저장
            int result = new RoomService().insertPhoto(r, atList);
            
            HttpSession session = request.getSession();
            String alertMsg = "";
            
            if(result > 0) {
                alertMsg = "상품 등록 완료!";
                response.sendRedirect(request.getContextPath() + "/roomList.shs"); // 목록 페이지로 이동
            } else {
                alertMsg = "상품 등록 실패!";
                response.sendRedirect(request.getContextPath() + "/productInsert.shs"); // 등록 페이지로 다시 이동
            }
            
            session.setAttribute("alertMsg", alertMsg);
        }
    }
}