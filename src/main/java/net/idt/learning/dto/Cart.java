package net.idt.learning.dto;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "grand_total")
    private double grandTotal;
    @Column(name = "cart_lines")
    private int cartLines;
    @OneToOne
    private User user;
}
