package com.devteam.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.dao.BookDAO;
import com.devteam.entity.Book;

@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDAO bookDAO = new BookDAO();

		List<Book> listNewBooks = bookDAO.listNewBooks();
		request.setAttribute("listNewBooks", listNewBooks);
		
		String homePage = "client/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homePage);
		dispatcher.forward(request, response);
	}

}
