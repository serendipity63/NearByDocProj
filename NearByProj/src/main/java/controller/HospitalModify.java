package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

/**
 * Servlet implementation class HospitalModify
 */
@WebServlet("/hospitalmodify")
public class HospitalModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comnum=request.getParameter("comnum");
		
		try {
			HospitalService hospitalService=new HospitalServiceImpl();
			Hospital hospital=hospitalService.hospitalInfo(hname);
			request.setAttribute("hospital", hospital);
			request.getRequestDispatcher("hcorrection.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "병원정보수정 실패");
			request.getRequestDispatcher("herror.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uploadPath=request.getServletContext().getRealPath("upload");
		int size=10*1024*1024;
		MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		
		
		String hname=multi.getParameter("hname");
		String comnum=multi.getParameter("comnum");
		String htel=multi.getParameter("htel");
		String hroad=multi.getParameter("hroad");
		String hdong=multi.getParameter("hdong");
		String hdetail=multi.getParameter("hdetail");
		String hpostcode=multi.getParameter("hpostcode");
		String clinic=multi.getParameter("clinic");
		String lunch=multi.getParameter("lunch");
		
		Hospital hospital=new Hospital();
		hospital.setHname(hname);
		hospital.setComnum(comnum);
		hospital.setHtel(htel);
		hospital.setHroad(hroad);
		hospital.setHdong(hdong);
		hospital.setHdetail(hdetail);
		hospital.setHpostcode(hpostcode);
		hospital.setClinic(clinic);
		hospital.setLunch(lunch);
		
		try {
			HospitalService hospitalService= new HospitalServiceImpl();
			hospitalService.hospitalModify(hospital);
			response.sendRedirect("hinfo?hname="+hospital.getHname());
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "병원 수정 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
	}

}
