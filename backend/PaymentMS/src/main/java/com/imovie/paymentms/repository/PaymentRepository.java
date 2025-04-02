package com.imovie.paymentms.repository;

import com.imovie.paymentms.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PaymentRepository extends JpaRepository<Payment, Integer> {


}
