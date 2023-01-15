package com.devteam.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.dao.BookDAO;
import com.devteam.dao.CategoryDAO;
import com.devteam.entity.Book;
import com.devteam.entity.Category;

public class BookService {
	private EntityManager entityManager;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDAO bookDAO;
	private CategoryDAO categoryDAO;

	public BookService(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		super();
		this.entityManager = entityManager;
		this.request = request;
		this.response = response;
		bookDAO = new BookDAO(entityManager);
		categoryDAO = new CategoryDAO(entityManager);
	}

	public void listBooks() throws ServletException, IOException {
		List<Book> listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);

		String listPage = "book_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
		dispatcher.forward(request, response);
	}
	
	public void showBookNewForm() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);

		String newPage = "book_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(newPage);
		dispatcher.forward(request, response);
		
	}

}
