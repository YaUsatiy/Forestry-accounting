package net.idt.learning;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
public class ForestryAccountingApplication {

    public static void main(String[] args) {
        SpringApplication.run(ForestryAccountingApplication.class, args);
    }

}
