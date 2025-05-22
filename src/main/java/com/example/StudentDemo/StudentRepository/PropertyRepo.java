package com.example.StudentDemo.StudentRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.StudentDemo.Entity.Property;

@Repository
public interface PropertyRepo extends JpaRepository<Property,Integer> {

}
