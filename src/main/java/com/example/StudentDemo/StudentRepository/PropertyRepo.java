package com.example.StudentDemo.StudentRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.StudentDemo.Entity.Property;

@Repository
public interface PropertyRepo extends JpaRepository<Property, Integer> {

	List<Property> findByUserId(Integer userId);

	List<Property> findByUserIdNot(Integer userId);

	Optional<Property> findById(Long propertyId);

}
