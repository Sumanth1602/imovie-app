package com.imovie.seatms.entity;

import com.imovie.seatms.utility.Status;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "seatlist")
public class SeatList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer eachSeatId;
    private Integer seatNum;
    private Integer price;
    private String type;
    @Enumerated(EnumType.STRING)
    private Status status;

}
