/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Booking;
import model.Database;
import model.Room;
import model.User;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * 
 */


@Controller
@RequestMapping(value="/addbooking")
public class AddBooking {

   // @Autowired
//private WebApplicationContext context;  

    Database db = new Database();
  
 
    
     
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView showForm(@ModelAttribute User user, @ModelAttribute Room room, HttpServletRequest request, HttpServletResponse response, ModelMap model){
        //retrieve the user from the database, and populate the form
        //create a session variable for the user
       if(user == null)
        model.addAttribute("user", new User());
       
       else 
           model.addAttribute ( user);
       HttpSession session = request.getSession();
       Booking booking = (Booking)session.getAttribute("booking");
       model.addAttribute(room);
        
        model.addAttribute("totalValue", booking.getDifferenceDays()*room.getPrice());
        NumberFormat formatter = new DecimalFormat("#0.00"); 
        double tax = Double.parseDouble(formatter.format(booking.getDifferenceDays()*room.getPrice()*0.13));
        
        model.addAttribute("tax", tax);
        model.addAttribute ("total", booking.getDifferenceDays()*room.getPrice() + tax);
        return new ModelAndView("createBooking");
    }
    
  
        
    @Autowired
    private WebApplicationContext context;
    
    @RequestMapping( method=RequestMethod.POST)
       public ModelAndView processBookingRequest(@Valid @ModelAttribute User user,  BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response, ModelMap map){
           boolean noUser = false;
           DataSource ds = (DataSource)context.getBean("dataSource");
           db.setDataSource(ds);
           
           HttpSession session = request.getSession(true);
        Booking booking = (Booking)session.getAttribute("booking");
       
        Room room = (Room) session.getAttribute("room");
       
         booking.setHotelId(room.getHotelId());
         booking.setPricePerNight(room.getPrice());
         booking.setPricetotal();
         booking.setRoomId(room.getId());
        booking.setRoomType(room.getRoomType());
          map.addAttribute("totalValue", booking.getDifferenceDays()*room.getPrice());
        NumberFormat formatter = new DecimalFormat("#0.00"); 
        double tax = Double.parseDouble(formatter.format(booking.getDifferenceDays()*room.getPrice()*0.13));
        
        map.addAttribute("tax", tax);
        map.addAttribute ("total", booking.getDifferenceDays()*room.getPrice() + tax);
            //delete this later
           /* if (booking == null){
                booking = new Booking();
                Calendar cal = Calendar.getInstance();
                Date date = new Date(cal.getTimeInMillis());
                booking.setCheckin(date);
                booking.setCheckout(date);
                booking.setHotelId(1234);
                booking.setNoAdults(2);
                booking.setNoChildren(0);
                booking.setNoRooms(1);
                booking.setRoomType("Standard");
                booking.setRoomId(1);
                booking.setPricetotal(1000);
            } */
            
           /*else{
                Long guestId = Long.parseLong((session.getAttribute("guestId").toString()));
                booking.setGuestId(guestId);
                user.setId(guestId);
            } */
            
        //validate the userinfo and add the booking to the database
        //charge the user's credit card number
        //create a success message telling the user what they registered and what they were charged
         if (bindingResult.hasErrors()) {
             map.addAttribute("errorMessage", "Registration errors. Please try again");
            return new ModelAndView("createBooking");
        }
         else{
        map.addAttribute(room);
        map.addAttribute(booking);
        map.addAttribute(user);
        if(user.getId()==0){
                noUser = true;
                //Long guestId = new Random().nextLong();
                //user.setId(guestId);
                //booking.setGuestId(guestId);
            }
        else {
            booking.setGuestId(user.getId());
        }
       
        booking.setSpecialRequests(user.getRequests());
        if (noUser){
        User existingUser = db.retrieveUser(user.getPin(), user.getEmail());
            if(existingUser.getId() == 0){
                 db.addUser(user);
                User newlyCreated = db.retrieveUserId(user.getEmail());
                 booking.setGuestId(newlyCreated.getId());
        }
            else{
             booking.setGuestId(existingUser.getId());   
            }}
        
        db.createBooking(booking);
        
        long resId = db.retrieveReservationId(booking.getGuestId(), booking.getCheckin(), booking.getCheckout(), booking.getRoomId()).getReservationId();
        map.addAttribute("resId", resId);
         }
        return new ModelAndView("thankYou"); 
    }

   
}
