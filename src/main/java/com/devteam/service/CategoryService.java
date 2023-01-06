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
import com.devteam.entity.Users;

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
			String createPage = "category_form.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(createPage);
			requestDispatcher.forward(request, response);
		}else {
			Category category = new Category(name);
			categoryDAO.create(category);
			listCategory("New category created successfully");
		}
	}
	
	public void editCategory() throws ServletException, IOException {
		int categoryID = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryID);
		
		String editPage = "category_edit_form.jsp";
		request.setAttribute("category", category);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}
	
	public void updateCategory() throws IOException, ServletException {
		int categoryID = Integer.parseInt(request.getParameter("categoryId"));
		String name = request.getParameter("name");
		
		Category categoryById = categoryDAO.get(categoryID);
		Category categoryByName = categoryDAO.findByName(name);
		if(categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId()) {
			String message = "Could not update category. " + "A category with name " + name + " already exists.";
			request.setAttribute("message", message);
		
			RequestDispatcher dispatcher = request.getRequestDispatcher("category_edit_form.jsp");
			dispatcher.forward(request, response);
		}else {
			categoryById.setName(name);
			categoryDAO.update(categoryById);
			String message = "Category update successfully";
			listCategory(message);
		}
	}
	
	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		categoryDAO.delete(categoryId);
		String message = "Category has been delele successfully";
		listCategory(message);
	}

}
