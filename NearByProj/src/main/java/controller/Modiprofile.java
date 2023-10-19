package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Patient;
import service.PatientService;
import service.PatientServiceImpl;

/**
 * Servlet implementation class Modiprofile
 */
@WebServlet("/modiprofile")
public class Modiprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Modiprofile() {
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
		Patient patient = (Patient) session.getAttribute("user");
		String pidnum = patient.getPidnum();

		PatientService patientService = new PatientServiceImpl();
		try {
			Patient myinfo = patientService.myInfo(pidnum);
			request.setAttribute("myinfo", myinfo);
			request.getRequestDispatcher("modiprofile.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pname = request.getParameter("pname");
		String ptel = request.getParameter("ptel");
		String pemail = request.getParameter("pemail");
		String proadaddress = request.getParameter("proadaddress");

		HttpSession session = request.getSession();
		Patient p = (Patient) session.getAttribute("user");
		String pidnum = p.getPidnum();
		
		Patient patient = new Patient(pname, ptel, pemail, proadaddress, pidnum);
		try {
			PatientService patientService = new PatientServiceImpl();
			patientService.modiProfile(patient);
			response.sendRedirect("profile");
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}
