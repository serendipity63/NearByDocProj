package controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Review;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.ReviewService;
import service.ReviewServiceImpl;
/**
 * Servlet implementation class Review
 */
@WebServlet("/insertreview")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("review.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pidnum = request.getParameter("pidnum");
		String comnum = request.getParameter("comnum");
		String content = request.getParameter("content");
		String star = request.getParameter("star");
		Timestamp birth = null;
		Integer id = null;
		Review review = new Review(pidnum,comnum,content,star,birth,id);
		try {
			ReviewService reviewservice = new ReviewServiceImpl();
			reviewservice.insertReview(review);
			HospitalService hospitalservice = new HospitalServiceImpl();
			hospitalservice.updateGrade(comnum);

		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error404.jsp").forward(request, response); // 에러 페이지 따로 만들거에요
		}
	}

}
