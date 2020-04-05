package net.idt.learning;

import net.idt.learning.dao.UserDao;
import net.idt.learning.dto.Address;
import net.idt.learning.dto.Cart;
import net.idt.learning.dto.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = ForestryAccountingApplication.class)
public class UserTestCase {
	@Autowired
	private UserDao userDao;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Test
	public void testAddUser() {
		User user = new User();
		user.setFirstName("Filya");
		user.setLastName("Mark");
		user.setEmail("fm@gmail.com");
		user.setContactNumber("1234512345");
		user.setRole("USER");
		user.setEnabled(true);
		user.setPassword(passwordEncoder.encode("lol"));

		Address address = new Address();
		address.setAddressLineOne("Lithuanian Embassy");
		address.setAddressLineTwo("Uncle Ben's house");
		address.setCity("Minsk");
		address.setState("Minskaya");
		address.setCountry("Belarus");
		address.setPostalCode("222160");
		address.setBilling(true);
		
		// linked the address with the user
		address.setUserId(user.getId());

		Cart cart = new Cart();
		// linked the cart with the user
		cart.setUser(user);
		// link the user with the cart
		user.setCart(cart);
		// add the user
		assertTrue(userDao.addUser(user));
		// add the address
		assertTrue(userDao.addAddress(address));

				
		// add the shipping address
		address = new Address();
		address.setAddressLineOne("Sovetskaya, 47");
		address.setAddressLineTwo("Sovetskaya, 18");
		address.setCity("Zhodino");
		address.setState("Minskaya");
		address.setCountry("Belarus");
		address.setPostalCode("222163");
		address.setShipping(true);
		address.setUserId(user.getId());
		assertTrue(userDao.addAddress(address));
	}
}
