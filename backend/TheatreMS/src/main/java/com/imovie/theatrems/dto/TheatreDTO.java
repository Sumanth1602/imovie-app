package com.imovie.theatrems.dto;

import com.imovie.theatrems.entity.Shows;
import jakarta.persistence.CascadeType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TheatreDTO {

    private String theatreId;
    private String theatreName;
    private String theatreLocation;
    private List<ShowsDTO> shows;
}
