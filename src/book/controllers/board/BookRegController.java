package book.controllers.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.controllers.Controller;

public class BookRegController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.sendRedirect("bookReg.jsp");
	}
}
