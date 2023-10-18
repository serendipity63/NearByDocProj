package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReviewService;
import service.ReviewServiceImpl;

/**
 * Servlet implementation class DeleteReview
 */
@WebServlet("/deletedeview")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		ReviewService reviewService = new ReviewServiceImpl();
		
		try {
			reviewService.reviewDelete(id);
			request.getRequestDispatcher("myreview.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
