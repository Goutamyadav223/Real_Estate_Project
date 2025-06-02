package com.example.StudentDemo.StudentController;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.StudentDemo.Entity.User;
import com.example.StudentDemo.StudentService.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@PostMapping("/create")
	public String createUser(@ModelAttribute User user,@RequestParam("imageFile") MultipartFile file)throws IOException {
		user.setImage(file.getBytes());
		userService.createUser(user);
		return "login";
	}

	@PostMapping("/login")
	public String getUser(@ModelAttribute User user, Model model, HttpSession session) {
		User user1 = userService.getUser(user);
		if(user1!=null){
			System.out.println(user1);
			if((user1.getPassword()).equals(user.getPassword())) {	
            session.setAttribute("user", user1);
        	return "redirect:/property/getAll";
			}
			
		}
		model.addAttribute("error", "Invalid username or password");
			return "login";
	}
	
	@GetMapping("/image/{id}")
	public void getUserImage(@PathVariable Integer id,HttpServletResponse response)throws IOException {
		User user=userService.findById(id);
		if( user!=null && user.getImage() != null ) {
			response.setContentType("image/jpeg");
			response.getOutputStream().write(user.getImage());
			response.getOutputStream().flush();
		}
		else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
		}
	}
	

}
