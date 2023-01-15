package com.devteam.controller.admin.books;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.service.BookService;

/**
 * Servlet implementation class UpdateBookServlet
 */
@WebServlet("/admin/update_book")
@MultipartConfig(
		fileSizeThreshold = 1024 * 10,	// 10 KB
		maxFileSize = 1024 * 300,		// 300 KB
		maxRequestSize = 1024 * 1024	// 1 MB 
)
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateBookServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookService bookServices = new BookService(request, response);
		bookServices.updateBook();
	}

}
