package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

/**
 * Servlet implementation class HospitalLogin
 */
@WebServlet("/hlogin")
public class HospitalLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("hospitallogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comnum = request.getParameter("comnum");
		String hpassword = request.getParameter("hpassword");

		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			Hospital hospital = hospitalService.login(comnum, hpassword);
			HttpSession session = request.getSession();
			session.setAttribute("hospitaluser", hospital);
			response.sendRedirect("trlist");
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
	}

}
