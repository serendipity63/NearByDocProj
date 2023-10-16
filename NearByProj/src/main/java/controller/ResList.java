package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Patient;
import service.ReservationService;
import service.ReservationServiceImpl;

/**
 * Servlet implementation class ResList
 */
@WebServlet("/reslist")
public class ResList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Patient patient = (Patient)session.getAttribute("user");
		String pidnum = patient.getPidnum();
		
		ReservationService resService = new ReservationServiceImpl();
		try {
			List<Map<String, Object>> reservations = resService.showReservation(pidnum);
			System.out.println(reservations);
			request.setAttribute("reservations", reservations);
			request.getRequestDispatcher("reslist.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
}
