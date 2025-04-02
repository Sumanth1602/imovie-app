package com.imovie.seatms.dto;

import com.imovie.seatms.entity.SeatList;
import jakarta.persistence.CascadeType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeatDTO {
    private Integer seatId;
    private Integer showId;
    private List<SeatListDTO> seatList;
}
