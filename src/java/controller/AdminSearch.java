/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Booking;
import model.Database;
import model.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;


/**
 *
 * 
 */
@Controller
@RequestMapping(value="/")
public class AdminSearch {
    
     Database db = new Database();
     
    
     @RequestMapping(method=RequestMethod.GET)
    public ModelAndView showForm(@ModelAttribute Booking book, @ModelAttribute User user, ModelMap model, HttpServletRequest request, 
            HttpServletResponse response, HttpSession session){
        //implement this later
        
        if(book == null) {
            model.addAttribute("book", new Booking());
        } else {
            model.addAttribute(book);
        }
        
        if(user ==null) {
            model.addAttribute("user", new User());
        } else {
            model.addAttribute(user);
        }
        
        return new ModelAndView("adminSearch");
        
    }
    
    @Autowired
    private WebApplicationContext context;
     
    @RequestMapping(value="searchResult.htm", method=RequestMethod.POST)
    public String findSearchResults(@ModelAttribute Booking booking, HttpServletRequest request, HttpServletResponse response, 
            ModelMap model, HttpSession session){
        DataSource ds = (DataSource)context.getBean("dataSource");
        db.setDataSource(ds);
        //ModelAndView attempt = new ModelAndView("searchResults");
        List<Booking> result = db.findBooking(booking.getReservationId());
        model.addAttribute("result", result);
       
        return  "searchAdminResults";
    }
   
    @RequestMapping(value="searchPhone.htm", method=RequestMethod.POST)
    public String findSearchPhone(@ModelAttribute User user, HttpServletRequest request, HttpServletResponse response, ModelMap model,
            HttpSession session){
        DataSource ds = (DataSource)context.getBean("dataSource");
        db.setDataSource(ds);
        db.findBooking(user.getPhoneNumber());
        if(Database.allBookings != null || !Database.allBookings.isEmpty()) {
            model.addAttribute("result", Database.allBookings);
        }
        
        return  "searchAdminResults";
        
    }
    
      @RequestMapping(value= "{reservationId}.htm",method=RequestMethod.GET)
    public ModelAndView deleteReservation(@ModelAttribute Admin admin, @ModelAttribute Booking booking, 
            @ModelAttribute User user, HttpServletRequest request, HttpServletResponse response, ModelMap model
    , HttpSession session, @PathVariable(value = "reservationId") Long id){
        DataSource ds = (DataSource)context.getBean("dataSource");
        db.setDataSource(ds);
        
        db.deleteBooking(id);
       
        return new ModelAndView("adminSearch");

    }
    
}

