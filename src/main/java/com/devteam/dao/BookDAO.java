package com.devteam.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import com.devteam.entity.Book;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO(EntityManager entityManager) {
		super(entityManager);
	}

	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}

	@Override
	public Book update(Book t) {
		t.setLastUpdateTime(new Date());
		return super.update(t);
	}

	@Override
	public Book get(Object id) {
		return super.find(Book.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Book.class, id);

	}

	@Override
	public List<Book> listAll() {
		return super.findWithNameQuery("Book.findAll");
	}

	public Book finfByTitle(String title) {
		List<Book> result = super.findWithNameQuery("Book.findByTitle", "title", title);

		if (!result.isEmpty()) {
			return result.get(0);
		}

		return null;
	}

	@Override
	public long count() {
		return super.countWithNameQuery("Book.countAll");
	}

}
