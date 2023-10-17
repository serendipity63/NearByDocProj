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
 * Servlet implementation class PatientDelete
 */
@WebServlet("/patientdelete")
public class PatientDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pname= request.getParameter("pname");
		Integer page=Integer.parseInt(request.getParameter("page"));
		try {
			PatientService patientService=new PatientServiceImpl();
			patientService.patientRemove(pname);
			response.sendRedirect("patientlist?page="+page);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "환자 삭제 오류");
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
	}


}
