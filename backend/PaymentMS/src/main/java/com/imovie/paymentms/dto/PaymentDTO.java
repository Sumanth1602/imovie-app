package com.imovie.paymentms.dto;

import com.imovie.paymentms.utility.CardType;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
    @NotNull
    private String name;
    private CardType cardType;
    @Min(value = 0000000000000000L)
    @Max(value = 9999999999999999L)
    private Long cardNum;
    private String expiry;
    private Integer cvv;
}
