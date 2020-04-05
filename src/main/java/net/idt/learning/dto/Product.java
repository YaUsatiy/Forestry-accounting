package net.idt.learning.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Data
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String code;
    @NotBlank(message = "Please enter the Product Name!")
    private String name;
    @JsonIgnore
    @NotBlank(message = "Please enter the Description for Product!")
    @Column(name="description", columnDefinition = "varchar(1000)")
    private String description;
    @Column(name = "unit_price")
    @Min(value = 1, message = "The price cannot be less than 1!")
    private double unitPrice;
    private int quantity;
    @Column(name = "is_active")
    private boolean active;
    @Column(name = "category_id")
    @JsonIgnore
    private int categoryId;
    @Column(name = "supplier_id")
    @JsonIgnore
    private int supplierId;
    private int purchases;
    private int views;

    @Column(name = "review_count", columnDefinition = "int default 0")
    private int reviewCount;

    @JsonIgnore
    @Column(name="rating", columnDefinition = "float(10) default 0.0")
    private double rating;

    @Transient
    private MultipartFile file;

    public Product() {
        this.code = "PRD" + UUID.randomUUID().toString().substring(26).toUpperCase();
    }
}
