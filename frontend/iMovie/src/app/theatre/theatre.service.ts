import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TheatreService {
  private baseUrl = 'http://localhost:8888/imovie/theatre-list/';
  private seatsUrl = 'http://localhost:8888/imovie/seat-list/';

  constructor(private http: HttpClient) { }
  
  getTheatresByMovieName(movieName: string): Observable<any> {
    return this.http.get(`${this.baseUrl}${movieName}`);
  }

  getAvailableSeats(showId: number): Observable<any> {
    return this.http.get(`${this.seatsUrl}availableSeats/${showId}`);
  }
}