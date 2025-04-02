package com.imovie.bookingms.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer bookingId;
    private String Name;
    private Integer showId;
    private String Seats;
    private Double amount;
    private LocalDateTime bookingTime;
}
