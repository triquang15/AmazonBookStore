package com.devteam;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.devteam.dao.OrderDAO;
import com.devteam.entity.Book;
import com.devteam.entity.BookOrder;
import com.devteam.entity.Customer;
import com.devteam.entity.OrderDetail;

public class OrderDAOTest {

	private static OrderDAO orderDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(6);

		order.setCustomer(customer);
		order.setRecipientName("Tri Quang");
		order.setRecipientPhone("123456789");
		order.setShippingAddress("123 South Street, New York, USA");
		order.setPaymentMethod("Paypal");

		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();

		Book book = new Book(2);
		orderDetail.setBook(book);
		orderDetail.setQuantity(5);
		orderDetail.setSubtotal(60.5f);
		orderDetail.setBookOrder(order);

		orderDetails.add(orderDetail);

		order.setOrderDetails(orderDetails);

		BookOrder savedOrder = orderDAO.create(order);

		assertNotNull(savedOrder);

	}

}
