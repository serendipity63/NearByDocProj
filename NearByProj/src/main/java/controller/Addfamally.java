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

import dto.Patient;
import service.PatientService;
import service.PatientServiceImpl;

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
		
		
		
		PatientService patientService = new PatientServiceImpl();
		try {
			List<Map<String, Object>> familys = patientService.famList(pidnum);
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
		String pname = request.getParameter("pname");
		String ptel = request.getParameter("ptel");
		String proadaddress = request.getParameter("proadaddress");
		String pidnum = request.getParameter("pidnum");
		
		HttpSession session = request.getSession();
		Patient p = (Patient)session.getAttribute("user");
		String ppidnum = p.getPidnum();
		
		Patient patient = new Patient(pidnum, pname, ptel, proadaddress, ppidnum);
		PatientService patientService = new PatientServiceImpl();
		try {
			//familyService.addFam(family, pidnum);
			response.getWriter().print(patientService.addFam(patient, pidnum));
			//request.getRequestDispatcher("addfamally.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("error!");
		}
		
	}

}
