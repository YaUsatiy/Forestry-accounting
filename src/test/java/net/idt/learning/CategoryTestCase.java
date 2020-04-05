package net.idt.learning;

import net.idt.learning.dao.CategoryDao;
import net.idt.learning.dto.Category;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = ForestryAccountingApplication.class)
public class CategoryTestCase {
	@Autowired
	private CategoryDao categoryDao;
	private Category category;

	@Test
	public void testAddCategory() {
		category = new Category();
		category.setName("Laptop");
		category.setDescription("This is some description for laptop!");
		category.setImageURL("CAT_105.png");
		assertTrue(categoryDao.add(category));
	}

	@Test
	public void testGetCategory() {
		category = categoryDao.get(1);
		assertEquals("Laptop", category.getName());
	}

	@Test
	public void testUpdateCategory() {
		category = categoryDao.get(1);
		category.setName("NewName2");
		assertTrue(categoryDao.update(category));
	}

	@Test
	public void testDeleteCategory() {
		category = categoryDao.get(2);
		assertTrue(categoryDao.delete(category));
	}

	@Test
	public void testListCategory() {
		List<Category> categories = categoryDao.list();
		assertEquals(1, categories.size());
	}

	@Test
	public void createCRUDCategory() {
		// add operation
		category = new Category();

		category.setName("Laptop");
		category.setDescription("This is some description for laptop!");
		category.setImageURL("CAT_1.png");
		assertTrue("Successfully added a category inside the table!", categoryDao.add(category));

		category = new Category();
		category.setName("Television");
		category.setDescription("This is some description for television!");
		category.setImageURL("CAT_2.png");
		assertTrue("Successfully added a category inside the table!", categoryDao.add(category));

		// fetching and updating the category
		category = categoryDao.get(2);
		category.setName("TV");
		assertTrue("Successfully updated a single category in the table!", categoryDao.update(category));

		// delete the category
		assertTrue("Successfully deleted a single category in the table!", categoryDao.delete(category));

		// fetching the list
		assertEquals("Successfully fetched the list of categories from the table!", 1, categoryDao.list().size());
	}

}
