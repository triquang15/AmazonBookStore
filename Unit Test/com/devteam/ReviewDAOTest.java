package com.devteam;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.devteam.dao.ReviewDAO;
import com.devteam.entity.Book;
import com.devteam.entity.Customer;
import com.devteam.entity.Review;

public class ReviewDAOTest {
	private static ReviewDAO reviewDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

	@Test
	public void testCreateReview() {
		Review review = new Review();
		Book book = new Book();
		book.setBookId(5);
		
		Customer customer = new Customer();
		customer.setCustomerId(2);
		
		review.setBook(book);
		review.setCustomer(customer);
		
		review.setHeadline("Decent, but not as good as the original");
		review.setComment("Lily and Ryle are divorced now, trying to make co-parenting work, without putting their daughter, Emerson, at risk of Ryle’s temper.");
		review.setRating(3);
		
		Review newReviews = reviewDAO.create(review);
		assertTrue(newReviews.getReviewId() > 0);
	}

	@Test
	public void testGet() {
		Integer reviewId = 1;
		Review review = reviewDAO.get(reviewId);
		
		assertNotNull(review);
	}
	
	@Test
	public void testUpdateReview() {
		Integer reviewId = 1;
		Review review = reviewDAO.get(reviewId);
		review.setHeadline("So excited to read");
		review.setComment("Love the book, however I wish it didn’t have the yellow circle ‘sticker’ on the front! You can’t remove it as it is part of the cover");
		
		Review updateReview = reviewDAO.update(review);
		assertEquals(review.getHeadline(), updateReview.getHeadline());
	}

	@Test
	public void testDeleteObject() {
		int reviewId  = 3;
		reviewDAO.delete(reviewId);
		
		Review review = reviewDAO.get(reviewId);
		
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReviews = reviewDAO.listAll();
		 for(Review review : listReviews) {
			 System.out.println(review.getHeadline() + "---" + review.getCustomer().getFirstname());
		 }
		 
		 assertTrue(listReviews.size() > 0);
	}

	@Test
	public void testCount() {
		long totalReviews = reviewDAO.count();
		 System.out.println(totalReviews);
		assertTrue(totalReviews > 0);
	}

}
