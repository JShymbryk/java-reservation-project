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
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
@RequestMapping(value="/modifyBooking")
public class ModifyBooking {
    
    Database db = new Database();
 
 
    
     
    @RequestMapping( method=RequestMethod.GET)
    public ModelAndView showForm( @ModelAttribute Booking booking,  HttpServletRequest request, HttpServletResponse response, ModelMap model){
        
      
            model.addAttribute (booking);
       
      
        return new ModelAndView("modifyBooking");
        
    }
    
    String errorMsg = "";
        
    @Autowired
    private WebApplicationContext context;
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView processModifyRequest(@Valid Booking booking, BindingResult  bindingResult, HttpSession session, ModelMap modelMap){
        //call method to find the booking
        //update the form fields
        //search for availability 
        //make a new booking and delete the old one????
         DataSource ds = (DataSource)context.getBean("dataSource");
        db.setDataSource(ds);
        List<Room> roomList = db.findAvailableRoom(booking.getCheckin(), booking.getCheckout(), booking.getNoRooms(), booking.getRoomType());
         boolean roomIsAvailable = false;
        if (roomList.isEmpty()){
            errorMsg = "The change cannot be processed as there is no availabilty for the dates you selected."
                    + "Please call us for help";
             modelMap.addAttribute("errorMsg", errorMsg);
            return new ModelAndView("modifyBooking");
           
            
        }
       
        else{
            for (int i = 0; i < roomList.size(); i++){
                if (roomList.get(i).getRoomType().equals(booking.getRoomType()))
                        roomIsAvailable = true;
        }
            if(!roomIsAvailable){
             errorMsg = "The change cannot be processed as there is no availabilty for the dates you selected."
                    + "Please call us for help";
             modelMap.addAttribute("errorMsg", errorMsg);
            return new ModelAndView("modifyBooking");
            }
        }
         Room room = db.findRoomByType(booking.getRoomType());
         User user = db.findUserById(booking.getGuestId());
         booking.setHotelId(room.getHotelId());
         booking.setPricePerNight(room.getPrice());
         booking.setPricetotal();
         booking.setRoomId(room.getId());
        booking.setRoomType(room.getRoomType()); 
        long resId = booking.getReservationId();
        modelMap.addAttribute("booking", booking);
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("resId", resId);
        db.updateBooking(booking);
        return new ModelAndView("thankYou");
    }
}
