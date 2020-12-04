package book.controllers.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.board.dao.BookBoardDao;
import book.board.vo.BookBoard;
import book.controllers.Controller;

public class BookController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int page = 1;
		String pg = request.getParameter("pg");
		if(pg != null && !pg.equals("")) {
			page = Integer.parseInt(pg);
		}
		
		String field = request.getParameter("f");
		if(field == null || field.equals("")) {
			field = "jibtitle";
		}
		
		String query = request.getParameter("q");
		if(query == null) {
			query = "";
		}
		
		BookBoardDao dao = new BookBoardDao();
		List<BookBoard> list = dao.getBookBoard(page, field, query);

		int cnt = dao.getCount(field, query);
		
		int start = page - (page-1)%5;		// 페이지그룹에서 첫페이지
		int end = cnt/5 + (cnt%5==0?0:1);	// 토탈 페이지수
		
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("cnt", cnt);
		request.setAttribute("page", page);
		request.setAttribute("query", query);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("book.jsp").forward(request, response);
		
	}
	
}
