package com.example.StudentDemo.StudentServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StudentDemo.Entity.Student;
import com.example.StudentDemo.StudentRepository.StudentRepository;
import com.example.StudentDemo.StudentService.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	
	@Autowired
	private StudentRepository studentRepo;
	
	@Override
	public void registration(Student student) {
				studentRepo.save(student);
	}

	@Override
	public Student login(Student student) {
		Student s=studentRepo.findByUserName(student.getUserName());
		if( s!=null && s.getPassword().equals(student.getPassword()) ) {
			return s;
		}		
			return null;
	}

}
