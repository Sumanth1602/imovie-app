package com.imovie.theatrems.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieDTO {

    private Integer movieId;

    @NotNull(message = "{movie.moviename.notpresent}")
    @Size(min = 1, max = 255, message = "{movie.moviename.size}")
    private String movieName;

    @NotNull(message = "{movie.imgurl.notpresent}")
    private String imgUrl;

    @NotNull(message = "{movie.releasedate.notpresent}")
    @PastOrPresent(message = "{movie.releasedate.pastorpresent}")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate releaseDate;

    @NotNull(message = "{movie.genre.notpresent}")
    @Size(min = 1, message = "{movie.genre.notempty}")
    private List<String> genre;

    @NotNull(message = "{movie.language.notpresent}")
    @Size(min = 1, message = "{movie.language.notempty}")
    private List<String> languages;

    @NotNull(message = "{movie.rating.notpresent}")
    @Min(value = 0, message = "{movie.rating.min}")
    @Max(value = 5, message = "{movie.rating.max}")
    private Double rating;

    @NotNull(message = "{movie.censorrating.notpresent}")
    private String censorRating;

    @NotNull(message = "{movie.description.notpresent}")
    @Size(max = 255, message = "{movie.description.size}")
    private String description;
}