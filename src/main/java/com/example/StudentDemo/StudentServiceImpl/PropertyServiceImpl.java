package com.example.StudentDemo.StudentServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Property;
import com.example.StudentDemo.StudentRepository.PropertyRepo;
import com.example.StudentDemo.StudentService.PropertyService;

@Service
public class PropertyServiceImpl implements PropertyService{

	@Autowired
	private PropertyRepo propertyRepo;
	
	@Override
	public Property addProperty(Property property) {
		return propertyRepo.save(property);
	}

}
