package com.imovie.theatrems.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowsDTO {
    private Integer showId;
    private String movieName;
    private LocalDateTime timings;
    private Integer seatId;
}
