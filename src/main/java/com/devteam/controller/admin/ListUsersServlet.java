package com.devteam.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.entity.Users;
import com.devteam.service.UserServices;

@WebServlet("/admin/list_users")
public class ListUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserServices userServices;
  
    public ListUsersServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userServices = new UserServices(request, response);
//		List<Users> lisUsers = userServices.listUser();
//		request.setAttribute("listUsers", lisUsers);
//		String listpage = "user_list.jsp";
//		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listpage);
//		requestDispatcher.forward(request, response);
		
		userServices.listUser();
	}

	

}
