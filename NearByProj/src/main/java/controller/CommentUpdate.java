package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Reservation;
import service.ReservationService;
import service.ReservationServiceImpl;

/**
 * Servlet implementation class CommentUpdate
 */
@WebServlet("/commentupdate")
public class CommentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String comment = request.getParameter("comment");
		
		Reservation res = new Reservation(comment, id);
		
		ReservationService reservationService = new ReservationServiceImpl();
		
		try {
			reservationService.updateComment(res);
			request.getRequestDispatcher("reslist.jsp").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
