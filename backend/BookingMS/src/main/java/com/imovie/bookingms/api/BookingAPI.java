package com.imovie.bookingms.api;

import com.imovie.bookingms.dto.BookingDTO;
import com.imovie.bookingms.dto.PaymentDTO;
import com.imovie.bookingms.entity.Booking;
import com.imovie.bookingms.entity.Payment;
import com.imovie.bookingms.exception.BookingException;
import com.imovie.bookingms.service.BookingService;
import com.imovie.bookingms.utility.CardType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping(value = "/imovie")
public class BookingAPI {

    @Autowired
    WebClient.Builder webClient;

    @Autowired
    BookingService bookingService;

    @PostMapping(value = "/booking/bookingConfirm", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, String>> bookingconfirm(
            @RequestParam Integer showId,
            @RequestParam List<Integer> seats,
            @RequestBody PaymentDTO details) {

        String finalMsg = "";
        Map<String, String> response = new HashMap<>();

        if (details.getCardType().equals(CardType.Credit)) {
            System.out.println("Credit card");
            String verificationResponse = webClient.build()
                    .post()
                    .uri("http://PaymentMS/imovie/payment/verifycc")
                    .bodyValue(details)
                    .retrieve()
                    .bodyToMono(String.class)
                    .block();

            if (verificationResponse.equals("Card Verified")) {
                seats.forEach(seatNum -> {
                    String bookingMsg = webClient.build()
                            .put()
                            .uri("http://SeatMS/imovie/seat-list/bookSeat/" + showId + "/" + seatNum)
                            .retrieve()
                            .bodyToMono(String.class)
                            .block();
                });
                finalMsg = "Ticket booked successfully";
            } else {
                finalMsg = "Card Not Verified";
            }
        } else {
            System.out.println("Debit card");
            String verificationResponse = webClient.build()
                    .post()
                    .uri("http://PaymentMS/imovie/payment/verifydc")
                    .bodyValue(details)
                    .retrieve()
                    .bodyToMono(String.class)
                    .block();

            if (verificationResponse.equals("Card Verified")) {
                seats.forEach(seatNum -> {
                    String bookingMsg = webClient.build()
                            .put()
                            .uri("http://SeatMS/imovie/seat-list/bookSeat/" + showId + "/" + seatNum)
                            .retrieve()
                            .bodyToMono(String.class)
                            .block();
                });
                finalMsg = "Ticket booked successfully";
            } else {
                finalMsg = "Card Not Verified";
            }
        }

        String msg = bookingService.confirmBooking(showId,seats,details);
        response.put("message", finalMsg);
        response.put("id",msg);
        return new ResponseEntity<>(response,HttpStatus.CREATED);
    }
    @GetMapping(value =  "/booking/bookingdetails/{bookingId}")
    public  ResponseEntity<BookingDTO> getDetailsofBooking(@PathVariable Integer bookingId) throws BookingException {
        BookingDTO bookingdto = bookingService.getDetails(bookingId);
        return new ResponseEntity<>(bookingdto,HttpStatus.OK);
    }


}
