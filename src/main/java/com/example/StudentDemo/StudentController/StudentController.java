package com.example.StudentDemo.StudentController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.StudentDemo.Entity.Student;
import com.example.StudentDemo.StudentService.StudentService;

import org.springframework.ui.Model;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/home")
	 public String showHome() {
      return "Home";
	 }
	
	 @GetMapping("/registerPage")
	 public String showRegisterForm() {
       return "regis";
	 }
	 
	 @GetMapping("/loginPage")
	 public String showLogin() {
       return "login";
	 }
	
	@PostMapping("/registration")
	public String registration(@ModelAttribute Student student,Model model) {
		studentService.registration(student);
		model.addAttribute("user", student);
			return "login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute Student student,Model model) {
		Student s=studentService.login(student);
		model.addAttribute("student",student);
		return "Home";
	}
	
	
}
