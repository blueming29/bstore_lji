package book.controllers.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.board.dao.BookBoardDao;
import book.board.vo.BookBoard;
import book.controllers.Controller;

public class BookEditProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int jibno = Integer.parseInt(request.getParameter("jibno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int pg = Integer.parseInt(request.getParameter("pg"));


		BookBoard b = new BookBoard();
		b.setJibno(jibno);
		b.setJibtitle(title);
		b.setJibcontent(content);

		BookBoardDao dao = new BookBoardDao();
		int af = dao.modify(b);
		b = dao.getBookBoard(jibno);

		if (af > 0) {
			request.setAttribute("b", b);
			request.setAttribute("pg", pg);

			request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
		} else {
			// System.out.println("수정실패");
		}

	}

}
