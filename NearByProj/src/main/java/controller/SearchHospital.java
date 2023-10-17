package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

/**
 * Servlet implementation class SearchHospital
 */
@WebServlet("/searchhospital")
public class SearchHospital extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchHospital() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String address = request.getParameter("address-input");
		String department = request.getParameter("department-input");
		String lat = request.getParameter("latitude");
		String lon = request.getParameter("longitude");

		/*
		 * System.out.println(address); System.out.println(department);
		 * System.out.println(lat); System.out.println(lon);
		 */

		HospitalService hospitalservice = new HospitalServiceImpl();
		try {
			List<Hospital> hoslist = hospitalservice.hospitalList(department,lat,lon);
			request.setAttribute("address", address);
			request.setAttribute("department", department);
			request.setAttribute("hoslist", hoslist);
			request.getRequestDispatcher("searchhospital.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
	}

}
