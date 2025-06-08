package com.example.StudentDemo.StudentService;


import java.util.List;

import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Interest;
import com.example.StudentDemo.dto.InterestDTO;


@Service
public interface InterestService {


	public List<Interest> getNotificationsForUser(Integer id);
	
	public void interestedUser(InterestDTO dto);

	public Interest findByPropertyIdAndUsers(Integer propertyId, Integer senderUserId, Integer receiverUserId);

}
