package com.devteam.client.checkout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.service.OrderService;
import com.devteam.service.PaymentService;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

/**
 * Servlet implementation class ExecutePayment
 */
@WebServlet("/proceed_payment")
public class ExecutePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExecutePayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaymentService paymentService = new PaymentService(request, response);
		try {
			Payment payment = paymentService.executePayment();
			OrderService orderService = new OrderService(request, response);
			Integer orderId = orderService.proceedPaypal(payment);
			response.getWriter().println("Palpal Sucessful. Order ID: " + orderId);
			
		} catch (PayPalRESTException e) {
			e.printStackTrace();
			throw new ServletException("Error in executing payment.");
		}
	}

}
