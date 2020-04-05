package net.idt.learning;

import net.idt.learning.dao.ProductDao;
import net.idt.learning.dto.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = ForestryAccountingApplication.class)
public class ProductTestCase {
	@Autowired
	private ProductDao productDao;

	@Test
	public void testCRUDProduct() {
		// create operation
		Product product = new Product();
		product.setName("Oppo Selfie S53");
		product.setDescription("This is some description for oppo mobile phones!");
		product.setUnitPrice(25000);
		product.setActive(true);
		product.setCategoryId(3);
		product.setSupplierId(3);
		assertTrue(productDao.add(product));
		
		// reading and updating the category
		product = productDao.get(2);
		product.setName("Samsung Galaxy S7");
		assertTrue(productDao.update(product));

		assertTrue(productDao.delete(product));
		
		// list
		assertEquals(6, productDao.list().size());		
				
	}
	
	@Test
	public void testListActiveProducts() {
		assertEquals(5, productDao.listActiveProducts().size());				
	} 
	
	
	@Test
	public void testListActiveProductsByCategory() {
		assertEquals(3, productDao.listActiveProductsByCategory(3).size());
		assertEquals(2, productDao.listActiveProductsByCategory(1).size());
	} 
	
	@Test
	public void testGetLatestActiveProduct() {
		assertEquals(3, productDao.getLatestActiveProducts(3).size());
	} 
}
