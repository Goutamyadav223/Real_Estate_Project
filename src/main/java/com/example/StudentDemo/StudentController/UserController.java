package com.example.StudentDemo.StudentController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.StudentDemo.Entity.User;
import com.example.StudentDemo.StudentService.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/create")
	public String createUser(@ModelAttribute User user) {
		userService.createUser(user);
		return "login"; 
	}
	
	@PostMapping("/get")
	public String getUser(@ModelAttribute User user, Model model) {
	    boolean isValidUser = userService.getUser(user);
	    if (isValidUser) {
	        return "LandingPage";  
	    } else {
	        model.addAttribute("error", "Invalid username or password");
	        return "Home";  
	    }
	}

	
}
