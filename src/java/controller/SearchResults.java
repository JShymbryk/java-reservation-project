/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import model.Booking;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import model.Room;
import model.User;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 *
 */
@Controller
@SessionAttributes("room")
@RequestMapping("/searchResults.htm")
public class SearchResults {
    
     @RequestMapping(method=RequestMethod.POST)
    public String processSearchResultRequest(@Valid Room room, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, HttpSession session){
        if(bindingResult.hasErrors()) {
      
            return "index";
        }
        Booking booking = (Booking) session.getAttribute("booking");
        session.setAttribute("room", room);
        modelMap.addAttribute("booking", booking);
        modelMap.addAttribute("room", room);
        modelMap.addAttribute("user", new User());
        
        
        modelMap.addAttribute("totalValue", booking.getDifferenceDays()*room.getPrice());
        NumberFormat formatter = new DecimalFormat("#0.00"); 
        double tax = Double.parseDouble(formatter.format(booking.getDifferenceDays()*room.getPrice()*0.13));
        
        modelMap.addAttribute("tax", tax);
        modelMap.addAttribute ("total", booking.getDifferenceDays()*room.getPrice() + tax);
        
        return "createBooking";
    }
    
    @ModelAttribute("room")
    public Room getRoom() {
        return new Room();
     
   }
}
