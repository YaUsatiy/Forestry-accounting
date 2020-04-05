package net.idt.learning.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Table(name = "logger")
@Data
public class Logger implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank(message = "Please enter the name of logger!")
    private String name;
    @NotBlank(message = "Please enter the company of logger!")
    private String company;
    @NotBlank(message = "Please enter the description of logger!")
    private String description;
    private String code;
    private int views;
    @Column(name = "birth_city")
    @NotBlank(message = "Please enter the logger's place of birth!")
    private String birthCity;
    @Column(name = "birth_year")
    @Min(value = 1940, message = "The logger's year of birth cannot be less than 1940!")
    @Max(value = 2001, message = "The logger's year of birth cannot be more than 2001!")
    private int birthYear;
    @Min(value = 1, message = "The logger's year of seniority cannot be less than 1 year!")
    private int seniority;
    @Column(name = "marital_status")
    @NotBlank(message = "Please enter the logger's marital status!")
    private String maritalStatus;
    @Transient
    private MultipartFile file;

    public Logger() {
        this.code = "LOG" + UUID.randomUUID().toString().substring(26).toUpperCase();
    }
}
