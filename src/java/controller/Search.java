/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.text.SimpleDateFormat;
import model.Booking;
import model.Database;
import model.Room;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * 
 */
@Controller

@RequestMapping("/submitCheck.htm")
public class Search {
    @Autowired
private WebApplicationContext context;    


    
    User user = new User();
    String errorLog = "";
    private ArrayList<Room> roomList;
    private Database db = Database.getInstance();
    /*none of these methods are implemented*/
     
    
    //for date binding
    @InitBinder     
public void initBinder(WebDataBinder binder){
      SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    binder.registerCustomEditor(Date.class, new CustomDateEditor(
            dateFormat, true));
}

    @RequestMapping(method=RequestMethod.POST)
    public String processSearchRequest(@Valid Booking booking,BindingResult bindingResult, ModelMap modelMap, HttpSession session){
     
       
      if(bindingResult.hasErrors()) {
      
            return "index";
        }
      else if(booking.getDifferenceDays() <= 0){
          String errorMsg = "Check in date must be before check out date";
          modelMap.addAttribute("errorMsg", errorMsg);
          return "index";
      
      }
        else{ 
         //  SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
       //    dateFormat.format(booking.getCheckin());
        availableRooomType(booking.getCheckin(), booking.getCheckout(), booking.getNoRooms());
       if (Database.availableRooms.isEmpty()){
           modelMap.addAttribute("errorMessage", "Sorry, no rooms are available at this time. Please choose new dates or call us for help");
       }
            modelMap.addAttribute("availableRoom", Database.availableRooms);
           modelMap.addAttribute("room", new Room());
           session.setAttribute("booking", booking);
           modelMap.addAttribute("bookingInfo",booking);
        return "searchResults";
        
        //create a session variable
        
      }
        
    }
     
    
    private ArrayList<Room> availableRooomType(Date checkin, Date checkout, int numberOfRooms){
        //search in the booking table by date
        //count how many rooms of the type are taken each night
        //find how many rooms of this type are in the hotel
        //subtract the number of rooms in use from the number of rooms in the hotel
        //Do this calculation in a loop for each date in the range and return the lowest number
        Database database = new Database(); 
        Booking booking = new Booking();
    try{  
    DataSource ds =(DataSource) context.getBean("dataSource");
    database.setDataSource(ds); 
       }
    
     catch (Exception e){
         errorLog = e.toString();
     } 
//    if(database.searchOccupiedRooms(checkin, checkout) == null)
//    user.setFirstName("this has failed horribly");
//List<Integer> availableRooms = new ArrayList<Integer>();
//availableRooms = database.searchOccupiedRooms(checkin, checkout);
 //if (availableRooms.size()>0){
   //  for (int room : availableRooms){
        // database.findAvailableStandardRooms(room, roomType);
        // database.findAvailableDeluxeRooms(room, roomType);
        // database.findAvailableSuperiorRooms(room, roomType);
        // database.findAvailablePremiumRooms(room, roomType, checkin, checkout);
        //database.findAvailableSuiteHotRooms(room, roomType);
        // database.findAvailableVineyardRooms(room, roomType);
        
     //}Date checkin, Date checkout, int numberOfRooms, String roomType
  Database.availableRooms.clear();
  database.findAvailableRoom(checkin, checkout, numberOfRooms, "Standard");
  database.findAvailableRoom(checkin, checkout, numberOfRooms, "Deluxe");
  database.findAvailableRoom(checkin, checkout, numberOfRooms, "Superior");
  database.findAvailableRoom(checkin, checkout, numberOfRooms, "Premium");
  database.findAvailableRoom(checkin, checkout, numberOfRooms, "Suitehot");
  database.findAvailableRoom(checkin, checkout, numberOfRooms, "Vineyard");
        return Database.availableRooms;
      
    }
    
   
    
    private boolean isEnoughSpace(String roomType, int roomsRequested){
     //for specified room type subtract the number of available rooms from the number of rooms requested
     //return true if this calculation is greater than 0, else
        return false;
    }
    
    private ArrayList<Room> availableRoomList(){
       //for each room type find isEnoughspace and if true, add a room object of that type to the list
    return roomList;
    }
}
