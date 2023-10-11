package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HospitalService;
import service.HospitalServiceImpl;

/**
 * Servlet implementation class HospitalComnumCheck
 */
@WebServlet("/comnumcheck")
public class HospitalComnumCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalComnumCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comnum= request.getParameter("comnum");
		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			response.getWriter().print(hospitalService.comnumcheck(comnum));
		}catch(Exception e) {
			e.printStackTrace();
			response.getWriter().print("error");
		}
	}

}
