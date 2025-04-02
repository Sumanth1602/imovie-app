package com.imovie.paymentms.service;

import com.imovie.paymentms.dto.PaymentDTO;
import com.imovie.paymentms.entity.Payment;
import com.imovie.paymentms.repository.PaymentRepository;
import com.imovie.paymentms.utility.CardType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service(value = "paymentService")
@Transactional
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    PaymentRepository paymentRepository;
    @Override
    public String verifycc(PaymentDTO ccdetails) {
        Iterable<Payment> allcc = paymentRepository.findAll();
        String msg = "";

        for(Payment obj : allcc) {
            if (obj.getCardType().equals(CardType.Credit)) {
                if(obj.getName().equals(ccdetails.getName()) && obj.getCardNum().equals(ccdetails.getCardNum()) && obj.getExpiry().equals(ccdetails.getExpiry()) && obj.getCvv().equals(ccdetails.getCvv())){
                    msg = "Card Verified";
                    break;
                } else {
                    msg = "Card Not Verified";
                }
            }
        }
            return  msg;
    }
    @Override
    public String verifydc(PaymentDTO dcdetails) {
        Iterable<Payment> alldc = paymentRepository.findAll();
        String msg = "";
        for(Payment obj : alldc) {
            if(obj.getCardType().equals(CardType.Debit)){
                if(obj.getName().equals(dcdetails.getName()) && obj.getCardNum().equals(dcdetails.getCardNum()) && obj.getExpiry().equals(dcdetails.getExpiry()) && obj.getCvv().equals(dcdetails.getCvv())){
                    msg = "Card Verified";
                    break;
                } else {
                    msg = "Card Not Verified";
                }
            }
        }
        return  msg;
    }
}
