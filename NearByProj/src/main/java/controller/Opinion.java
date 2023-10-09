package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Board;
import dto.Member;
import service.BoardService;
import service.BoardServiceImpl;

/**
 * Servlet implementation class Opinion
 */
@WebServlet("/opinion")
public class Opinion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Opinion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("writeform.jsp").forward(request, response);
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		// 파일 업로드 시작
		String uploadPath=request.getServletContext().getRealPath("upload");
		int size=10*1024*1024;
		MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy()); // 같은 파일 반복해서 올리면 숫자 순서 추가
		//파일 업로드 끝

		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String fileUrl=multi.getOriginalFileName("file");
		HttpSession session = request.getSession();
		Patient patient= (Patient)session.getAttribute("user");
		String writer= patient.getId();
		
		Check check=new Patient();
		check.setSubject(subject);
		check.setContent(content);
		check.setFileurl(fileUrl);
		check.setWriter(writer);
		try {
			BoardService boardService= new BoardServiceImpl();
			boardService.boardWrite(board);
//			request.getRequestDispatcher("boardlist.jsp").forward(request, response);
			response.sendRedirect("boardlist");
			
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	
	}

}
