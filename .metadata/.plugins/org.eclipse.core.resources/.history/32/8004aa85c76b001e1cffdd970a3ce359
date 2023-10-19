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
 * Servlet implementation class Map
 */
@WebServlet("/map")
public class Map extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Map() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comnum = request.getParameter("comnum");
		HospitalService hospitalservice = new HospitalServiceImpl();
		try {
			Hospital hospital = hospitalservice.selectHospitalBycomnum(comnum);
			request.setAttribute("hospital", hospital);
			request.getRequestDispatcher("map.jsp").forward(request, response);
		
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
		
	}

}
