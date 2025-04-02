package com.imovie.bookingms.repository;

import com.imovie.bookingms.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface BookingRepository extends JpaRepository<Booking, Integer> {

}
