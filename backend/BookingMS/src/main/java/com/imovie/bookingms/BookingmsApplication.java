package com.imovie.bookingms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.reactive.function.client.WebClient;

@SpringBootApplication
public class BookingmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookingmsApplication.class, args);
	}

	@Bean @LoadBalanced
	public WebClient.Builder loadWebClientBuilder(){
		return WebClient.builder();
	}
}
