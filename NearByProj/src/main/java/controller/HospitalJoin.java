package controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

		// 파일 업로드
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());
		// 파일 업로드 끝

		String hname = multi.getParameter("hname");
		String hpassword = multi.getParameter("hpassword");
		String comnum = multi.getParameter("comnum");
		String htel = multi.getParameter("htel");
		String department = multi.getParameter("department");
		String lunch1 = multi.getParameter("lunch1");
		String lunch2 = multi.getParameter("lunch2");
		String clinic1 = multi.getParameter("clinic1");
		String clinic2 = multi.getParameter("clinic2");
		String lunch = lunch1 + " ~ " + lunch2;
		String clinic = clinic1 + " ~ " + clinic2;
		String hroad = multi.getParameter("hroad");
		String hdong = multi.getParameter("hdong");
		String hdetail = multi.getParameter("hdetail");
		String hpostcode = multi.getParameter("hpostcode");
		String hurl = multi.getOriginalFileName("file");

		System.out.println(hurl);
		request.setAttribute("hurl", hurl);

		BigDecimal hgrade = null;
		Integer hreviewcnt = null;
		BigDecimal lat = new BigDecimal(multi.getParameter("lat"));

		System.out.println(lat);
		BigDecimal lon = new BigDecimal(multi.getParameter("lon"));
		System.out.println(lon);

		Hospital hospital = new Hospital(hname, hpassword, comnum, htel, department, lunch, clinic, hroad, hdong,
				hdetail, hpostcode, hurl, hgrade, hreviewcnt, lat, lon);
		hospital.setHurl(hurl);

		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			hospitalService.hospitaljoin(hospital);
			request.getRequestDispatcher("hospitallogin.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
	}
}