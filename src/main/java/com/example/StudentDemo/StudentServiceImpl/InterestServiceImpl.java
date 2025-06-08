package com.example.StudentDemo.StudentServiceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Interest;
import com.example.StudentDemo.Entity.Property;
import com.example.StudentDemo.Entity.User;
import com.example.StudentDemo.StudentRepository.InterestRepo;
import com.example.StudentDemo.StudentRepository.PropertyRepo;
import com.example.StudentDemo.StudentRepository.UserRepo;
import com.example.StudentDemo.StudentService.InterestService;
import com.example.StudentDemo.dto.InterestDTO;

@Service
public class InterestServiceImpl implements InterestService{

	@Autowired
	InterestRepo interestRepo;
	
	@Autowired
	PropertyRepo propertyRepo;
	
	@Autowired
	UserRepo userRepo;
	
	

	
	@Override
	public void interestedUser(InterestDTO dto) {
    	Interest interest = new Interest();

    	interest.setMessage(dto.getMessage());

    	Property property = propertyRepo.findById(dto.getPropertyId()).orElse(null);
    	interest.setProperty(property);
  
    	User sender = userRepo.findById(dto.getSenderUserId()).orElse(null);
    
    	User receiver = userRepo.findById(dto.getReceiverUserId()).orElse(null);

    	interest.setSenderUser(sender);
    	interest.setReceiverUser(receiver);

    	interestRepo.save(interest);
	}
	@Override
	public Interest findByPropertyIdAndUsers(Integer propertyId, Integer senderUserId, Integer receiverUserId) {
	    return interestRepo.findByPropertyIdAndUsers(propertyId, senderUserId, receiverUserId).orElse(null);
	}	


	public List<Interest> getNotificationsForUser(Integer userId) {
	    return interestRepo.findByReceiverUserId(userId);
	}
	

}
