package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Hospital;
import dto.Patient;
import dto.Reservation;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.ReservationService;
import service.ReservationServiceImpl;
import service.ReviewService;
import service.ReviewServiceImpl;

/**
 * Servlet implementation class HospitalInfo
 */
@WebServlet("/hospitalinfo")
public class HospitalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HospitalInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comnum = request.getParameter("comnum");
		HospitalService hospitalservice = new HospitalServiceImpl();
		ReviewService reviewservice = new ReviewServiceImpl();
		ReservationService reservationservice = new ReservationServiceImpl();
		try {
			Hospital hospital = hospitalservice.selectHospitalBycomnum(comnum);
			HttpSession session = request.getSession();
			session.setAttribute("hospital", hospital);
			session.removeAttribute("date");
			List<String> resListByUser = new ArrayList<String>();
			Patient patient = (Patient) session.getAttribute("user");
			if (patient != null) {
				String pidnum = patient.getPidnum();
				resListByUser = reservationservice.resListByPidnum(pidnum, comnum);
				request.setAttribute("resListByUser", resListByUser);
			}
			Map<String, Object> lastreview = reviewservice.selectLastReview(comnum);
			request.setAttribute("lastreview", lastreview);
			request.getRequestDispatcher("hospitalinfo.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
	}

}
