package com.example.StudentDemo.StudentController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.StudentDemo.Entity.Property;
import com.example.StudentDemo.Entity.User;
import com.example.StudentDemo.StudentRepository.UserRepo;
import com.example.StudentDemo.StudentService.PropertyService;

@Controller
@RequestMapping("/property")
public class PropertyController {

	@Autowired
	private PropertyService propertyService; 
	
	@Autowired
	private UserRepo userRepo;
	

	@PostMapping("/add")
	public String addProperty(@ModelAttribute Property property,@RequestParam("userName") String userName,Model model){
		User u=userRepo.findByUserName(userName);
		
		 if (u == null) {
		        model.addAttribute("error", "User not found with username: " + userName);
		        return "AddProperty";
		    }
		property.setUser(u);
		propertyService.addProperty(property);
		return "LandingPage";
	}
	
	
}
