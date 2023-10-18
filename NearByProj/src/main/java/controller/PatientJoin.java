package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Patient;
import service.PatientService;
import service.PatientServiceImpl;

/**
 * Servlet implementation class PatientJoin
 */
@WebServlet("/pjoin")
public class PatientJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientJoin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("patientjoin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String pemail = request.getParameter("pemail");
		String ppassword = request.getParameter("ppassword");
		String pname = request.getParameter("pname");
		String ptel = request.getParameter("ptel");
		String pidnum = request.getParameter("pidnum");
		String proadaddress = request.getParameter("proadaddress");
		String ppostcode = request.getParameter("ppostcode");
		String pdetailaddress = request.getParameter("pdetailaddress");
		Boolean quit = false;
		String ppidnum = null;

		Patient patient = new Patient(pemail, ppassword, pname, ptel, pidnum, proadaddress, ppostcode, pdetailaddress, quit, ppidnum);

		try {
			PatientService patientService = new PatientServiceImpl();
			patientService.patientjoin(patient);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response); // 에러 페이지 따로 만들거에요
		}
	}

}