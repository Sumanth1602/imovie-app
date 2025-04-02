package com.imovie.seatms.service;

import com.imovie.seatms.repository.SeatRepository;
import com.imovie.seatms.entity.Seat;
import com.imovie.seatms.entity.SeatList;
import com.imovie.seatms.utility.Status;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

@Service(value = "seatservice")
@Transactional
public class SeatServiceImpl implements SeatService {

    @Autowired
    SeatRepository seatRepository;

    ModelMapper modelMapper = new ModelMapper();


    @Override
    public List<Integer> allAvailableSeats(Integer showId) {
        Iterable<Seat> s = seatRepository.findAll();
        List<Integer> availableSeats = new ArrayList<>();

        s.forEach(obj -> {
            if (showId.equals(obj.getShowId())) {
                List<SeatList> newlist = obj.getSeatList();
                if (newlist != null) {
                    newlist.forEach(itr -> {
                        if (itr.getStatus().equals(Status.AVAILABLE)) {
                            availableSeats.add(itr.getSeatNum());
                        }
                    });
                }
            }
        });

        return availableSeats;
    }


    @Override
    public List<Integer> allBookedSeats(Integer showId) {
        Iterable<Seat> s = seatRepository.findAll();
        List<Integer> bookedSeats = new ArrayList<>();
        s.forEach(obj->{
            if(showId.equals(obj.getShowId())){
                List<SeatList> newlist = obj.getSeatList();
                newlist.forEach(itr->{
                    if(itr.getStatus().equals(Status.BOOKED)){
                        bookedSeats.add(itr.getSeatNum());
                    }
                });

            }
        });

        return bookedSeats;
    }

    @Override
    public String bookSeat(Integer showId, Integer seatNum) {
        Iterable<Seat> s = seatRepository.findAll();
        final String[] msg = {""};
        s.forEach(obj->{
            if(showId.equals(obj.getShowId())){
                List<SeatList> newlist = obj.getSeatList();
                newlist.forEach(itr->{
                    if(itr.getSeatNum().equals(seatNum)){
                        if(itr.getStatus().equals(Status.BOOKED)){
                            msg[0] = "already booked";
                        }
                        else{
                            itr.setStatus(Status.BOOKED);
                            msg[0] = "booked successfully";
                        }
                    }
                });

            }
        });
        return msg[0];
    }

    @Override
    public List<SeatList> getSeats(Integer showId) {
        Iterable<Seat> s = seatRepository.findAll();
        AtomicReference<List<SeatList>> allSeats = new AtomicReference<>(new ArrayList<>());
        s.forEach(obj->{
            if(showId.equals(obj.getShowId())){
                List<SeatList> newlist = obj.getSeatList();
                allSeats.set(newlist);
            }
        });
        return allSeats.get();
    }
}
