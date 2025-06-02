package com.example.StudentDemo.StudentRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.StudentDemo.Entity.Interest;

@Repository
public interface InterestRepo extends JpaRepository<Interest,Integer>{
	
	@Query("SELECT i FROM Interest i WHERE i.propertyId = :propertyId AND i.senderUserId = :senderUserId AND i.receiverUserId = :receiverUserId")
	Interest findExistingInterest(@Param("propertyId") Long propertyId,
	                              @Param("senderUserId") Long senderUserId,
	                              @Param("receiverUserId") Long receiverUserId);
	
	List<Interest> findByReceiverUserIdOrderByTimestampDesc(Long receiverUserId);

	
}
