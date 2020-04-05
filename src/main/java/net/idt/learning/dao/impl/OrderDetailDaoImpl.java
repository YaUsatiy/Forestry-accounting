package net.idt.learning.dao.impl;

import net.idt.learning.dao.OrderDetailDao;
import net.idt.learning.dto.OrderDetail;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class OrderDetailDaoImpl implements OrderDetailDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public OrderDetail get(int id) {
        return sessionFactory.getCurrentSession().get(OrderDetail.class, id);
    }

    @Override
    public List<OrderDetail> list() {
        return sessionFactory.getCurrentSession().createQuery("From OrderDetail", OrderDetail.class).getResultList();
    }

    @Override
    public boolean add(OrderDetail orderDetail) {
        try {
            sessionFactory.getCurrentSession().persist(orderDetail);
            return true;
        }
        catch(Exception ex) {
            return false;
        }
    }

}
