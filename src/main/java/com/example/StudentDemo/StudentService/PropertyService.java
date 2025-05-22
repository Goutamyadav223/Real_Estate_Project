package com.example.StudentDemo.StudentService;

import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Property;

@Service
public interface PropertyService {

	public Property addProperty(Property property);
	
}
