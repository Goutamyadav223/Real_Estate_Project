package com.example.StudentDemo.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class InterestDTO {
	
	private Long propertyId;
    private Long senderUserId;
    private Long receiverUserId;
    private String message;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS")
    private LocalDateTime interestTime;


   

	
    @Override
	public String toString() {
		return "InterestDTO [propertyId=" + propertyId + ", senderUserId=" + senderUserId + ", receiverUserId="
				+ receiverUserId + ", message=" + message + ", interestTime=" + interestTime + "]";
	}

	public InterestDTO() {}
   
    public InterestDTO(Long propertyId, Long senderUserId, Long receiverUserId, String message) {
        this.propertyId = propertyId;
        this.senderUserId = senderUserId;
        this.receiverUserId = receiverUserId;
        this.message = message;
    }

    // Getters and Setters
    public Long getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Long propertyId) {
        this.propertyId = propertyId;
    }

    public Long getSenderUserId() {
        return senderUserId;
    }

    public void setSenderUserId(Long senderUserId) {
        this.senderUserId = senderUserId;
    }

    public Long getReceiverUserId() {
        return receiverUserId;
    }

    public void setReceiverUserId(Long receiverUserId) {
        this.receiverUserId = receiverUserId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


	public LocalDateTime getInterestTime() {
		return interestTime;
	}


	public void setInterestTime(LocalDateTime interestTime) {
		this.interestTime = interestTime;
	}
}
