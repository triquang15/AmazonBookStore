package com.devteam.controller.admin.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.controller.admin.BaseServlet;
import com.devteam.service.CategoryService;


@WebServlet("/admin/delete_category")
public class DeleteCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
    private CategoryService categoryService;
	
    public DeleteCategoryServlet() {
        super();  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		categoryService = new CategoryService(entityManager, request, response);
		categoryService.deleteCategory();
	}

	

}
