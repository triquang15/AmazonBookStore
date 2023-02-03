package com.devteam.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.devteam.common.CommonUtility;
import com.devteam.common.HashGenerator;
import com.devteam.dao.CustomerDAO;
import com.devteam.dao.OrderDAO;
import com.devteam.dao.ReviewDAO;
import com.devteam.entity.Customer;
import static com.devteam.common.Utitlity.*;

public class CustomerService {

	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CustomerService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.customerDAO = new CustomerDAO();
	}

	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDAO.listAll();
		request.setAttribute("listCustomer", listCustomer);
		forwardToPage("customer_list.jsp", message, request, response);
	}

	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);

		if (existCustomer != null) {
			String message = "Could not create new customer: the email " + email
					+ " is already registered by another customer.";
			listCustomers(message);

		} else {
			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.create(newCustomer);

			String message = "New customer has been created successfully.";
			listCustomers(message);

		}

	}

	private void updateCustomerFieldsFromForm(Customer customer) {
		String email = request.getParameter("email");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");

		if (email != null && !email.equals("")) {
			customer.setEmail(email);
		}

		customer.setFirstname(firstname);
		customer.setLastname(lastname);

		if (password != null && !password.isEmpty()) {
			String encryptPassword = HashGenerator.generateMD5(password);
			customer.setPassword(encryptPassword);
		}

		customer.setPhone(phone);
		customer.setAddressLine1(address1);
		customer.setAddressLine2(address2);
		customer.setCity(city);
		customer.setState(state);
		customer.setZipcode(zipCode);
		customer.setCountry(country);
	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		CommonUtility.loadCountryList(request);

		if (customer == null) {
			String message = "Could not find customer with ID " + customerId;
			showMessageBackend(message, request, response);
		} else {
			request.setAttribute("customer", customer);
			forwardToPage("customer_form.jsp", request, response);
		}
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");

		Customer customerByEmail = customerDAO.findByEmail(email);
		String message = null;

		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			message = "Could not update the customer ID " + customerId
					+ "because there's an existing customer having the same email.";

		} else {

			Customer customerById = customerDAO.get(customerId);
			updateCustomerFieldsFromForm(customerById);

			customerDAO.update(customerById);

			message = "The customer has been updated successfully.";
		}

		listCustomers(message);
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		if (customer != null) {
			ReviewDAO reviewDAO = new ReviewDAO();
			long reviewCount = reviewDAO.countByCustomer(customerId);

			if (reviewCount > 0) {
				String message = "Could not delete customer with ID " + customerId;
				showMessageBackend(message, request, response);
			} else {
				OrderDAO orderDAO = new OrderDAO();
				long orderCount = orderDAO.countByCustomer(customerId);

				if (orderCount > 0) {
					String message = "Could not delete customer with ID " + customerId;
					showMessageBackend(message, request, response);
				} else {
					customerDAO.delete(customerId);
					String message = "The customer has been deleted successfully.";
					listCustomers(message);
				}
			}
		} else {
			String message = "Could not find customer with ID " + customerId + ", "
					+ "or it has been deleted by another admin";
			showMessageBackend(message, request, response);
		}

	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		String message = "";

		if (existCustomer != null) {
			message = "The email " + email + " is already.";
		} else {

			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.create(newCustomer);

			message = "You have registered successfully!";
		}

		showMessageFrontend(message, request, response);
	}

	public void showLogin() throws ServletException, IOException {
		forwardToPage("client/login.jsp", request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Customer customer = customerDAO.checkLogin(email, password);

		if (customer == null) {
			String message = "Incorrect account or password.";
			request.setAttribute("message", message);
			showLogin();

		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);

			Object objRedirectURL = session.getAttribute("redirectURL");

			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showCustomerProfile();
			}
		}
	}

	public void showCustomerProfile() throws ServletException, IOException {
		CommonUtility.loadCountryList(request);
		forwardToPage("client/customer_profile.jsp", request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsFromForm(customer);
		customerDAO.update(customer);

		showCustomerProfile();

	}

	public void newCustomer() throws ServletException, IOException {
		CommonUtility.loadCountryList(request);

		String customerForm = "customer_form.jsp";
		request.getRequestDispatcher(customerForm).forward(request, response);

	}

}
