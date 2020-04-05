package net.idt.learning;

import net.idt.learning.dao.CartLineDao;
import net.idt.learning.dao.ProductDao;
import net.idt.learning.dao.UserDao;
import net.idt.learning.dto.Cart;
import net.idt.learning.dto.CartLine;
import net.idt.learning.dto.Product;
import net.idt.learning.dto.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@SpringBootTest(classes = ForestryAccountingApplication.class)
public class CartLineTestCase {
    @Autowired
    private CartLineDao cartLineDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private UserDao userDao;
    private CartLine cartLine = null;

    @Test
    public void testAddCartLine() {
        User user = userDao.getByEmail("bb@gmail.com");
        Cart cart = user.getCart();
        Product product = productDao.get(2);
        cartLine = new CartLine();
        cartLine.setCartId(cart.getId());
        cartLine.setProduct(product);
        cartLine.setProductCount(1);
        cartLine.setBuyingPrice(product.getUnitPrice());
        double oldTotal = cartLine.getTotal();
        cartLine.setTotal(product.getUnitPrice() * cartLine.getProductCount());
        cart.setCartLines(cart.getCartLines() + 1);
        cart.setGrandTotal(cart.getGrandTotal() + (cartLine.getTotal() - oldTotal));
        assertTrue(cartLineDao.add(cartLine));
        assertTrue(cartLineDao.updateCart(cart));
    }

    @Test
    public void testUpdateCartLine() {
        User user = userDao.getByEmail("bb@gmail.com");
        Cart cart = user.getCart();
        cartLine = cartLineDao.getByCartAndProduct(cart.getId(), 2);
        cartLine.setProductCount(cartLine.getProductCount() + 1);
        double oldTotal = cartLine.getTotal();
        cartLine.setTotal(cartLine.getProduct().getUnitPrice() * cartLine.getProductCount());
        cart.setGrandTotal(cart.getGrandTotal() + (cartLine.getTotal() - oldTotal));
        assertTrue(cartLineDao.update(cartLine));
    }
}
