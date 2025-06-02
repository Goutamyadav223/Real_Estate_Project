package com.example.StudentDemo.StudentServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Property;
import com.example.StudentDemo.StudentRepository.PropertyRepo;
import com.example.StudentDemo.StudentService.PropertyService;

@Service
public class PropertyServiceImpl implements PropertyService {

	@Autowired
	private PropertyRepo propertyRepo;

	@Override
	public Property addProperty(Property property) {
		return propertyRepo.save(property);
	}

	@Override
	public List<Property> getPropertiesForCurrentUser(Integer id) {
		return propertyRepo.findByUserId(id);
	}

	public Property getPropertyById(Integer id) {
		return propertyRepo.findById(id).orElse(null);
	}

	@Override
	public List<Property> findByUserIdNot(Integer userId) {
		return propertyRepo.findByUserIdNot(userId);
	}

	@Override
	public Property getProperty(Integer id) {
		return propertyRepo.findById(id).orElse(null);
	}

	


}
