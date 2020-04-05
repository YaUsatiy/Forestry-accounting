package net.idt.learning.dto;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "order_detail")
@Data
public class OrderDetail implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @Column(name = "order_total")
    private double orderTotal;
    @ManyToOne
    private Address shipping;
    @ManyToOne
    private Address billing;
    @OneToMany(mappedBy="orderDetail", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<OrderItem> orderItems = new ArrayList<>();
    @Column(name = "order_count")
    private int orderCount;
    @Column(name="order_date")
    private Date orderDate;
}