package com.devteam.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CategoryTest {

	public static void main(String[] args) {
		Category newCat = new Category();
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory(null);
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		entityManager.persist(entityManager);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaa");

	}

}
