package book.controllers.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.board.dao.BookBoardDao;
import book.board.vo.BookBoard;
import book.controllers.Controller;

public class BookRegProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		if(title.isEmpty()){
			title = "제목 없음";
		}
		
		if(content.isEmpty()){
			content = "내용 없음";
		}
		
		BookBoard b = new BookBoard();
		b.setJibtitle(title);
		b.setJibcontent(content);
		
		BookBoardDao dao = new BookBoardDao();
		dao.write(b);
	
		response.sendRedirect("book.do");
		
	}

}
