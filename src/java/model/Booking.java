/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import javax.validation.constraints.Min;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
/**
 *
 *
 */
public class Booking implements Serializable{

    public int getNoAdults() {
        return NoAdults;
    }

    public void setNoAdults(int NoAdults) {
        this.NoAdults = NoAdults;
    }

    public int getNoChildren() {
        return NoChildren;
    }

    public void setNoChildren(int NoChildren) {
        this.NoChildren = NoChildren;
    }

    public int getNoRooms() {
        return NoRooms;
    }

    public void setNoRooms(int NoRooms) {
        this.NoRooms = NoRooms;
    }

    public long getRoomId() {
        return roomId;
    }

    public void setRoomId(long roomId) {
        this.roomId = roomId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public double getPricetotal() {
        
        //Code in here to take the dates and add extra for weekend days/summer season and subtract for promotions
        //Code to add up all dates and multiply by number of rooms 
        //this.priceTotal = room.calculateRoomRate(checkIn, checkOut);
        this.pricetotal = getDifferenceDays()*getPricePerNight();
        return pricetotal;
    }
    
    
    public long getDifferenceDays() {
    long diff = checkout.getTime() - checkin.getTime();
    return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
}

    public void setPricetotal() {
        this.pricetotal = getDifferenceDays()*pricePerNight;
        
       
    }
long reservationId;
long guestId;

@Min(value = 1, message = "At least one adult must be included in the booking")
int NoAdults;

int NoChildren;

int NoRooms;
String promotion;

@DateTimeFormat(pattern = "dd/MM/yyyy")
@NotNull (message = "Please specify the checkin date")
@Future (message = "Reservation date must be in the future")
Date checkin;


@DateTimeFormat(pattern = "dd/MM/yyyy")
@NotNull (message = "Please specify the checkout date")
@Future (message = "Reservation date must be in the future")
Date checkout;


long hotelId;

long roomId;
String roomType;
double pricePerNight;
double pricetotal;
String DinnerReservations;

    public String getDinnerReservations() {
        return DinnerReservations;
    }

    public void setDinnerReservations(String DinnerReservations) {
        this.DinnerReservations = DinnerReservations;
    }
String specialRequests;

    public long getReservationId() {
        return reservationId;
    }

    public void setReservationId(long reservationId) {
        this.reservationId = reservationId;
    }

    public long getGuestId() {
        return guestId;
    }

    public void setGuestId(long guestId) {
        this.guestId = guestId;
    }

   
   

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
       
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public long getHotelId() {
        return hotelId;
    }

    public void setHotelId(long hotelId) {
        this.hotelId = hotelId;
    }

    
  

 

    public String getSpecialRequests() {
        return specialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests;
    }


}
