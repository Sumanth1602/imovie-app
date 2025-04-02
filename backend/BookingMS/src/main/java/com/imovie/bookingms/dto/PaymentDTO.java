package com.imovie.bookingms.dto;

import com.imovie.bookingms.utility.CardType;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
    @NotNull
    private String name;
    private CardType cardType;
    private Double amount;
    @Min(value = 0000000000000000L)
    @Max(value = 9999999999999999L)
    private Long cardNum;
    private String expiry;
    private Integer cvv;
}
