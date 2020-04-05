package net.idt.learning.dao;

import net.idt.learning.dto.Cart;
import net.idt.learning.dto.CartLine;

import java.util.List;

public interface CartLineDao {
    List<CartLine> list(int cartId);
    CartLine get(int id);
    boolean add(CartLine cartLine);
    boolean update(CartLine cartLine);
    boolean remove(CartLine cartLine);

    CartLine getByCartAndProduct(int cartId, int productId);
    boolean updateCart(Cart cart);
    List<CartLine> listAvailable(int cartId);
}
