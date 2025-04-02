import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { HomeComponent } from './home/home.component';
import { HomeService } from './home/home.service';
import { SearchedComponent } from './searched/searched.component';
import { SearchedService } from './searched/searched.service';
import { MovieDetailsComponent } from './movie-details/movie-details.component';
import { FormsModule } from '@angular/forms';
import { TheatreComponent } from './theatre/theatre.component';
import { PaymentComponent } from './payment/payment.component';
import { SeatMatrixComponent } from './seat-matrix/seat-matrix.component';
import { TicketComponent } from './ticket/ticket.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    SearchedComponent,
    MovieDetailsComponent,
    TheatreComponent,
    PaymentComponent,
    SeatMatrixComponent,
    TicketComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule
  ],
  providers: [HomeService,SearchedService],
  bootstrap: [AppComponent]
})
export class AppModule { }
