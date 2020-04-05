package net.idt.learning.dao;

import net.idt.learning.dto.Product;
import net.idt.learning.dto.Review;
import net.idt.learning.dto.User;

import java.util.List;

public interface ReviewDao {
    Review get(int id);
    List<Review> list();
    boolean add(Review review);
    boolean delete(Review review);

    List<Review> listByProduct(Product product);
    List<Review> listByUser(User user);
}
