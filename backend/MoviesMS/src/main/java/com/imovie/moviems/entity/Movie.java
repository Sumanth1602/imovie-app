package com.imovie.moviems.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "movie")
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "movie_id")
    private Integer movieId;

    @Column(name = "movie_name", nullable = false)
    private String movieName;

    @Column(name = "img_url")
    private String imgUrl;

    @Column(name = "release_date")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate releaseDate;

    @Column(name = "rating")
    private Double rating;

    @Column(name = "censor_rating")
    private String censorRating;

    @Column(name = "description")
    private String description;

    @Column(name = "genre", columnDefinition = "json")
    private String genreJson;

    @Column(name = "languages", columnDefinition = "json")
    private String languagesJson;

    @Transient
    private List<String> genre;

    @Transient
    private List<String> languages;

    private static final ObjectMapper objectMapper = new ObjectMapper();

    public List<String> getGenre() {
        if (genre == null && genreJson != null) {
            try {
                genre = objectMapper.readValue(genreJson, new TypeReference<List<String>>() {});
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return genre;
    }

    public void setGenre(List<String> genre) {
        this.genre = genre;
        try {
            this.genreJson = objectMapper.writeValueAsString(genre);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<String> getLanguages() {
        if (languages == null && languagesJson != null) {
            try {
                languages = objectMapper.readValue(languagesJson, new TypeReference<List<String>>() {});
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return languages;
    }

    public void setLanguages(List<String> languages) {
        this.languages = languages;
        try {
            this.languagesJson = objectMapper.writeValueAsString(languages);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
