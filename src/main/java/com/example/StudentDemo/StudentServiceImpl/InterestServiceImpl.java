package com.example.StudentDemo.StudentServiceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Interest;
import com.example.StudentDemo.StudentRepository.InterestRepo;
import com.example.StudentDemo.StudentService.InterestService;
import com.example.StudentDemo.dto.InterestDTO;

@Service
public class InterestServiceImpl implements InterestService{

	@Autowired
	InterestRepo interestRepo;

	@Override
	public void interestedUser(InterestDTO dto) {
		Interest interest = new Interest();

        interest.setPropertyId(dto.getPropertyId());
        interest.setSenderUserId(dto.getSenderUserId());
        interest.setReceiverUserId(dto.getReceiverUserId());   // save inerested user in database by that controller
        interest.setMessage(dto.getMessage());
        interest.setTimestamp(dto.getInterestTime());

        interestRepo.save(interest);
		
	}
	
	@Override
	public Interest findByPropertyIdAndUsers(Long propertyId, Long senderUserId, Long receiverUserId) {
	    return interestRepo.findExistingInterest(propertyId, senderUserId, receiverUserId);
	}

	@Override
	public List<Interest> getNotificationsForUser(Long id) {
		 return interestRepo.findByReceiverUserIdOrderByTimestampDesc(id);
	}



}
