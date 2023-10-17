package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PatientService;
import service.PatientServiceImpl;

/**
 * Servlet implementation class PatientPidnumCheck
 */
@WebServlet("/pidnumcheck")
public class PatientPidnumCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientPidnumCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pidnum=request.getParameter("pidnum");
		
		try {
			PatientService patientService= new PatientServiceImpl();
			response.getWriter().print(patientService.pidnumcheck(pidnum));
		}catch(Exception e) {
			e.printStackTrace();
			response.getWriter().print("error");
			
		}
		
	}

}
