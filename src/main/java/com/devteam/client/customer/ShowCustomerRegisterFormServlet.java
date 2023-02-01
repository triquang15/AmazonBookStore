package com.devteam.client.customer;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowCustomerRegisterFormServlet
 */
@WebServlet("/register")
public class ShowCustomerRegisterFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCustomerRegisterFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] countryCodes = Locale.getISOCountries();

		Map<String, String> mapCountries = new TreeMap<>();

		for (String countryCode : countryCodes) {
			Locale locale = new Locale("", countryCode);
			String code = locale.getCountry();
			String name = locale.getDisplayCountry();

			mapCountries.put(name, code);
		}

		request.setAttribute("mapCountries", mapCountries);
		
		String registerForm = "client/register_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
		dispatcher.forward(request, response);
	}

}
