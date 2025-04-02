import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HomeService } from './home.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  public moviesArray: any[] = [];
  public movieChunks: any[][] = [];
  public errorMessage: string = "";

  constructor(private homeService: HomeService, private router: Router) { }

  ngOnInit(): void {
    this.getMovies();
  }

  getMovies() {
    this.homeService.getMovies().subscribe(
      (response) => {
        this.moviesArray = response;
        this.createMovieChunks();
      }, 
      (error) => {
        this.errorMessage = "No Movies Found!";
      }
    );
  }

  createMovieChunks() {
    this.movieChunks = [];
    for (let i = 0; i < this.moviesArray.length; i += 5) {
      this.movieChunks.push(this.moviesArray.slice(i, i + 5));
    }
  }

  goTo(movieName: string) {
    this.router.navigate(['/details', movieName]);
  }
}
