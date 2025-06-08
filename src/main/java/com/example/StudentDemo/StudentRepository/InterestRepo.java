package com.example.StudentDemo.StudentRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.StudentDemo.Entity.Interest;

@Repository
public interface InterestRepo extends JpaRepository<Interest,Long>{
	
	  @EntityGraph(attributePaths = {"senderUser", "receiverUser"})
	    List<Interest> findByReceiverUserId(Integer userId);

	    

	    @Query("SELECT i FROM Interest i WHERE i.property.id = :propertyId AND i.senderUser.id = :senderUserId AND i.receiverUser.id = :receiverUserId")
	    Optional<Interest> findByPropertyIdAndUsers(@Param("propertyId") Integer propertyId,
	                                                @Param("senderUserId") Integer senderUserId,
	                                                @Param("receiverUserId") Integer receiverUserId);

	
}
