package com.imovie.seatms.dto;

import com.imovie.seatms.utility.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SeatListDTO {
    private Integer eachSeatId;
    private Integer seatNum;
    private Integer price;
    private String type;
    private Status status;

}
