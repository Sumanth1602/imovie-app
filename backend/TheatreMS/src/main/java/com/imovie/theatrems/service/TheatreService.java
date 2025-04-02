package com.imovie.theatrems.service;

import com.imovie.theatrems.dto.TheatreDTO;
import com.imovie.theatrems.entity.Theatre;
import com.imovie.theatrems.exception.TheatreException;

import java.util.List;

public interface TheatreService {
    List<TheatreDTO> getTheatreByMovieName(String movieName);

    Theatre getMovieByShowId(Integer theatreId) throws TheatreException;
}
