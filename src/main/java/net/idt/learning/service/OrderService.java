package net.idt.learning.service;

import net.idt.learning.dao.OrderDetailDao;
import net.idt.learning.dto.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderDetailDao orderDetailDao;

    public double getOrdersSum() {
        List<OrderDetail> orders = orderDetailDao.list();
        return orders.stream().mapToDouble(OrderDetail::getOrderTotal).sum();
    }
}
