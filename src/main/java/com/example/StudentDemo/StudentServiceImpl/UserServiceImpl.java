package com.example.StudentDemo.StudentServiceImpl;

import java.util.List;
import java.util.Optional;

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
	public boolean getUser(User user) {
	    List<User> users = userRepo.findByUserNameAndPassword(user.getUserName(), user.getPassword());
	    return !users.isEmpty();
	}


	
	
}
