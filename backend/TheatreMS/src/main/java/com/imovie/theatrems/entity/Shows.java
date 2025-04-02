package com.imovie.theatrems.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;



@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "shows")
public class Shows {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer showId;
    private String movieName;
    private LocalDateTime timings;
    private Integer seatId;

}
