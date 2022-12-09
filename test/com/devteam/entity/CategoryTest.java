package com.devteam.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CategoryTest {

	public static void main(String[] args) {
		Category newCat = new Category("Advanced Java");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("AmazonBookStore");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		entityManager.persist(newCat);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaa");

	}

}
