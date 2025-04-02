import { Component } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  title = 'iMovie';

  constructor(private router : Router){}

  searchMovies(query: string) {
    if (query) {
      this.router.navigate(['/search'], { queryParams: { query: query } });
    }
  }
}
