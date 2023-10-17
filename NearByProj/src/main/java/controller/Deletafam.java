package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FamilyService;
import service.FamilyServiceImpl;

/**
 * Servlet implementation class Deletafam
 */
@WebServlet("/deletafam")
public class Deletafam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletafam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String fname = request.getParameter("fname");
		
		FamilyService familyService = new FamilyServiceImpl();
		
		try {
			familyService.editFam(fname);
			response.sendRedirect("modifamally.jsp");
			
		} catch( Exception e) {
			e.printStackTrace();
		}
	}

}
