package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Hospital;
import dto.Patient;
import dto.Reservation;
import service.PatientService;
import service.PatientServiceImpl;
import service.ReservationService;
import service.ReservationServiceImpl;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/insertreservation")
public class InsertReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertReservation() {
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
		HttpSession session = request.getSession();
		String date = null;
		if (session.getAttribute("date") != null)
			date = (String) session.getAttribute("date");
		Hospital hospital = (Hospital) session.getAttribute("hospital");
		Patient patient = (Patient) session.getAttribute("user");
		PatientService patientservice = new PatientServiceImpl();
		ReservationService reservationservice = new ReservationServiceImpl();
		try {
			List<Patient> patientlist = new ArrayList<>();
			patientlist = patientservice.patientListBypidnum(patient.getPidnum());
			List<String> timelist = new ArrayList<>();
			timelist = reservationservice.timelist(hospital, date);
			request.setAttribute("timelist", timelist);
			request.setAttribute("patientlist", patientlist);
			request.getRequestDispatcher("reservation.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Hospital hospital = (Hospital) session.getAttribute("hospital");
		String pname = request.getParameter("name");
		PatientService patientservice = new PatientServiceImpl();
		String comnum = hospital.getComnum();
		String resdate = request.getParameter("resdate");
		String restime = request.getParameter("restime");
		String comment = request.getParameter("comment");
		String status = "1";
		String doccomment = null;
		Integer id = null;

		try {
			String pidnum = patientservice.selectPatientByname(pname).getPidnum();
			Reservation reservation = new Reservation(pidnum, comnum, resdate, restime, comment, status, doccomment,
					id);
			session.setAttribute("name", pname);
			session.setAttribute("reservation", reservation);
			response.sendRedirect("completereservation");

		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
	}

}
