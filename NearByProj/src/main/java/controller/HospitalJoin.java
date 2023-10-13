package controller;

import java.io.IOException;
import java.math.BigDecimal;

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
		String htel = request.getParameter("htel");
		String department = request.getParameter("department");
		String lunch = request.getParameter("lunch");
		String clinic = request.getParameter("clinic");
		String hroad = request.getParameter("hroad");
		String hdong = request.getParameter("hdong");
		String hdetail = request.getParameter("hdetail");
		String hpostcode = request.getParameter("hpostcode");
		String hurl = request.getParameter("hurl");
		BigDecimal hgrade = null;		
		Integer hreviewcnt = null;
		BigDecimal lat = null;
		BigDecimal lon = null;
		
		Hospital hospital = new Hospital(hname, hpassword, comnum, htel, department, lunch, clinic, hroad, hdong,
				hdetail, hpostcode, hurl,hgrade,hreviewcnt,lat,lon);
		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			hospitalService.hospitaljoin(hospital);
			request.getRequestDispatcher("hospitallogin.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("herror.jsp").forward(request, response); 
			// 에러 페이지 따로 만들거에요
		}
	}

}