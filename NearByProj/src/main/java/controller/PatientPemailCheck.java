package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PatientService;
import service.PatientServiceImpl;

/**
 * Servlet implementation class PatientPemailCheck
 */
@WebServlet("/pemailcheck")
public class PatientPemailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientPemailCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pemail = request.getParameter("pemail");

		try {
			PatientService patientService = new PatientServiceImpl();
			response.getWriter().print(patientService.pemailcheck(pemail));
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("error!");

		}
	}

}
