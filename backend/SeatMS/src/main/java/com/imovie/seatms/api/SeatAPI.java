package com.imovie.seatms.api;

import com.imovie.seatms.entity.SeatList;
import com.imovie.seatms.exception.SeatException;
import com.imovie.seatms.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "/imovie")
public class SeatAPI {
    @Autowired
    SeatService seatService;
    @GetMapping(value = "/seat-list/availableSeats/{showId}")
    public ResponseEntity<List<Integer>> getAvailableSeat(@PathVariable Integer showId) throws SeatException {
        List<Integer> availableSeats = seatService.allAvailableSeats(showId);
        System.out.println();
        return new ResponseEntity<>(availableSeats, HttpStatus.OK);
    }
    @GetMapping(value = "/seat-list/bookedSeats/{showId}")
    public ResponseEntity<List<Integer>> getBookedSeat(@PathVariable Integer showId) throws SeatException {
        List<Integer> BookedSeats = seatService.allBookedSeats(showId);
        return new ResponseEntity<>(BookedSeats, HttpStatus.OK);
    }
    @GetMapping(value = "/seat-list/allSeats/{showId}")
    public ResponseEntity<List<SeatList>> getAllSeats(@PathVariable Integer showId) throws SeatException {
        List<SeatList> allseats = seatService.getSeats(showId);
        return new ResponseEntity<>(allseats, HttpStatus.OK);
    }

    @PutMapping(value = "/seat-list/bookSeat/{showId}/{seatNum}")
    public ResponseEntity<String> bookedSeat(@PathVariable Integer showId, @PathVariable Integer seatNum){
        String msg = seatService.bookSeat(showId,seatNum);
        return new ResponseEntity<>(msg,HttpStatus.OK);
    }

}
