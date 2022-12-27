package com.devteam.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.dao.CategoryDAO;
import com.devteam.entity.Category;

public class CategoryService {
	private EntityManager entityManager;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CategoryDAO categoryDAO;
	
	public CategoryService(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.entityManager = entityManager;
		categoryDAO = new CategoryDAO(entityManager);
	}
	
	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}
	
	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategories = categoryDAO.listAll();
		request.setAttribute("listCategories", listCategories);
		
		if(message != null) {
			request.setAttribute("message", message);
		}
		String page = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request, response);
		
	}
	
	public void createUser() throws ServletException, IOException {
		String name = request.getParameter("name");
		Category existCategory = categoryDAO.findByName(name);
		if(existCategory != null ) {
			String message = "Could not create category. " + "A category with name " + name + "already exists.";
			request.setAttribute("message", message);
			String listPage = "category_form.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
			requestDispatcher.forward(request, response);
		}else {
			Category category = new Category(name);
			categoryDAO.create(category);
			listCategory("New category created successfully");
		}
		
		
		
	}

}
