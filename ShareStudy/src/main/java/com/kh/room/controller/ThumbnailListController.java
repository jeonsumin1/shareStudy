package com.kh.room.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.room.model.service.RoomService;
import com.kh.room.model.vo.Room;

@WebServlet("/room/list.shs")
public class ThumbnailListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public ThumbnailListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Room> list = new RoomService().selectThumbnailList();
        request.setAttribute("list", list);
        request.getRequestDispatcher("/views/room/thumbnailListView.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}