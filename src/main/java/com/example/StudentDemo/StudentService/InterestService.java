package com.example.StudentDemo.StudentService;


import java.util.List;

import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Interest;
import com.example.StudentDemo.dto.InterestDTO;


@Service
public interface InterestService {


	public void interestedUser(InterestDTO dto);
	
	Interest findByPropertyIdAndUsers(Long propertyId, Long senderUserId, Long receiverUserId);

	public List<Interest> getNotificationsForUser(Long id);

	
}
