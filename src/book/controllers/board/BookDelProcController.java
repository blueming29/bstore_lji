package book.controllers.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.board.dao.BookBoardDao;
import book.controllers.Controller;

public class BookDelProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int jibno = Integer.parseInt(request.getParameter("jibno"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		BookBoardDao dao = new BookBoardDao();
		dao.delete(jibno);

		response.sendRedirect("book.do?pg="+pg);
	}

}
