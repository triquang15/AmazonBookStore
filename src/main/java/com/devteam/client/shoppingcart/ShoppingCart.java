package com.devteam.client.shoppingcart;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.devteam.entity.Book;

public class ShoppingCart {
	private Map<Book, Integer> cart = new HashMap<>();

	public void addItem(Book book) {
		if (cart.containsKey(book)) {
			Integer quantity = cart.get(book) + 1;
			cart.put(book, quantity);
		} else {
			cart.put(book, 1);
		}
	}

	public Map<Book, Integer> getItems() {
		return this.cart;
	}

	public void removeItems(Book book) {
		cart.remove(book);
	}

	public int totalQuantity() {
		int total = 0;
		Iterator<Book> iterator = cart.keySet().iterator();

		while (iterator.hasNext()) {
			Book next = iterator.next();
			Integer quantity = cart.get(next);
			total += quantity;
		}

		return total;
	}

	public double getTotalAmount() {
		double total = 0.0f;
		Iterator<Book> iterator = cart.keySet().iterator();
		
		while (iterator.hasNext()) {
			Book book = iterator.next();
			Integer quantity = cart.get(book);
			double subTotal = quantity * book.getPrice();
			total += subTotal;
		}
		return total;
	}

}
