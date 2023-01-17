package com.devteam.client.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.service.CustomerService;

/**
 * Servlet implementation class UpdateCustomerProfileServlet
 */
@WebServlet("/update_profile")
public class UpdateCustomerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CustomerService customerServices = new CustomerService(request, response);
		customerServices.updateCustomerProfile();
	}

}
