package com.kh.room.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.User;
import com.kh.room.model.service.RoomService;
import com.kh.room.model.vo.Attachment;
import com.kh.room.model.vo.Room;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/roomUpdate.shs")
public class RoomUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 관리자 권한 체크
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userInfo");
        
        if(user == null || !"admin".equals(user.getUserId())) {
            session.setAttribute("alertMsg", "관리자만 접근 가능합니다.");
            response.sendRedirect(request.getContextPath());
            return;
        }
        
        String savePath = request.getSession().getServletContext().getRealPath("/resources/room_images/");
        
        int maxSize = 10 * 1024 * 1024;
        
        MultipartRequest multiRequest = null;
        try {
            multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
        } catch (Exception e) {
            //e.printStackTrace();
        	request.setAttribute("errorMsg", "파일 업로드 실패: " + e.getMessage());
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
            return;
        }
        
        Room room = new Room();
        room.setRoomNo(multiRequest.getParameter("roomNo"));
        room.setRegionNo(multiRequest.getParameter("regionNo"));
        room.setRoomName(multiRequest.getParameter("roomName"));
        room.setRoomAddress(multiRequest.getParameter("roomAddress"));
        room.setRoomSize(multiRequest.getParameter("roomSize"));
        room.setPrice(multiRequest.getParameter("price"));
        room.setUseNight(multiRequest.getParameter("useNight"));
        room.setParking(multiRequest.getParameter("parking"));
        room.setEating(multiRequest.getParameter("eating"));
        
        //  기존 파일 정보 수집
        ArrayList<String> originFileNos = new ArrayList<>();
        ArrayList<String> originFileNames = new ArrayList<>();
        
        for(int i = 1; i <= 4; i++) {
            String fileNo = multiRequest.getParameter("originalFileNo" + i);
            String fileName = multiRequest.getParameter("originalFileName" + i);
            
            if(fileNo != null && fileName != null) {
                originFileNos.add(fileNo);
                originFileNames.add(fileName);
            }
        }
        
        //  새로운 첨부파일 정보 수집
        ArrayList<Attachment> newAtList = new ArrayList<>();
        
        for(int i = 1; i <= 4; i++) {
            String key = "file" + i;
            
            if(multiRequest.getOriginalFileName(key) != null) {
                Attachment at = new Attachment();
                at.setRoomNo(room.getRoomNo());
                at.setOriginName(multiRequest.getOriginalFileName(key));
                at.setChangeName(multiRequest.getFilesystemName(key));
                at.setFilePath("/resources/room_images/");
                at.setFileLevel(i);
                
                // 기존 파일이 있었다면 교체
                if(i <= originFileNos.size()) {
                    at.setFileNo(originFileNos.get(i-1));
                    
                    // 기존 파일 삭제
                    new File(savePath + originFileNames.get(i-1)).delete();
                }
                
                newAtList.add(at);
            }
        }
        
        int result = new RoomService().updateRoom(room, newAtList);
        
        if(result > 0) {
            session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
            response.sendRedirect(request.getContextPath() + "/detail.room?rno=" + room.getRoomNo());
        } else {
            // 실패시 업로드된 파일 삭제
            for(Attachment at : newAtList) {
                new File(savePath + at.getChangeName()).delete();
            }
            request.setAttribute("errorMsg", "스터디룸 수정에 실패했습니다.");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        }
    }
}