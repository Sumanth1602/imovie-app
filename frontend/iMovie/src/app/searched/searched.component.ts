import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { SearchedService } from './searched.service';
import { MovieDTO } from './movie.dto';

@Component({
  selector: 'app-searched',
  templateUrl: './searched.component.html',
  styleUrls: ['./searched.component.css']
})
export class SearchedComponent implements OnInit {

  query: string = '';
  minRating: string = '';
  genre: string = '';
  language: string = '';
  movieChunks: MovieDTO[][] = [];
  errorMessage: string = '';

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private searchedService: SearchedService
  ) {}

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      this.query = params['query'] || '';
      this.minRating = params['minRating'] || '';
      this.genre = params['genre'] || '';
      this.language = params['language'] || '';
      this.searchMovies();
    });
  }

  searchMovies() {
    this.searchedService.searchMovies(this.query, this.minRating, this.genre, this.language)
      .subscribe({
        next: (results) => {
          this.movieChunks = this.chunkArray(results, 3);
          this.errorMessage = '';
        },
        error: (error) => {
          this.movieChunks = [];
          this.errorMessage = 'An error occurred while searching for movies. Please try again.';
          console.error('Error searching movies:', error);
        }
      });
  }

  applyFilters() {
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: { query: this.query, minRating: this.minRating, genre: this.genre, language: this.language },
      queryParamsHandling: 'merge'
    });
  }

  private chunkArray(array: MovieDTO[], size: number): MovieDTO[][] {
    const chunks: MovieDTO[][] = [];
    for (let i = 0; i < array.length; i += size) {
      chunks.push(array.slice(i, i + size));
    }
    return chunks;
  }
  goTo(movieName: string) {
    this.router.navigate(['/details', movieName]);
  }
}