/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import Model.Lists;
//import Model.Student;
import model.Database;
import model.User;
import model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.jdbc.core.JdbcTemplate;


//import javax.enterprise.inject.Model;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.portlet.ModelAndView;

/**
 *
 * @author Julia
 */


@Controller  
@SessionAttributes("booking")
@RequestMapping("/first.htm") 
public class Initial {

@Autowired
private WebApplicationContext context;    


    
    User user = new User();
    String errorLog = "";
    @RequestMapping(method = RequestMethod.GET)
   public String root(ModelMap model, HttpSession session){
    
      model.addAttribute("booking", new Booking()); 
     // model.addAttribute("lists", Lists.getList());
    Database database = new Database(); 
    try{
        
    DataSource ds =(DataSource) context.getBean("dataSource");
    database.setDataSource(ds); 
    
       }
     
     catch (Exception e){
         errorLog = e.toString();
     }
  //  if(database.getUserFirstName() == null)
 //   user.setFirstName("this has failed horribly");
  //  else
   //  user.setFirstName(database.getUserFirstName());
     
    model.addAttribute("firstName", user.getFirstName());
    model.addAttribute("test", errorLog); 
     return "index";
     
     
    }
    @ModelAttribute("booking")
    public Booking getBooking() {
        return new Booking();
     
   }
 
  

}
