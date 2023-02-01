package com.devteam;

import static org.junit.Assert.*;

import java.util.Iterator;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.devteam.dao.CustomerDAO;
import com.devteam.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("mina@gmail.com");
		customer.setFirstname("Ali");
		customer.setLastname("Mina");
		customer.setCity("California");
		customer.setCountry("USA");
		customer.setPhone("098678123");
		customer.setPassword("12345678");
		customer.setAddressLine1("LonDon");
		customer.setAddressLine2("LonDon");
		customer.setState("Viet Nam");
		customer.setZipcode("124354");
		
		Customer createCustomer = customerDAO.create(customer);
		assertTrue(createCustomer.getCustomerId() > 0);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDAO.get(1);
		String fullName = "Update";
		customer.setFirstname(fullName);
		
		Customer updateCustomer = customerDAO.update(customer);
		
		assertTrue(updateCustomer.getFirstname().equals(fullName));
	}

	@Test
	public void testGet() {
		Integer customerId = 7;
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}

	@Test
	public void testDeleteObject() {
		Integer customerId = 1;
		customerDAO.delete(customerId);
		Customer customer = customerDAO.get(1);
		
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDAO.listAll();
		for (Iterator iterator = listCustomers.iterator(); iterator.hasNext();) {
			Customer customer = (Customer) iterator.next();
			System.err.println(customer.getFirstname() + " ---- " + customer.getEmail());
		}
		
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test
	public void testCountCustomer() {
		long totalCustomer = customerDAO.count();
		
		assertEquals(2, totalCustomer);
	}

}
