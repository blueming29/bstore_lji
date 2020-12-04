package book.controllers.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.board.dao.BookBoardDao;
import book.controllers.Controller;

public class BookHitProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int jibno = Integer.parseInt(request.getParameter("jibno"));
		String page = request.getParameter("pg");
		int pg = 1;
		if(page != null && !page.equals("")) {
			pg = Integer.parseInt(request.getParameter("pg"));
			
		}
	
		BookBoardDao dao = new BookBoardDao();
		dao.hit(jibno);
		
		response.sendRedirect("bookDetail.do?jibno="+jibno+"&pg="+pg);
	}
	
}
