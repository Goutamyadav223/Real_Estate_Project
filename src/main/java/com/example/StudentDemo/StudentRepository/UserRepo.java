package com.example.StudentDemo.StudentRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.StudentDemo.Entity.User;

@Repository
public interface UserRepo extends JpaRepository<User,Integer>{

	 List<User> findByUserNameAndPassword(String userName, String password);
	 User findByUserName(String userName);
}
