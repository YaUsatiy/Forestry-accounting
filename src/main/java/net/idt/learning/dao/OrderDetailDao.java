package net.idt.learning.dao;

import net.idt.learning.dto.OrderDetail;

import java.util.List;

public interface OrderDetailDao {
    OrderDetail get(int id);
    List<OrderDetail> list();
    boolean add(OrderDetail orderDetail);
}
