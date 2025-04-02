package com.imovie.seatms.service;

import com.imovie.seatms.entity.SeatList;

import java.util.List;

public interface SeatService {
    List<Integer> allAvailableSeats(Integer showId);
    List<Integer> allBookedSeats(Integer showId);

    String bookSeat(Integer showId, Integer seatNum);
    List<SeatList> getSeats(Integer showId);
}
