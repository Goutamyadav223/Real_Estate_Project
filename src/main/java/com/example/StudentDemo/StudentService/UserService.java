package com.example.StudentDemo.StudentService;

import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.User;

@Service
public interface UserService {

	public void createUser(User user);
	public boolean getUser(User user);
}
