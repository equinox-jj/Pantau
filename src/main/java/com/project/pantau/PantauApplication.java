package com.project.pantau;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class PantauApplication {

    public static void main(String[] args) {
        SpringApplication.run(PantauApplication.class, args);
    }

}
