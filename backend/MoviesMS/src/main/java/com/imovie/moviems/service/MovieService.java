package com.imovie.moviems.service;

import com.imovie.moviems.dto.MovieDTO;
import com.imovie.moviems.exception.MovieException;

import java.util.List;

public interface MovieService {

	List<MovieDTO> getAllMovieDetails() throws MovieException;

	MovieDTO getMovie(String movieName) throws MovieException;

	MovieDTO getMovieNameById(Integer movieId) throws MovieException;

	List<MovieDTO> searchMovies(String query, Double minRating, String genre, String language) throws MovieException;

	MovieDTO rateMovie(Integer movieId, double rating) throws MovieException;
}
