import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TheatreService } from './theatre.service';

@Component({
  selector: 'app-theatre',
  templateUrl: './theatre.component.html',
  styleUrls: ['./theatre.component.css']
})
export class TheatreComponent implements OnInit {
  private movieName: string = "";
  public theatreArray: any;
  private errorMessage: string = "";
  showPopup: boolean = false;
  selectedShowId: number | null = null;
  ticketCount: number = 1;
  availableSeats: any[] = [];

  constructor(
    private theatreService: TheatreService,
    private router: Router,
    private aroute: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.aroute.params.subscribe((data) => {
      this.movieName = data['movieName'];
      this.getTheatresByMovieName(this.movieName);
    });
  }

  getTheatresByMovieName(movieName: string) {
    this.theatreService.getTheatresByMovieName(movieName).subscribe(
      (response) => {
        this.theatreArray = response;
        this.errorMessage = "";
      },
      (error) => {
        this.errorMessage = "No theatres found";
        this.theatreArray = null;
      }
    );
  }

  openTicketPopup(showId: number) {
    this.selectedShowId = showId;
    this.ticketCount = 1;
    this.theatreService.getAvailableSeats(showId).subscribe(
      (availableSeats) => {
        this.availableSeats = availableSeats;
        this.showPopup = true;
      },
      (error) => {
        console.error('Error fetching available seats:', error);
        this.errorMessage = "Unable to fetch available seats. Please try again.";
      }
    );
  }

  closePopup() {
    this.showPopup = false;
    this.selectedShowId = null;
  }

  bookTickets() {
    if (this.ticketCount > this.availableSeats.length) {
      alert(`Only ${this.availableSeats.length} seats are available for this show.`);
    } else if (this.selectedShowId) {
      this.router.navigate(['seatmatrix', this.selectedShowId], {
        queryParams: {
          tickets: this.ticketCount,
          movieName: this.movieName
        }
      });
    }
  }
}