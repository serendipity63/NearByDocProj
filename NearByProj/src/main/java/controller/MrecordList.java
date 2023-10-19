package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Map;
import dto.Hospital;
import service.ReservationService;
import service.ReservationServiceImpl;

/**
 * Servlet implementation class MrecordList
 */
@WebServlet("/mrecordlist")
public class MrecordList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MrecordList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		HttpSession session = request.getSession();
		Hospital hospital = (Hospital)session.getAttribute("hospitaluser");
		String comnum = hospital.getComnum();
		int curpage = 1;
		if(page!=null) {
			curpage = Integer.parseInt(page);
		}
		
		try {
			ReservationService reservationService = new ReservationServiceImpl();
			Map<String, Object> res = reservationService.resListByPage(comnum, curpage);
			request.setAttribute("res", res);
			/*
			 * request.setAttribute("sdate","0000-00-00");
			 * request.setAttribute("edate","9999-99-99");
			 */
			
			request.getRequestDispatcher("mrecord.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
	}

}
