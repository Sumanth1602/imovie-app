package com.imovie.bookingms.service;

import com.imovie.bookingms.dto.BookingDTO;
import com.imovie.bookingms.dto.PaymentDTO;
import com.imovie.bookingms.entity.Booking;
import com.imovie.bookingms.exception.BookingException;
import com.imovie.bookingms.repository.BookingRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.reactive.function.client.WebClient;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service(value = "theatreService")
@Transactional
public class BookingServiceImpl implements BookingService {

    @Autowired
    BookingRepository bookingRepository;

    ModelMapper modelMapper = new ModelMapper();
    @Override
    public String confirmBooking(Integer showId,List<Integer> seats,PaymentDTO details) {
        BookingDTO bookingdto = new BookingDTO();
        bookingdto.setShowId(showId);
        bookingdto.setBookingTime(LocalDateTime.now());
        String allSeats= seats.stream().map(String :: valueOf).collect(Collectors.joining(","));
        bookingdto.setSeats(allSeats);
        bookingdto.setAmount(details.getAmount());
        bookingdto.setName(details.getName());
        Booking booking = modelMapper.map(bookingdto, Booking.class);

        String msg = String.valueOf(bookingRepository.save(booking).getBookingId());
        return msg;
    }

    @Override
    public BookingDTO getDetails(Integer BookingId) throws BookingException {
        Booking booking = bookingRepository.findById(BookingId)
                .orElseThrow(()-> new  BookingException("SERVICE.NO_BOOKING_FOUND"));


        BookingDTO bookingdto = modelMapper.map(booking, BookingDTO.class);
        return bookingdto;
    }
}
