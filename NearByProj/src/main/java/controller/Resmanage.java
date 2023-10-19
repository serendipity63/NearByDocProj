package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Patient;
import dto.Reservation;
import service.ReservationService;
import service.ReservationServiceImpl;

/**
 * Servlet implementation class Resmanage
 */
@WebServlet("/resmanage")
public class Resmanage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Resmanage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
//		HttpSession session = request.getSession();
//		Patient patient = (Patient)session.getAttribute("user");
//		String pidnum = patient.getPidnum();
		
		ReservationService resService = new ReservationServiceImpl();
		try {

			
			System.out.println("Controller---------------");
			System.out.println(id);
			
			Map<String,Object> res = resService.detailRes(id);
			request.setAttribute("res", res);
			request.getRequestDispatcher("resmanage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");
		
		Reservation reservation = new Reservation(id, status);
		ReservationService reservationService = new ReservationServiceImpl();
		
		try {
			reservationService.resUpdate(reservation);
			request.getRequestDispatcher("reslist.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
