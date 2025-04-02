package com.imovie.moviems.service;

import com.imovie.moviems.dto.MovieDTO;
import com.imovie.moviems.entity.Movie;
import com.imovie.moviems.exception.MovieException;
import com.imovie.moviems.repository.MovieRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service(value = "movieService")
@Transactional
public class MovieServiceImpl implements MovieService{

    @Autowired
    MovieRepository movieRepository;
    ModelMapper modelMapper = new ModelMapper();
    @Override
    public List<MovieDTO> getAllMovieDetails() throws MovieException {
        Iterable<Movie> movieList = movieRepository.findAll();
        List<MovieDTO> movieDTOList = new ArrayList<>();
        for(Movie movie : movieList){

            MovieDTO movieDTO = modelMapper.map(movie,MovieDTO.class);
            movieDTOList.add(movieDTO);
        }
        if(movieDTOList.isEmpty()) throw  new MovieException("Service.NO_MOVIES_FOUND");
        return movieDTOList;
    }

    @Override
    public MovieDTO getMovie(String movieName) throws MovieException {
        Movie mov = movieRepository.findByMovieName(movieName);
        if (mov == null) {
            throw  new MovieException("Service.NO_MOVIES_FOUND");
        }

        return modelMapper.map(mov,MovieDTO.class);

    }

    @Override
    public MovieDTO getMovieNameById(Integer movieId) throws MovieException {
        Movie movie = movieRepository.findById(movieId)
                .orElseThrow(() -> new MovieException("Service.MOVIE_NOT_FOUND"));
        return modelMapper.map(movie, MovieDTO.class);
    }

    @Override
    public List<MovieDTO> searchMovies(String query, Double minRating, String genre, String language) throws MovieException {
        List<Movie> allMovies = movieRepository.findAll();
        List<MovieDTO> searchResults = allMovies.stream()
                .filter(movie -> matchesSearchCriteria(movie, query, minRating, genre, language))
                .map(movie -> modelMapper.map(movie, MovieDTO.class))
                .toList();

        if (searchResults.isEmpty()) {
            throw new MovieException("Service.NO_MOVIES_FOUND");
        }

        return searchResults;
    }

    private boolean matchesSearchCriteria(Movie movie, String query, Double minRating, String genre, String language) {
        boolean matchesQuery = query == null || movie.getMovieName().toLowerCase().contains(query.toLowerCase());
        boolean matchesRating = minRating == null || movie.getRating() >= minRating;
        boolean matchesGenre = genre == null || movie.getGenre().contains(genre);
        boolean matchesLanguage = language == null || movie.getLanguages().contains(language);

        return matchesQuery && matchesRating && matchesGenre && matchesLanguage;
    }

    public MovieDTO rateMovie(Integer movieId, double rating) throws MovieException {
        Movie movie = movieRepository.findById(movieId)
                .orElseThrow(() -> new MovieException("Service.INVALID_MOVIE_ID"));

        movie.setRating((movie.getRating() + rating) / 2);
        Movie updatedMovie = movieRepository.save(movie);
        return modelMapper.map(updatedMovie, MovieDTO.class);
    }
}
