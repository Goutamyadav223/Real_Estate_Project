package com.example.StudentDemo.StudentController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.StudentDemo.Entity.Property;
import com.example.StudentDemo.Entity.User;
import com.example.StudentDemo.StudentService.PropertyService;
import com.example.StudentDemo.StudentService.UserService;

@Controller
@RequestMapping("/Owner")
public class OwnerController {

	@Autowired 
	private UserService userService;
	
	@Autowired 
	private PropertyService propertyService;
	
	@GetMapping("/property/{id}")
	public String getOwnerProperty(@PathVariable Integer id,HttpSession session) {
		 User owner = userService.findById(id);
		 session.setAttribute("owner", owner);
		    return "redirect:/Owner/getProperty?id="+id;
	}
	
	@GetMapping("/getProperty")
	public String getPropertyforUser(@RequestParam Integer id,Model model) {
		 User owner = userService.findById(id);	
		List<Property> ownerProperties = propertyService.getPropertiesForCurrentUser(owner.getId());
		model.addAttribute("ownerProperties", ownerProperties);
		return "OwnerProperty";
	}

	
}
