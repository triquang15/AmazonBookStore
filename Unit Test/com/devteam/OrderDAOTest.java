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
		order.setFirstname("Tri");
		order.setLastname("Quang");
		order.setPhone("123456789");
		order.setAddressLine1("123 South Street, New York, USA");
		order.setAddressLine2("123 South Street, New York, USA");
		order.setCity("Ho Chi Minh");
		order.setState("Ho Chi Minh");
		order.setCountry("US");
		order.setPaymentMethod("Paypal");
		order.setZipcode("10000");

		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();

		Book book = new Book(2);
		orderDetail.setBook(book);
		orderDetail.setQuantity(5);
		orderDetail.setSubtotal(60.5f);
		orderDetail.setBookOrder(order);

		orderDetails.add(orderDetail);

		order.setOrderDetails(orderDetails);
		order.setTax(6.5f);
		order.setSubtotal(60.5f);
		order.setShippingFee(2.0f);
		order.setTotal(68f);

		BookOrder savedOrder = orderDAO.create(order);

		assertNotNull(savedOrder);

	}

}
