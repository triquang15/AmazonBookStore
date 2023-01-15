package com.devteam;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.devteam.dao.BookDAO;
import com.devteam.entity.Book;
import com.devteam.entity.Category;

public class BookDAOTest extends BaseDAOTest {
	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		bookDAO = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Arts & Photography");
		category.setCategoryId(1);
		newBook.setCategory(category);
		
		newBook.setTitle("Go-To Dinners: A Barefoot Contessa Cookbook");
		newBook.setAuthor("Colleen Hoover");
		newBook.setDescription("From the #1 New York Times bestselling author of It Starts with Us and All Your Perfects, a “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” (Anna Todd, New York Times bestselling author) about a workaholic with a too-good-to-be-true romance can’t stop thinking about her first love.");
		newBook.setPrice(39.99f);
		newBook.setIsbn("14253263675");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("09/23/2022");
		
		String imagePath = "C:\\JavaWeb\\AmazonBookStore\\Images\\image-1.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		newBook.setPublished(publishDate);
		
		Book createdBook = bookDAO.create(newBook);
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book exitsBook = new Book();
		exitsBook.setBookId(5);
		
		Category category = new Category("Children's Books");
		category.setCategoryId(3);
		exitsBook.setCategory(category);
		
		exitsBook.setTitle("Reminders of Him: A Novel");
		exitsBook.setAuthor("Colleen Hoover");
		exitsBook.setDescription("From the #1 New York Times bestselling author of It Starts with Us and All Your Perfects, a “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” (Anna Todd, New York Times bestselling author) about a workaholic with a too-good-to-be-true romance can’t stop thinking about her first love.");
		exitsBook.setPrice(35.75f);
		exitsBook.setIsbn("142532343675");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("09/23/2022");
		
		String imagePath = "C:\\JavaWeb\\AmazonBookStore\\Images\\image-1.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		exitsBook.setImage(imageBytes);
		
		exitsBook.setPublished(publishDate);
		
		Book updateBook = bookDAO.update(exitsBook);
		assertEquals(updateBook.getTitle(), "Reminders of Him: A Novel");
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDAO.delete(bookId);	
	}
	
	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 6;
		bookDAO.delete(bookId);	
		
		assertTrue(true);
	}
	
	@Test
	public void testGetBookFail() {
		Integer bookId = 99;
		Book book = bookDAO.get(bookId);
		
		assertNull(book);
		
	}
	
	@Test
	public void testGetBookSuccess() {
		Integer bookId = 1;
		Book book = bookDAO.get(bookId);
		
		assertNotNull(book);
		
	}
	
	@Test
	public void testFindByTitleNotExits() {
		String title = "Java";
		Book book = bookDAO.findByTitle(title);
		assertNull(book);
	}
	
	@Test
	public void testFindByTitleExits() {
		String title = "The Fire Next Time";
		Book book = bookDAO.findByTitle(title);
		
		System.out.println(book.getTitle());
		System.out.println(book.getAuthor());
		
		assertNotNull(book);
	}
	
	@Test
	public void testListAll() {
		List<Book> listBooks = bookDAO.listAll();
		for (Iterator iterator = listBooks.iterator(); iterator.hasNext();) {
			Book book = (Book) iterator.next();
			System.out.println(book.getTitle() + " -- " + book.getAuthor());
		}
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void testCount() {
		long totalBooks = bookDAO.count();
		
		assertEquals(4, totalBooks);
	}
}
