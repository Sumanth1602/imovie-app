import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { SeatMatrixService } from './seat-matrix.service';

@Component({
  selector: 'app-seat-matrix',
  templateUrl: './seat-matrix.component.html',
  styleUrls: ['./seat-matrix.component.css']
})
export class SeatMatrixComponent implements OnInit {
  seats: any[][] = [];
  rows: number = 0;
  cols: number = 10;
  selectedSeats: any[] = [];
  totalAmount: number = 0;
  errorMessage: string = '';
  showId!: number;
  maxTickets!: number;
  movieName: string = '';

  constructor(
    private seatService: SeatMatrixService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.showId = +params['showId'];
    });

    this.route.queryParams.subscribe(queryParams => {
      this.maxTickets = +queryParams['tickets'] || 1;
      this.movieName = queryParams['movieName'] || '';
    });

    this.loadSeats();
  }

  loadSeats(): void {
    this.seatService.getSeats(this.showId).subscribe(
      data => {
        this.processSeatData(data);
      },
      error => {
        this.errorMessage = 'Failed to load seat data. Please try again later.';
      }
    );
  }

  processSeatData(data: any[]): void {
    const seatMap = new Map<number, any[]>();

    data.forEach(seat => {
      const row = Math.floor((seat.seatNum - 1) / this.cols);
      const col = (seat.seatNum - 1) % this.cols;
      if (!seatMap.has(row)) {
        seatMap.set(row, []);
      }
      seatMap.get(row)![col] = { ...seat, selected: false };
    });

    this.rows = Math.max(...Array.from(seatMap.keys())) + 1;
    this.seats = Array.from({ length: this.rows }, (_, row) =>
      Array.from({ length: this.cols }, (_, col) => seatMap.get(row)?.[col] || null)
    );
  }

  toggleSeat(seat: any): void {
    if (seat.status === 'BOOKED') {
      return;
    }

    if (seat.selected) {
      seat.selected = false;
      const index = this.selectedSeats.findIndex(s => s.seatNum === seat.seatNum);
      if (index > -1) {
        this.selectedSeats.splice(index, 1);
        this.totalAmount -= seat.price;
      }
    } else if (this.selectedSeats.length < this.maxTickets) {
      seat.selected = true;
      this.selectedSeats.push(seat);
      this.totalAmount += seat.price;
    } else {
      this.errorMessage = `You can only select up to ${this.maxTickets} seat(s).`;
    }
  }

  submitBooking(): void {
    if (this.selectedSeats.length === 0) {
      this.errorMessage = 'Please select at least one seat before booking.';
      return;
    }
    if (this.selectedSeats.length !== this.maxTickets) {
      this.errorMessage = `Please select exactly ${this.maxTickets} seat(s).`;
      return;
    }
  
    const seatNumbers = this.selectedSeats.map(seat => seat.seatNum).join(',');
    const seatTypes = this.selectedSeats.map(seat => seat.type).join(',');

    this.router.navigate(['/payment'], {
      queryParams: {
        showId: this.showId,
        seats: seatNumbers,
        types: seatTypes,
        totalAmount: this.totalAmount,
        movieName: this.movieName
      }
    });
  
    console.log('Booked Seats:', this.selectedSeats);
    console.log('Total Amount:', this.totalAmount);
    console.log('Movie Name:', this.movieName);
    this.errorMessage = '';
  }

  getSeatClass(seat: any): string {
    if (seat.selected) return 'seat-selected';
    if (seat.status === 'BOOKED') return 'seat-booked';
    if (this.selectedSeats.length >= this.maxTickets) return 'seat-disabled';
    return 'seat-available';
  }
}