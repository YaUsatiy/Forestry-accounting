package net.idt.learning.dao.impl;

import net.idt.learning.dao.ProductDao;
import net.idt.learning.dto.Product;
import net.idt.learning.dto.Review;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Product get(int id) {
        return sessionFactory.getCurrentSession().get(Product.class, id);
    }

    @Override
    public List<Product> list() {
        return sessionFactory.getCurrentSession().createQuery("From Product", Product.class).getResultList();
    }

    @Override
    public boolean add(Product product) {
        try {
            sessionFactory.getCurrentSession().persist(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Product product) {
        try {
            sessionFactory.getCurrentSession().update(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(Product product) {
        try {
            product.setActive(false);
            return this.update(product);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Product> listActiveProducts() {
        String selectActiveProducts = "FROM Product WHERE active = :active";
        return sessionFactory
                .getCurrentSession()
                .createQuery(selectActiveProducts, Product.class)
                .setParameter("active", true)
                .getResultList();
    }

    @Override
    public List<Product> listActiveProductsByCategory(int categoryId) {
        String selectActiveProductsByCategory = "FROM Product WHERE active = :active AND categoryId = :categoryId";
        return sessionFactory
                .getCurrentSession()
                .createQuery(selectActiveProductsByCategory, Product.class)
                .setParameter("active", true)
                .setParameter("categoryId",categoryId)
                .getResultList();

    }

    @Override
    public List<Product> getLatestActiveProducts(int count) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Product WHERE active = :active ORDER BY id", Product.class)
                .setParameter("active", true)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }

    @Override
    public List<Product> getMostViewedProducts(int count) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Product WHERE active = :active ORDER BY views DESC", Product.class)
                .setParameter("active", true)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }

    @Override
    public List<Product> getMostPurchasedProducts(int count) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Product WHERE active = :active ORDER BY purchases DESC", Product.class)
                .setParameter("active", true)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }

    @Override
    public List<Review> getProductReviews(Product product) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Review WHERE product = :product", Review.class)
                .setParameter("product", product)
                .getResultList();
    }

    @Override
    public List<Product> getTopViewedProducts(int id, int count) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("FROM Product WHERE active = :active AND id <> :id ORDER BY views DESC", Product.class)
                .setParameter("active", true)
                .setParameter("id", id)
                .setFirstResult(0)
                .setMaxResults(count)
                .getResultList();
    }
}