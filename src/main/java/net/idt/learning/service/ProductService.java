package net.idt.learning.service;

import net.idt.learning.dao.ProductDao;
import net.idt.learning.dto.Product;
import net.idt.learning.dto.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.OptionalDouble;

@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;
    private static final int DECIMAL_PLACES_KOEFFICIENT = 10;

    public void updateRatingAdd(Product product) {
        List<Review> reviews = productDao.getProductReviews(product);
        OptionalDouble rating = reviews.stream().mapToInt(Review::getRating).average();
        product.setRating(Math.round(rating.getAsDouble() * DECIMAL_PLACES_KOEFFICIENT) / DECIMAL_PLACES_KOEFFICIENT);
        product.setReviewCount(product.getReviewCount() + 1);
        productDao.update(product);
    }

    public void updateRatingDelete(Product product) {
        List<Review> reviews = productDao.getProductReviews(product);
        OptionalDouble rating = reviews.stream().mapToInt(Review::getRating).average();
        product.setRating(Math.round(rating.getAsDouble() * DECIMAL_PLACES_KOEFFICIENT) / DECIMAL_PLACES_KOEFFICIENT);
        product.setReviewCount(product.getReviewCount() - 1);
        productDao.update(product);
    }
}
