package com.imovie.moviems.repository;

import com.imovie.moviems.entity.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface MovieRepository extends JpaRepository<Movie, Integer> {
    Movie findByMovieName(String movieName);

}
