package com.imovie.bookingms.service;

import com.imovie.bookingms.dto.BookingDTO;
import com.imovie.bookingms.dto.PaymentDTO;
import com.imovie.bookingms.exception.BookingException;

import java.util.List;

public interface BookingService {
    String confirmBooking(Integer showId,List<Integer> seats,PaymentDTO details);

    BookingDTO getDetails(Integer BookingId) throws BookingException;
}
