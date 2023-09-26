package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.PatientMember;

/**
 * Servlet implementation class PatientJoin
 */
@WebServlet("/pjoin")
public class PatientJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientJoin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("patientjoin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// request로부터 값을 읽어온다.
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		Integer phonenumber = Integer.parseInt(request.getParameter("phonenumber"));
		Integer idnumber = Integer.parseInt(request.getParameter("idnumber"));
		String address = request.getParameter("address");

		// 파라미터로 가져온 값으로 Member 객체를 생성한다.
		PatientMember pmember = new PatientMember(email, password, name, phonenumber, idnumber, address);

		// 생성된 객체를 session에 넣는다.
		HttpSession session = request.getSession();
		session.setAttribute("pmember", pmember);

		// login.jsp로 포워딩한다.
		// 아니면 그냥 main으로 포워딩하기
		RequestDispatcher dispatcher = request.getRequestDispatcher("plogin.jsp");
		dispatcher.forward(request, response);

	}

}
