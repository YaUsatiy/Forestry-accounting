package net.idt.learning.dto;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Entity
@Table(name = "user_detail")
@Data
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank(message = "Please enter first name!")
    @Column(name = "first_name")
    private String firstName;
    @NotBlank(message = "Please enter last name!")
    @Column(name = "last_name")
    private String lastName;
    @NotBlank(message = "Please enter email address!")
    private String email;
    @NotBlank(message = "Please enter contact number!")
    @Column(name = "contact_number")
    private String contactNumber;
    private String role;
    @NotBlank(message = "Please enter password!")
    private String password;
    private boolean enabled = true;
    @Transient
    private String confirmPassword;
    @OneToOne(mappedBy="user", cascade = CascadeType.ALL)
    private Cart cart;
}
