package com.devteam.dao;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.devteam.entity.Users;

public class UserDAOTest {
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setupClass() {
		entityManagerFactory = Persistence.createEntityManagerFactory("AmazonBookStore");
		entityManager = entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
	}
	
	
	@Test
	public void testCreateUsers() {
		Users users = new Users();
		users.setEmail("tomy@gmail.com");
		users.setFullName("Tomy");
		users.setPassword("aaaaaaa");
	
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
	
	@AfterClass
	public static void tearDownClass() {
		entityManager.close();
		entityManagerFactory.close();
	}

}

