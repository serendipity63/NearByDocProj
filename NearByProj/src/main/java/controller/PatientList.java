package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.PatientService;
import service.PatientServiceImpl;

/**
 * Servlet implementation class PatientList
 */
@WebServlet("/patientlist")
public class PatientList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String page= request.getParameter("page");
		int curpage=1;
		if(page!=null) {
			curpage= Integer.parseInt(page);
		}
		
		try {
			PatientService patientService=new PatientServiceImpl();
			Map<String,Object>res=patientService.patientListByPage(curpage);	
			request.setAttribute("res", res);
			request.getRequestDispatcher("reserveinfo_p.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}
}
