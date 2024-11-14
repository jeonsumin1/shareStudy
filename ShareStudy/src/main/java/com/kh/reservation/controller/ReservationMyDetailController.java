package com.kh.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.ReservationSelect;

/**
 * Servlet implementation class ReservationMyDetailController
 */
@WebServlet("/reMyDetail.shs")
public class ReservationMyDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationMyDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 예약 내역에서 상세 보기로 갈 경우 예약 내역 정보 select 메소드 (예약 완료 후 정보는 insertController에서 정보를 바로 전달한다.)
				// ReservationDetailController를 같이 사용할 경우 예약 후에도 아래 메소드가 실행되어 값이 제대로 안가져와진다. -> 각 서블렛 따로 만들어 주거나 조건처리 
		String rvNo = request.getParameter("rvNo");
		ReservationSelect reSuccessInfo = new ReservationService().selReSuccessInfo(rvNo);
		request.setAttribute("reSuccessInfo", reSuccessInfo);
		System.out.println(reSuccessInfo);
		
		request.getRequestDispatcher("/views/reservation/reDetail.jsp").forward(request, response);
	}

}
