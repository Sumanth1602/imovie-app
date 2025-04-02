import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, map, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MovieDetailsService {

  private apiUrl = 'http://localhost:8700/imovie';

  constructor(private http: HttpClient) { }
  
  getMoviesByName(movieName : string): Observable<any>{
    return this.http.get(`${this.apiUrl}/movie-list/${movieName}`);
  }

  getMovieDetails(movieId: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/movie-list/movie/${movieId}`)
      .pipe(
        catchError(this.handleError)
      );
  }

  private handleError(error: any) {
    console.error('An error occurred:', error);
    return throwError('Something bad happened; please try again later.');
  }

  saveRating(movieId: number, rating: number): Observable<any> {
    const params = new HttpParams().set('rating', rating.toString());
    return this.http.put(`${this.apiUrl}/movie-list/${movieId}/rate`, null, { params });
  }
}
