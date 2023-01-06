package com.devteam.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.devteam.entity.Users;

public class UserDAOTest extends BaseDAOTest {
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setupClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		userDAO = new UserDAO(entityManager);
	}
	
	
	@Test
	public void testCreateUsers() {
		Users users = new Users();
		users.setEmail("tomy123@gmail.com");
		users.setFullName("Tomy1");
		users.setPassword("bbbbb");
	
		users = userDAO.create(users);
		assertTrue(users.getUserId() > 0);
		System.out.println("Done !");
	
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users users = new Users();
		users = userDAO.create(users);

		System.out.println("Done !");
	}
	
	@Test
	public void testUpdateUsers() {
		Users users = new Users();
		users.setUserId(1);
		users.setEmail("david@gmail.com");
		users.setFullName("David Beckham");
		users.setPassword("mysecret1");
		
		users = userDAO.update(users);
		String expected = "mysecret1";
		String actual = users.getPassword();
		assertEquals(expected, actual);
	}
	
	@Test
	public void testGetUsersFound() {
		Integer userId = 1;
		Users user = userDAO.get(userId);
		if(user != null) {
			System.out.println(user.getEmail());
		}
		assertNotNull(user);
	}
	
	@Test
	public void testGetUsersNotFound() {
		Integer userId = 99;
		Users user = userDAO.get(userId);
		assertNull(user);
	}
	
	@Test
	public void testDeleteUsers() {
		Integer userId = 6;
		userDAO.delete(userId);
		
		Users user = userDAO.get(userId);
		
		assertNull(user);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistUsers() {
		Integer userId = 55;
		userDAO.delete(userId);
		
	}
	
	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		for(Users users : listUsers) {
			System.out.println(users.getEmail());
		}
		assertTrue(listUsers.size() > 0);
	}
	
	@Test
	public void testCountAll() {
		long totalUsers = userDAO.count();
		assertEquals(3, totalUsers);
	}
	
	@Test
	public void checkLoginSuccess() {
		String email = "loc@gmail.com";
		String password = "1234567";
		boolean loginResult = userDAO.checkLogin(email, password);
		assertTrue(loginResult);
	}
	
	@Test
	public void findByEmail() {
		String email = "david@gmail.com";
		Users users = userDAO.findByEmail(email);
		assertNotNull(users);
		//assertNull(users);
	}
	
	@AfterClass
	public static void tearDownClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

}

