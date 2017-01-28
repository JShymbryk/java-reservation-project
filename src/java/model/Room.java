/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * 
 */
public class Room implements Serializable{
    private int id;
 private int HotelId;
    private String RoomType;
    private double price;
    private String description;
     private String image;    
     private String roomName;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
     
    public int getHotelId() {
        return HotelId;
    }

    public void setHotelId(int HotelId) {
        this.HotelId = HotelId;
    }
   

     
      public int getId() {
        return id;
    }

    public void setId(int RoomId) {
        this.id = RoomId;
    } 
    public String getRoomType() {
        return RoomType;
    }

    public void setRoomType(String RoomType) {
        this.RoomType = RoomType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
      
    public double getPrice() {
      
        return price;
    }
    
    public void setPrice(double price) {
      
        this.price=price;
    }
    
   public double calculateRoomRate(Date checkin, Date checkout){
       //Needs to be implemented
       return 0;
   } 
}
