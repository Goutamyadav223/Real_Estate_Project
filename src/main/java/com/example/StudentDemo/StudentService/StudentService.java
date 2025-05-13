package com.example.StudentDemo.StudentService;

import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Student;

@Service
public interface StudentService {

	public void registration(Student student);
	public Student login(Student student);
	
}
