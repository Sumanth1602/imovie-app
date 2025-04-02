import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SeatMatrixService {
  private apiUrl = "http://localhost:8888/imovie/seat-list/allSeats/";
  
  constructor(private http: HttpClient) { }

  getSeats(showId: number): Observable<any[]> {
    console.log(`Fetching seats for show ID: ${showId}`);
    return this.http.get<any[]>(`${this.apiUrl}${showId}`);
  }
}