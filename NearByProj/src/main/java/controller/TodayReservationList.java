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
 * Servlet implementation class TodayReservationList
 */
@WebServlet("/trlist")
public class TodayReservationList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodayReservationList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		String page= request.getParameter("page");
		HttpSession session = request.getSession();
		Hospital hospital = (Hospital)session.getAttribute("hospitaluser");
		String comnum = hospital.getComnum();
		int curpage=1;
		if(page!=null) {
			curpage= Integer.parseInt(page);
		}
		
		try {
			ReservationService reservationservice = new ReservationServiceImpl();
			Map<String,Object>res=reservationservice.todayResListByPage(curpage,comnum);
			System.out.println(res);
			request.setAttribute("res", res);
			request.getRequestDispatcher("reserve_t.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
		
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String id= request.getParameter("id");
    	String doccomment = request.getParameter("doccomment");
    	String page = request.getParameter("page");
    	System.out.println(id);
    	System.out.println(doccomment);
    	System.out.println(page);
    	HttpSession session = request.getSession();
    	Hospital hospital = (Hospital)session.getAttribute("hospitaluser");
		String comnum = hospital.getComnum();
		int curpage=1;
		if(page!=null) {
			curpage= Integer.parseInt(page);
		}
		
		try {
			ReservationService reservationservice = new ReservationServiceImpl();
			reservationservice.updateDoccommentById(id,doccomment);
			Map<String,Object>res=reservationservice.todayResListByPage(curpage,comnum);
			System.out.println(res);
			request.setAttribute("res", res);
			request.getRequestDispatcher("reserve_t.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
    }
}
