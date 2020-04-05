package net.idt.learning.dao;

import net.idt.learning.dto.Product;
import net.idt.learning.dto.Review;

import java.util.List;

public interface ProductDao {
    Product get(int id);
    List<Product> list();
    boolean add(Product product);
    boolean update(Product product);
    boolean delete(Product product);

    List<Product> listActiveProducts();
    List<Product> listActiveProductsByCategory(int categoryId);
    List<Product> getLatestActiveProducts(int count);
    List<Product> getMostViewedProducts(int count);
    List<Product> getMostPurchasedProducts(int count);
    List<Review> getProductReviews(Product product);
    List<Product> getTopViewedProducts(int id, int count);
}
