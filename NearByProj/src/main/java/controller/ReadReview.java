package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.ReviewService;
import service.ReviewServiceImpl;

/**
 * Servlet implementation class ReadReview
 */
@WebServlet("/readreview")
public class ReadReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comnum = request.getParameter("comnum");
		ReviewService reviewservice = new ReviewServiceImpl();
		try {
			List<Map<String, Object>> reviewlist = reviewservice.reviewListByHos(comnum);
			request.setAttribute("reviewlist", reviewlist);
			request.getRequestDispatcher("readreview.jsp").forward(request, response);
		
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response);
		}
	}

}
