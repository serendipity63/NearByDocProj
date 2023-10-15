package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String page= request.getParameter("page");
		int curpage=1;
		if(page!=null) {
			curpage= Integer.parseInt(page);
		}
		
		try {
			ReservationService reservationService=new ReservationServiceImpl();
			Map<String,Object>res=reservationService.reservationListByPage(curpage);	
			request.setAttribute("res", res);
			request.getRequestDispatcher("reserve_t.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
		
	}

	
}
