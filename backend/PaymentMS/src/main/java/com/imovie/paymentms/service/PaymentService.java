package com.imovie.paymentms.service;

import com.imovie.paymentms.dto.PaymentDTO;
import com.imovie.paymentms.entity.Payment;

public interface PaymentService {
    String verifycc(PaymentDTO ccdetails);
    String verifydc(PaymentDTO dcdetails);
}
