package book.controllers.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.board.dao.BookBoardDao;
import book.board.vo.BookBoard;
import book.controllers.Controller;

public class BookDetailController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int jibno = Integer.parseInt(request.getParameter("jibno"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		BookBoardDao dao = new BookBoardDao();
		BookBoard b = dao.getBookBoard(jibno);
		
		request.setAttribute("b", b);
		request.setAttribute("pg", pg);

		request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
	}

}
