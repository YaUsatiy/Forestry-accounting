package net.idt.learning.model;

import net.idt.learning.dto.Cart;

import java.io.Serializable;

public class UserModel implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String fullName;
    private String email;
    private String role;
    private Cart cart;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
    public Cart getCart() {
        return cart;
    }
    public void setCart(Cart cart) {
        this.cart = cart;
    }
    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("UserModel [id=");
        builder.append(id);
        builder.append(", fullName=");
        builder.append(fullName);
        builder.append(", email=");
        builder.append(email);
        builder.append(", role=");
        builder.append(role);
        builder.append(", cart=");
        builder.append(cart);
        builder.append("]");
        return builder.toString();
    }
}
