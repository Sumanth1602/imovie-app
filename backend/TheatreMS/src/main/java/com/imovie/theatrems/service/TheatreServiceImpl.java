package com.imovie.theatrems.service;

import com.imovie.theatrems.dto.ShowsDTO;
import com.imovie.theatrems.dto.TheatreDTO;
import com.imovie.theatrems.entity.Shows;
import com.imovie.theatrems.entity.Theatre;
import com.imovie.theatrems.exception.TheatreException;
import com.imovie.theatrems.repository.TheatreRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service(value = "theatreService")
@Transactional
public class TheatreServiceImpl implements TheatreService {

    @Autowired
    TheatreRepository theatreRepository;

    ModelMapper modelMapper = new ModelMapper();

    @Override
    public List<TheatreDTO> getTheatreByMovieName(String movieName) {
        Iterable<Theatre> theatre = theatreRepository.findAll();
        List<TheatreDTO> theatreList = new ArrayList<>();
        theatre.forEach(obj->{
            List<Shows> temp = obj.getShows();
            List<ShowsDTO> showslist = new ArrayList<>();
            temp.forEach(s->{
                String mname = s.getMovieName();
                if(mname.equals(movieName)){
                    ShowsDTO showdto = modelMapper.map(s, ShowsDTO.class);
                    showslist.add(showdto);
                }
            });
            TheatreDTO theatredto = modelMapper.map(obj,TheatreDTO.class);
            theatredto.setShows(showslist);
            if(!showslist.isEmpty()){
                theatreList.add(theatredto);
            }
        });
        return theatreList;
    }

    @Override
    public Theatre getMovieByShowId(Integer theatreid) throws TheatreException {
        Theatre theatre =  theatreRepository.findById(theatreid)
                .orElseThrow(() -> new TheatreException("Service.NO_THEATRE_FOUND"));

        return theatre;

    }

}
