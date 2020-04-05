package net.idt.learning.dto;

import lombok.Data;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
public class Review implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @NotBlank(message = "Please enter your comment about selected product!")
    private String comment;

    @Min(value = 0, message = "The rating cannot be less than 0!")
    @Max(value = 5, message = "The rating cannot be more than 5!")
    private int rating;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name="review_date")
    private Date reviewDate;
}
