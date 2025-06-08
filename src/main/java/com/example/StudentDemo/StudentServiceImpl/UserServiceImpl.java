package com.example.StudentDemo.StudentServiceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.User;
import com.example.StudentDemo.StudentRepository.UserRepo;
import com.example.StudentDemo.StudentService.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepo userRepo;
	
	@Override
	public void createUser(User user) {
		userRepo.save(user);
	}

	@Override
	public User getUser(User user) {
	    User user1=userRepo.findByUserName(user.getUserName());
	    return user1;
	}

	@Override
	public User findById(Integer id) {
		return userRepo.findById(id).orElse(null);
	}

	@Override
	public User findByUserName(String userName) {
		return userRepo.findByUserName(userName);
	}

}
