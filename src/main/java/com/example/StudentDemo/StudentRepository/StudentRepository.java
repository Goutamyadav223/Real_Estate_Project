package com.example.StudentDemo.StudentRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.StudentDemo.Entity.Student;
@Repository
public interface StudentRepository extends JpaRepository<Student,Integer>{
		public Student findByUserName(String userName);
}
