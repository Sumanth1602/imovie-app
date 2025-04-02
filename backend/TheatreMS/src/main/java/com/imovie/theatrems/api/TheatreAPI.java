package com.imovie.theatrems.api;

import com.imovie.theatrems.dto.MovieDTO;
import com.imovie.theatrems.dto.TheatreDTO;
import com.imovie.theatrems.entity.Shows;
import com.imovie.theatrems.entity.Theatre;
import com.imovie.theatrems.exception.TheatreException;
import com.imovie.theatrems.service.TheatreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "/imovie")
public class TheatreAPI {
    @Autowired
    TheatreService theatreService;

    @Autowired
    WebClient.Builder wc;

    @GetMapping(value = "/theatre-list/{movieName}")
    public ResponseEntity<List<TheatreDTO>> getTheatreByMovieName(@PathVariable String movieName) throws TheatreException {
        List<TheatreDTO> theatreList = theatreService.getTheatreByMovieName(movieName);
        return new ResponseEntity<>(theatreList, HttpStatus.OK);
    }

    @GetMapping(value = "/theatre-list/{theatreId}/{showId}")
    public ResponseEntity<MovieDTO> getMovieByShowId(@PathVariable Integer theatreId, @PathVariable Integer showId) throws TheatreException{
        Theatre theatre = theatreService.getMovieByShowId(theatreId);
        String movieName = "";
        for (Shows show : theatre.getShows()) {
            if(showId.equals(show.getShowId())) {
                movieName = show.getMovieName();
                break;
            }
        }
        System.out.println(movieName);
        String url = "http://MovieMS/imovie/movie-list/{movieName}";
        MovieDTO movie = wc.build()
                .get()
                .uri(url, movieName)
                .retrieve()
                .bodyToMono(MovieDTO.class)
                .block();

        return new ResponseEntity<>(movie,HttpStatus.OK);
    }
}
