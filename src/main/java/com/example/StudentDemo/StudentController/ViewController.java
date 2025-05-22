package com.example.StudentDemo.StudentController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping("/home")
	 public String showHome() {
     return "Home";
	 }
	
	@GetMapping("/LandingPage")
	 	public String landingPage() {
		return "LandingPage";
	 }
	
	@GetMapping("/AddProperty")
	public String addProperty() {
		return "AddProperty";
	}
	
	@GetMapping("/profile")
	 	public String profilePage() {
		return "profile";
	 }
	

	
	@GetMapping("/login")
	public String logInPage() {
		return "login";
	}
	
	@GetMapping("/registration")
	public String regisPage() {
		return "regis";
	}
	
}
