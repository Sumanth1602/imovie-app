package com.imovie.theatrems.repository;

import com.imovie.theatrems.entity.Theatre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;


public interface TheatreRepository extends JpaRepository<Theatre, Integer> {


}
