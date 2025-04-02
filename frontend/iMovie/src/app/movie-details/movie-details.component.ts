import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { MovieDetailsService } from './movie-details.service';

@Component({
  selector: 'app-movie-details',
  templateUrl: './movie-details.component.html',
  styleUrls: ['./movie-details.component.css']
})
export class MovieDetailsComponent implements OnInit {
  public movieName: string = "";
  public movie: any;
  public errorMessage: string = "";
  userRating: number = 0;
  watched: boolean = false;

  constructor(
    private movieDetailsService: MovieDetailsService,
    private router: Router,
    private aroute: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.aroute.params.subscribe((params) => {
      this.movieName = params['movieName'];
      this.searchMovies(this.movieName);
    });

    this.aroute.queryParams.subscribe((queryParams) => {
      this.watched = queryParams['watched'] === 'true';
    });
  }

  searchMovies(movieName: string) {
    this.movieDetailsService.getMoviesByName(movieName).subscribe(
      (response) => {
        this.movie = response;
        this.errorMessage = "";
      },
      (error) => {
        this.errorMessage = "No movie found";
        this.movie = null;
      }
    );
  }

  rateMovie(rating: number) {
    this.userRating = rating;
    if (this.movie && this.movie.movieId) {
      this.movieDetailsService.saveRating(this.movie.movieId, rating).subscribe(
        (response) => {
          this.refreshMovieDetails();
        },
        (error) => {
          this.errorMessage = "Error saving rating. Please try again.";
        }
      );
    } else {
      this.errorMessage = "Cannot rate movie at this time. Please try again later.";
    }
  }

  refreshMovieDetails() {
    if (this.movie && this.movie.movieId) {
      this.movieDetailsService.getMovieDetails(this.movie.movieId).subscribe(
        (updatedMovie) => {
          this.movie = updatedMovie;
          this.errorMessage = "";
        },
        (error) => {
          this.errorMessage = "Error refreshing movie details. Please try again.";
        }
      );
    } else {
      this.searchMovies(this.movieName);
    }
  }

  showTheatres(movieName: string) {
    this.router.navigate(['/theatre', movieName]);
  }
}