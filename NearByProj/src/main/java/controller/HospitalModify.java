package controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

/**
 * Servlet implementation class HospitalModify
 */
@WebServlet("/hospitalmodify")
public class HospitalModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HospitalModify() {
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
		Hospital hospital = (Hospital) session.getAttribute("hospitaluser");
		String comnum = hospital.getComnum();

		HospitalService hospitalService = new HospitalServiceImpl();

		try {
			Hospital hinfo = hospitalService.hospitalInfo(comnum);
			request.setAttribute("hinfo", hinfo);
			request.getRequestDispatcher("hcorrection.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "병원정보수정 실패");
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());
		String comnum = multi.getParameter("comnum");
		String department = multi.getParameter("department");
		String hname = multi.getParameter("hname");
		String htel = multi.getParameter("htel");
		String hroad = multi.getParameter("hroad");
		String hdetail = multi.getParameter("hdetail");
		String hpostcode = multi.getParameter("hpostcode");
		String hdong = multi.getParameter("hdong");
		String clinic = multi.getParameter("clinic");
		String lunch = multi.getParameter("lunch");
		String hurl = multi.getOriginalFileName("hurl");

		BigDecimal lat = new BigDecimal(multi.getParameter("lat"));
		System.out.println(lat);
		BigDecimal lon = new BigDecimal(multi.getParameter("lon"));
		System.out.println(lon);

		System.out.println("lunch" + lunch);

		HttpSession session = request.getSession();
		Hospital h = (Hospital) session.getAttribute("hospitaluser");

		Hospital hospital = new Hospital();
		hospital.setComnum(comnum);
		hospital.setHname(hname);
		hospital.setDepartment(department);
		hospital.setClinic(clinic);
		hospital.setHroad(hroad);
		hospital.setHdetail(hdetail);
		hospital.setHpostcode(hpostcode);
		hospital.setHdong(hdong);
		hospital.setHtel(htel);
		hospital.setLunch(lunch);
		hospital.setHurl(hurl);
		hospital.setLat(lat);
		hospital.setLon(lon);

		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			hospitalService.hospitalModify(hospital);

			response.sendRedirect("hinfo");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "병원 수정 오류");
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}

	}

}
