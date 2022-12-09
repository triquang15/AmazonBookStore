package com.devteam.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UsersTest {

	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setEmail("nam@gmail.com");
		user1.setFullName("nam ha minh");
		user1.setPassword("hello");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("AmazonBookStore");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		entityManager.persist(user1);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaa");

	}

}
