package com.example.StudentDemo.StudentService;


import java.util.List;

import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Property;

@Service
public interface PropertyService {

	public Property addProperty(Property property);

	public List<Property> getPropertiesForCurrentUser(Integer id);
	
	public Property getPropertyById(Integer id);

	public List<Property> findByUserIdNot(Integer userId);

	public Property getProperty(Integer id);

}
