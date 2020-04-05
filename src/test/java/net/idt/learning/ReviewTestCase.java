package net.idt.learning;

import net.idt.learning.dao.ProductDao;
import net.idt.learning.dao.ReviewDao;
import net.idt.learning.dao.UserDao;
import net.idt.learning.dto.Review;
import net.idt.learning.dto.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Date;

import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = ForestryAccountingApplication.class)
public class ReviewTestCase {
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ProductDao productDao;

	@Test
	public void testAddReview() {
		Review review = new Review();
		review.setProduct(productDao.get(1));
		review.setComment("Nice Product! I appreciate it");
		review.setRating(4);
		User user = userDao.getByEmail("bb@gmail.com");
		review.setUser(user);
		review.setReviewDate(new Date());
		assertTrue(reviewDao.add(review));
	}

}
