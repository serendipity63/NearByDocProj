package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Patient;
import service.ReviewService;
import service.ReviewServiceImpl;

/**
 * Servlet implementation class Myreview
 */
@WebServlet("/myreview")
public class Myreview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myreview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Patient patient = (Patient)session.getAttribute("user");
		String pidnum = patient.getPidnum();
		
		ReviewService reviewService = new ReviewServiceImpl();
		try {
			List<Map<String, Object>> reviews = reviewService.myReviews(pidnum);
			System.out.println(reviews);
			request.setAttribute("reviews", reviews);
			request.getRequestDispatcher("myreview.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
