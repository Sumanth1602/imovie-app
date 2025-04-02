package com.imovie.moviems.api;

import com.imovie.moviems.dto.MovieDTO;
import com.imovie.moviems.exception.MovieException;
import com.imovie.moviems.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "/imovie")
public class MovieAPI {
    @Autowired
    private MovieService movieService;
    @GetMapping(value = "/movie-list")
    public ResponseEntity<List<MovieDTO>> getAllMovieDetails() throws MovieException {
        List<MovieDTO> movieList = movieService.getAllMovieDetails();
        return new ResponseEntity<>(movieList, HttpStatus.OK);
    }
    @GetMapping(value = "/movie-list/{movieName}")
    public ResponseEntity<MovieDTO> getMovie(@PathVariable String movieName) throws MovieException {
        MovieDTO movie = movieService.getMovie(movieName);
        return new ResponseEntity<>(movie, HttpStatus.OK);
    }

    @GetMapping(value = "/movie-list/movie/{movieId}")
    public ResponseEntity<MovieDTO> getMovieNameById(@PathVariable Integer movieId) throws MovieException{
        MovieDTO movieName = movieService.getMovieNameById(movieId);
        return new ResponseEntity<>(movieName,HttpStatus.OK);
    }

    @GetMapping(value = "/movie-list/search")
    public ResponseEntity<List<MovieDTO>> searchMovies(
            @RequestParam(required = false) String query,
            @RequestParam(required = false) Double minRating,
            @RequestParam(required = false) String genre,
            @RequestParam(required = false) String language) throws MovieException {

        List<MovieDTO> searchResults = movieService.searchMovies(query, minRating, genre, language);
        return new ResponseEntity<>(searchResults, HttpStatus.OK);
    }

    @PutMapping("/movie-list/{movieId}/rate")
    public ResponseEntity<MovieDTO> rateMovie(
            @PathVariable Integer movieId,
            @RequestParam("rating") double rating) throws MovieException {
        MovieDTO updatedMovie = movieService.rateMovie(movieId, rating);
        return new ResponseEntity<>(updatedMovie, HttpStatus.OK);
    }
}
