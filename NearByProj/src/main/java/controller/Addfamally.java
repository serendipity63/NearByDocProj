package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Family;
import dto.Patient;
import service.FamilyService;
import service.FamilyServiceImpl;
import service.ReservationService;
import service.ReservationServiceImpl;

/**
 * Servlet implementation class Addfamally
 */
@WebServlet("/addfamally")
public class Addfamally extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addfamally() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Patient patient = (Patient)session.getAttribute("user");
		String pidnum = patient.getPidnum();
		
		
		
		FamilyService familyService = new FamilyServiceImpl();
		try {
			List<Map<String, Object>> familys = familyService.famList(pidnum);
			request.setAttribute("familys", familys);
			request.getRequestDispatcher("addfamally.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String fname = request.getParameter("fname");
		String ftel = request.getParameter("ftel");
		String faddress = request.getParameter("faddress");
		String fidnum = request.getParameter("fidnum");
		System.out.println(fname);
		System.out.println(ftel);
		System.out.println(faddress);
		System.out.println(fidnum);
		HttpSession session = request.getSession();
		Patient patient = (Patient)session.getAttribute("user");
		String pidnum = patient.getPidnum();
		
		Family family = new Family(fidnum, fname, ftel, pidnum, faddress);
		FamilyService familyService = new FamilyServiceImpl();
		try {
			familyService.addFam(family);
			request.getRequestDispatcher("addfamally.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
