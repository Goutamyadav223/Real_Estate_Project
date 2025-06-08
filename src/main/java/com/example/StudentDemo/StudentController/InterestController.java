package com.example.StudentDemo.StudentController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.StudentDemo.Entity.Interest;
import com.example.StudentDemo.StudentService.InterestService;
import com.example.StudentDemo.dto.InterestDTO;

@Controller
@RequestMapping("/interest")
public class InterestController {

	@Autowired
	InterestService interestService;
	@PostMapping("/set")
	public String sendInterest(@ModelAttribute InterestDTO dto) {
	    Interest interest = interestService.findByPropertyIdAndUsers(
	        dto.getPropertyId(),
	        dto.getSenderUserId(),
	        dto.getReceiverUserId()
	    );
	    if (interest == null) {
	        interestService.interestedUser(dto);
	    }
	    return "LandingPage";
	}

	@GetMapping("/notification/{id}")
	public String showNotifications(@PathVariable("id") Integer id ,Model model, HttpSession session) {
	    List<Interest> notifications = interestService.getNotificationsForUser(id);
	    model.addAttribute("notifications", notifications);
	    return "notification"; 
	}

	
	
}
