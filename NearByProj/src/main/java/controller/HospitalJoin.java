package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

/**
 * Servlet implementation class HospitalJoin
 */
@WebServlet("/hjoin")
public class HospitalJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HospitalJoin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("hospitaljoin.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String hname = request.getParameter("hname");
		String hpassword = request.getParameter("hpassword");
		String comnum = request.getParameter("comnum");
		String hemail = request.getParameter("hemail");
		String haddress = request.getParameter("haddress");
		String htel = request.getParameter("htel");
		String department = request.getParameter("department");

		Hospital hospital = new Hospital(hname, hpassword, comnum, hemail, haddress, htel, department);
		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			hospitalService.hospitaljoin(hospital);
			request.getRequestDispatcher("hospitalmain.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response); // 에러 페이지 따로 만들거에요
		}
	}

}
