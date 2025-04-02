import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MovieDTO } from './movie.dto';

@Injectable({
  providedIn: 'root'
})
export class SearchedService {
  private apiUrl = 'http://localhost:8888/imovie/movie-list';

  constructor(private http: HttpClient) { }

  searchMovies(query: string, minRating: string, genre: string, language: string): Observable<MovieDTO[]> {
    let params = new HttpParams();
    if (query) params = params.set('query', query);
    if (minRating) params = params.set('minRating', minRating);
    if (genre) params = params.set('genre', genre);
    if (language) params = params.set('language', language);

    return this.http.get<MovieDTO[]>(`${this.apiUrl}/search`, { params });
  }
}