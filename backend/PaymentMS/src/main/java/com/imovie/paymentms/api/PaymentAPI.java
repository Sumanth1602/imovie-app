package com.imovie.paymentms.api;

import com.imovie.paymentms.dto.PaymentDTO;
import com.imovie.paymentms.entity.Payment;
import com.imovie.paymentms.exception.PaymentException;
import com.imovie.paymentms.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping(value = "/imovie")
public class PaymentAPI {
    @Autowired
    PaymentService paymentService;
    @PostMapping(value = "/payment/verifycc")
    public ResponseEntity<String> verifyingcc(@RequestBody PaymentDTO details) throws PaymentException {
        String msg = paymentService.verifycc(details);
        Map<String, String> response = new HashMap<>();
        response.put("status", msg);
        return new ResponseEntity<>(msg, HttpStatus.OK);
//        if("Card Verified".equals(msg))
//            return new ResponseEntity<>(response, HttpStatus.OK);
//        else
//            return new ResponseEntity<>(response,HttpStatus.UNPROCESSABLE_ENTITY);
    }
    @PostMapping(value = "/payment/verifydc")
    public ResponseEntity<String> verifyingdc(@RequestBody PaymentDTO details) throws PaymentException {
        String msg = paymentService.verifydc(details);
        Map<String, String> response = new HashMap<>();
        response.put("status", msg);
        return new ResponseEntity<>(msg, HttpStatus.OK);

//        if("Card Verified".equals(msg))
//            return new ResponseEntity<>(response, HttpStatus.OK);
//        else
//            return new ResponseEntity<>(response,HttpStatus.UNPROCESSABLE_ENTITY);
    }
}
