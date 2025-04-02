package com.imovie.theatrems.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

@Table(name = "theatre")
public class Theatre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer theatreId;
    private String theatreName;
    private String theatreLocation;
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="theatreId")
    private List<Shows> shows;

}
