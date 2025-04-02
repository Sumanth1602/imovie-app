import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

interface BookingResponse {
  id: any;
  message: string;
}

@Injectable({
  providedIn: 'root'
})
export class PaymentService {
  private baseUrl = 'http://localhost:8900/imovie/booking/bookingConfirm';

  constructor(private http: HttpClient) {}

  bookingConfirm(showId: number, seats: number[], paymentDetails: any): Observable<BookingResponse> {
    const seatsString = seats.join(',');
    let params = new HttpParams()
      .set('showId', showId.toString())
      .set('seats', seatsString);
    console.log(paymentDetails);

    return this.http.post<BookingResponse>(`${this.baseUrl}`, paymentDetails, { params });
  }
}