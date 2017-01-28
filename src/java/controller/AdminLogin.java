/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Admin;
import model.Booking;
import model.Database;
import model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * 
 */
@Controller
//@SessionAttributes("admin")
@RequestMapping(value="adminLogin.htm")
public class AdminLogin {
    HttpSession session;
    
    private Database db = Database.getInstance();
    
   @RequestMapping(method=RequestMethod.GET)
    public ModelAndView ShowAdminLogin(@ModelAttribute Admin admin, @ModelAttribute Booking booking, 
            @ModelAttribute User user, HttpServletRequest request, HttpServletResponse response, ModelMap model
    , HttpSession session){
        
        if(admin ==null) {
            model.addAttribute("admin", new Admin());
        } else {
            model.addAttribute(admin);
        }
        
        if(session.getAttribute("login") == null) {
            return new ModelAndView("adminLogin");
        } else {
            return new ModelAndView("adminSearch");
        }
       
    }
    
    @Autowired
    private WebApplicationContext context;
    
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView GoToNext(@ModelAttribute Admin admin,@ModelAttribute Booking booking, @ModelAttribute User user, 
            HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) {
        DataSource ds = (DataSource)context.getBean("dataSource");
        db.setDataSource(ds);
        
        boolean isValid = false;
        
        isValid = db.validateAdmin(admin.getLogin(), admin.getPassword());
        
        if(isValid == true) {
            session = request.getSession();
            session.setAttribute("login", admin.getLogin());
            session.setMaxInactiveInterval(30 * 60);
            model.addAttribute(db);
            return new ModelAndView("adminSearch");
        } else {
            model.addAttribute("error", "Incorrect Credentials!!");
            return new ModelAndView("adminLogin");
        }
    }
    
    @ModelAttribute("admin")
    public Admin getAdmin() {
        return new Admin();
     
   }
}
