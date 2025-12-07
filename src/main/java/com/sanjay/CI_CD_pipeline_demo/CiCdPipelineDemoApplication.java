package com.sanjay.CI_CD_pipeline_demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class CiCdPipelineDemoApplication {

    @GetMapping("/")
    public String home() {
        return "Hello from sanjay's Spring Boot !";
    }

	public static void main(String[] args) {
		SpringApplication.run(CiCdPipelineDemoApplication.class, args);
	}

}
