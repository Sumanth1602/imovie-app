import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { SearchedComponent } from './searched/searched.component';
import { MovieDetailsComponent } from './movie-details/movie-details.component';
import { TheatreComponent } from './theatre/theatre.component';
import { PaymentComponent } from './payment/payment.component';
import { SeatMatrixComponent } from './seat-matrix/seat-matrix.component';
import { TicketComponent } from './ticket/ticket.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'search', component: SearchedComponent },
  { path: 'details/:movieName', component: MovieDetailsComponent },
  { path: 'theatre/:movieName', component: TheatreComponent },
  { path: 'payment', component: PaymentComponent },
  { path: 'seatmatrix/:showId', component: SeatMatrixComponent },
  { path: 'ticket', component:TicketComponent},
  { path: '**', redirectTo: '/home', pathMatch: 'full'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
