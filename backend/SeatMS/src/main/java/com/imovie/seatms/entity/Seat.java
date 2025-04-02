package com.imovie.seatms.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

@Table(name = "seat")
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer seatId;
    private Integer showId;
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="seatId")
    private List<SeatList> seatList;

}
