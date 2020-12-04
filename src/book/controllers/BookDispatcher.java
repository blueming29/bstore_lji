package book.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.controllers.board.BookController;
import book.controllers.board.BookDelProcController;
import book.controllers.board.BookDetailController;
import book.controllers.board.BookEditController;
import book.controllers.board.BookEditProcController;
import book.controllers.board.BookHitProcController;
import book.controllers.board.BookRegController;
import book.controllers.board.BookRegProcController;

public class BookDispatcher extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestUri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = requestUri.substring(conPath.length());
		//System.out.println(com);
		
		Controller controller = null;
		try {
			if(com.equals("/book/bookDetail.do")) {
				controller = new BookDetailController();
			} else if(com.equals("/book/bookEdit.do")) {
				controller = new BookEditController();
			} else if(com.equals("/book/bookEditProc.do")) {
				controller = new BookEditProcController();
			} else if(com.equals("/book/bookDelProc.do")) {
				controller = new BookDelProcController();
			} else if(com.equals("/book/bookReg.do")) {
				controller = new BookRegController();
			} else if(com.equals("/book/bookRegProc.do")) {
				controller = new BookRegProcController();
			} else if(com.equals("/book/book.do")) {
				controller = new BookController();
			} else if(com.equals("/book/bookHitProc.do")) {
				controller = new BookHitProcController();
			}
			
			
			controller.execute(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		service(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		service(request, response);
	}
}
