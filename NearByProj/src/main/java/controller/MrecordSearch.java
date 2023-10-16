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
 * Servlet implementation class MrecordSearch
 */
@WebServlet("/mrecordsearch")
public class MrecordSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MrecordSearch() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		String page=request.getParameter("page");
		int curPage=1;
		if(page!=null) {
			curPage= Integer.parseInt(page);
		}
		
		if(type.equals("all")) {
			response.sendRedirect("patientlist");
			return;
		}
		try {
			PatientService patientService=new PatientServiceImpl();
			Map<String,Object>res=patientService.patientSearch(type,keyword,curPage);	
			request.setAttribute("res", res);
			request.getRequestDispatcher("mrecord.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "환자 검색 오류");
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
	}

}
