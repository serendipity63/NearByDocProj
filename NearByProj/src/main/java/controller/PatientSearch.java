package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Hospital;
import service.ReservationService;
import service.ReservationServiceImpl;

/**
 * Servlet implementation class PatientSearch
 */
@WebServlet("/patientsearch")
public class PatientSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("reserveinfo_p.jsp").forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		String page=request.getParameter("page");
		HttpSession session = request.getSession();
		Hospital hospital = (Hospital)session.getAttribute("hospitaluser");
		String comnum = hospital.getComnum();
		System.out.println(comnum);
		int curPage=1;
		if(page!=null) {
			curPage= Integer.parseInt(page);
		}

		try {
			ReservationService resService=new ReservationServiceImpl();
			Map<String,Object>res=resService.patientResListSearch(type,keyword,curPage,comnum);	
			request.setAttribute("res", res);
			System.out.println(res);
			request.getRequestDispatcher("reserveinfo_p.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "환자 검색 오류");
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
	}

}
