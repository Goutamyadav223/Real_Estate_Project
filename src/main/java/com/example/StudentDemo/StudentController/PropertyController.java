package com.example.StudentDemo.StudentController;

import java.io.IOException;
import java.util.List;

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
	public String addProperty(@ModelAttribute Property property, @RequestParam("imageFile") MultipartFile file,
			HttpSession session) throws IOException {
		User u = (User) session.getAttribute("user");
		if (u == null) {
			return "AddProperty";
		}
		User u1 = userRepo.findByUserName(u.getUserName());
		if (u1 == null) {
			return "AddProperty";
		}
		property.setUser(u);
		property.setImage(file.getBytes());
		propertyService.addProperty(property);
		return "LandingPage";
	}



	@GetMapping("/image/{id}")
	public void getPropertyImage(@PathVariable Integer id, HttpServletResponse response) throws IOException {
		Property property = propertyService.getPropertyById(id);
		if (property != null && property.getImage() != null) {
			response.setContentType("image/jpeg");
			response.getOutputStream().write(property.getImage());
			response.getOutputStream().flush();
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
		}
	}

	@GetMapping("/getAll")
	public String getAllproperty(HttpSession session) {
		User user=(User)session.getAttribute("user");
		List<Property> properties = propertyService.findByUserIdNot(user.getId());
		session.setAttribute("properties", properties);
		return "LandingPage";
	}
	
	@GetMapping("/visit/{id}")
	public String getProperty(@PathVariable("id") Integer id,Model model) {
		Property p=propertyService.getProperty(id);
		model.addAttribute(p);
		return "propertyVisit";
	}
	
	
	
	
	@GetMapping("/MyProfile")
	public String getPropertyforUser(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "LandingPage";
		}
		List<Property> properties = propertyService.getPropertiesForCurrentUser(user.getId());
		model.addAttribute("properties", properties);
		return "profile";
	}
	
	
}
