import { Component, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { PaymentService } from './payment.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})
export class PaymentComponent implements OnInit {
  paymentForm!: FormGroup;
  submissionMessage: string = '';
  
  showId!: number;
  selectedSeats!: number[];
  seatTotalPrice!: number;
  convenienceFee: number = 30;
  movieName: string = '';
  
  get gstAmount(): number {
    return (this.seatTotalPrice + this.convenienceFee) * 0.18; 
  }

  get totalAmount(): number {
    return this.seatTotalPrice + this.convenienceFee + this.gstAmount;
  }

  get discount(): number {
    const cardTypeValue = this.paymentForm.get('cardType')?.value;
    if (cardTypeValue === 'Credit') {
      return this.totalAmount * 0.9; // 10% discount
    } else if (cardTypeValue === 'Debit') {
      return this.totalAmount * 0.95; // 5% discount
    }
    return this.totalAmount; // No discount
  }

  constructor(
    private fb: FormBuilder, 
    private paymentService: PaymentService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.initForm();
  }

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      this.showId = +params['showId'] || 0;
      this.selectedSeats = params['seats'] ? params['seats'].split(',').map(Number) : [];
      this.seatTotalPrice = +params['totalAmount'] || 0;
      this.movieName = params['movieName'] || '';
    });
  
    this.paymentForm.get('cardType')?.valueChanges.subscribe(() => {
      this.updateFormFieldStatus();
    });
  }

  private initForm() {
    this.paymentForm = this.fb.group({
      cardType: ['', Validators.required],
      cardNum: [{value: '', disabled: true}, [Validators.required, Validators.pattern(/^\d{16}$/)]],
      name: [{value: '', disabled: true}, [Validators.required]],
      expiry: [{value: '', disabled: true}, [Validators.required, Validators.pattern(/^(0[1-9]|1[0-2])\/\d{2}$/), this.futureDateValidator]],
      cvv: [{value: '', disabled: true}, [Validators.required, Validators.pattern(/^\d{3}$/)]],
    });
  }

  private updateFormFieldStatus() {
    const cardTypeValue = this.paymentForm.get('cardType')?.value;
    if (cardTypeValue) {
      this.paymentForm.get('cardNum')?.enable();
      this.paymentForm.get('name')?.enable();
      this.paymentForm.get('expiry')?.enable();
      this.paymentForm.get('cvv')?.enable();
    } else {
      this.paymentForm.get('cardNum')?.disable();
      this.paymentForm.get('name')?.disable();
      this.paymentForm.get('expiry')?.disable();
      this.paymentForm.get('cvv')?.disable();
    }
  }

  futureDateValidator(control: AbstractControl): { [key: string]: boolean } | null {
    if (control.value) {
      const [month, year] = control.value.split('/');
      const expiry = new Date(2000 + parseInt(year), parseInt(month) - 1);
      if (expiry <= new Date()) {
        return { pastDate: true };
      }
    }
    return null;
  }

  onSubmit() {
    if (this.paymentForm.valid) {
      const paymentDetails = {
        ...this.paymentForm.value,
        amount: this.discount // Use the discounted amount
      };
      this.paymentService.bookingConfirm(this.showId, this.selectedSeats, paymentDetails).subscribe(
        response => {
          if(response.message == "Ticket booked successfully"){
            this.router.navigate(['/ticket'], {
              queryParams: {
                bookingId: response.id,
                showId: this.showId,
                seats: this.selectedSeats.join(','),
                totalAmount: this.discount,
                movieName: this.movieName
              }
            });
          }else{
            this.submissionMessage = 'Payment details invalid!';
          }
          
          console.log('Booking Confirmed:', response);
        },
        error => {
          this.submissionMessage = 'Error processing booking. Please try again.';
          console.error('Error confirming booking:', error);
        }
      );
    } else {
      this.submissionMessage = 'Please correct the errors in the form before submitting.';
    }
  }
}