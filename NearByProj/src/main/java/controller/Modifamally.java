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

/**
 * Servlet implementation class Modifamally
 */
@WebServlet("/modifamally")
public class Modifamally extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modifamally() {
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
			request.getRequestDispatcher("modifamally.jsp").forward(request, response);
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
		
		
		System.out.println("Controller -----------");
		System.out.println("fname : " + fname);
		System.out.println("ftel : " + ftel);
		System.out.println("faddress : " + faddress);
		System.out.println("fidnum : " + fidnum);
		
		
		Family family = new Family(fname, ftel, faddress, fidnum);
		
		FamilyService familyService = new FamilyServiceImpl();
		
		try {
			familyService.famUpdate(family);
			request.getRequestDispatcher("modifamally.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
