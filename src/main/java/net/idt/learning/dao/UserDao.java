package net.idt.learning.dao;

import net.idt.learning.dto.Address;
import net.idt.learning.dto.OrderDetail;
import net.idt.learning.dto.User;

import java.util.List;

public interface UserDao {
    boolean addUser(User user);
    boolean addAddress(Address address);
    boolean updateAddress(Address address);
    User getByEmail(String email);
    List<Address> listShippingAddresses(int userId);
    Address getBillingAddress(int userId);
    User get(int id);
    Address getAddress(int addressId);
    List<OrderDetail> getOrders(User user);
}
