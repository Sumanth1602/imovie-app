package com.imovie.paymentms;

import com.imovie.paymentms.dto.PaymentDTO;
import com.imovie.paymentms.entity.Payment;
import com.imovie.paymentms.exception.PaymentException;
import com.imovie.paymentms.repository.PaymentRepository;
import com.imovie.paymentms.service.PaymentService;
import com.imovie.paymentms.service.PaymentServiceImpl;
import com.imovie.paymentms.utility.CardType;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

@SpringBootTest
class PaymentmsApplicationTests {

	@Mock
	PaymentRepository paymentRepository;
	@InjectMocks
	PaymentService paymentService =  new PaymentServiceImpl();

	@Test
	void nameTest() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("Aman kumar");
		paymentdto.setCardType(CardType.Debit);
		paymentdto.setCardNum(8765432187654321L);
		paymentdto.setExpiry("11/24");
		paymentdto.setCvv(406);
		Payment payment = new Payment();
		payment.setName("Aman Smith");
		payment.setCardType(CardType.Debit);
		payment.setCardNum(8765432187654321L);
		payment.setExpiry("11/24");
		payment.setCvv(406);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifydc(paymentdto);
		Assertions.assertEquals("Card Not Verified", actual);
	}

	@Test
	void nameTest2() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("Sumant Smith");
		paymentdto.setCardType(CardType.Debit);
		paymentdto.setCardNum(8765432187654321L);
		paymentdto.setExpiry("11/24");
		paymentdto.setCvv(406);
		Payment payment = new Payment();
		payment.setName("Aman Smith");
		payment.setCardType(CardType.Debit);
		payment.setCardNum(8765432187654321L);
		payment.setExpiry("11/24");
		payment.setCvv(406);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifydc(paymentdto);
		Assertions.assertEquals("Card Not Verified", actual);
	}
	@Test
	void nameTest3() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("Aman Kumar");
		paymentdto.setCardType(CardType.Credit);
		paymentdto.setCardNum(1234567812345678L);
		paymentdto.setExpiry("12/25");
		paymentdto.setCvv(123);
		Payment payment = new Payment();
		payment.setName("John Doe");
		payment.setCardType(CardType.Credit);
		payment.setCardNum(1234567812345678L);
		payment.setExpiry("12/25");
		payment.setCvv(123);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifycc(paymentdto);
		Assertions.assertEquals("Card Not Verified", actual);
	}
	@Test
	void cardNumTest1() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("Aman Smith");
		paymentdto.setCardType(CardType.Debit);
		paymentdto.setCardNum(9765432187654321L);
		paymentdto.setExpiry("11/24");
		paymentdto.setCvv(406);
		Payment payment = new Payment();
		payment.setName("Aman Smith");
		payment.setCardType(CardType.Debit);
		payment.setCardNum(8765432187654321L);
		payment.setExpiry("11/24");
		payment.setCvv(406);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifydc(paymentdto);
		Assertions.assertEquals("Card Not Verified", actual);
	}
	@Test
	void cardNumTest2() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("Aman Smith");
		paymentdto.setCardType(CardType.Debit);
		paymentdto.setCardNum(8765432187654321L);
		paymentdto.setExpiry("11/24");
		paymentdto.setCvv(406);
		Payment payment = new Payment();
		payment.setName("Aman Smith");
		payment.setCardType(CardType.Debit);
		payment.setCardNum(8765432187654321L);
		payment.setExpiry("11/24");
		payment.setCvv(406);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifydc(paymentdto);
		Assertions.assertEquals("Card Verified", actual);
	}
	@Test
	void cardNumTest3() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("John Doe");
		paymentdto.setCardType(CardType.Credit);
		paymentdto.setCardNum(1234567812345678L);
		paymentdto.setExpiry("12/25");
		paymentdto.setCvv(123);
		Payment payment = new Payment();
		payment.setName("John Doe");
		payment.setCardType(CardType.Credit);
		payment.setCardNum(1234567812345678L);
		payment.setExpiry("12/25");
		payment.setCvv(123);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifycc(paymentdto);
		Assertions.assertEquals("Card Verified", actual);
	}
	@Test
	void cardCvvTest1() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("John Doe");
		paymentdto.setCardType(CardType.Credit);
		paymentdto.setCardNum(1234567812345678L);
		paymentdto.setExpiry("12/25");
		paymentdto.setCvv(321);
		Payment payment = new Payment();
		payment.setName("John Doe");
		payment.setCardType(CardType.Credit);
		payment.setCardNum(1234567812345678L);
		payment.setExpiry("12/25");
		payment.setCvv(123);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifycc(paymentdto);
		Assertions.assertEquals("Card Not Verified", actual);
	}
	@Test
	void cardExpiryTest1() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("John Doe");
		paymentdto.setCardType(CardType.Credit);
		paymentdto.setCardNum(1234567812345678L);
		paymentdto.setExpiry("12/26");
		paymentdto.setCvv(123);
		Payment payment = new Payment();
		payment.setName("John Doe");
		payment.setCardType(CardType.Credit);
		payment.setCardNum(1234567812345678L);
		payment.setExpiry("12/25");
		payment.setCvv(123);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifycc(paymentdto);
		Assertions.assertEquals("Card Not Verified", actual);
	}
	@Test
	void cardExpiryTest2() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("John Doe");
		paymentdto.setCardType(CardType.Credit);
		paymentdto.setCardNum(1234567812345678L);
		paymentdto.setExpiry("12/22");
		paymentdto.setCvv(123);
		Payment payment = new Payment();
		payment.setName("John Doe");
		payment.setCardType(CardType.Credit);
		payment.setCardNum(1234567812345678L);
		payment.setExpiry("12/25");
		payment.setCvv(123);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifycc(paymentdto);
		Assertions.assertEquals("Card Not Verified", actual);
	}
	@Test
	void alltrue() throws PaymentException {
		PaymentDTO paymentdto = new PaymentDTO();
		paymentdto.setName("Jane kumar");
		paymentdto.setCardType(CardType.Debit);
		paymentdto.setCardNum(8765432187654321L);
		paymentdto.setExpiry("11/24");
		paymentdto.setCvv(496);
		Payment payment = new Payment();
		payment.setName("Jane kumar");
		payment.setCardType(CardType.Debit);
		payment.setCardNum(8765432187654321L);
		payment.setExpiry("11/24");
		payment.setCvv(496);
		List<Payment> alldc = Arrays.asList(payment);
		Mockito.when(paymentRepository.findAll()).thenReturn(alldc);
		String actual = paymentService.verifydc(paymentdto);
		Assertions.assertEquals("Card Verified", actual);
	}
}
