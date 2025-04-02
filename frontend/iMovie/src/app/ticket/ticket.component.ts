import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-ticket',
  templateUrl: './ticket.component.html',
  styleUrls: ['./ticket.component.css']
})
export class TicketComponent implements OnInit {
  showId: string = '';
  seats: string = '';
  bookingId: string = '';
  movieName: string = '';

  constructor(
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      this.movieName = params['movieName'];
      this.bookingId = params['bookingId'];
      this.showId = params['showId'];
      this.seats = params['seats'];
    });
  }

  goToMovieDetails() {
    this.router.navigate(['/details', this.movieName], {
      queryParams: { watched: 'true' }
    });
  }
}