package com.example.StudentDemo.Entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Interest {

	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   private Long id;

	    private Long propertyId;

	    @Column
	    private Long senderUserId;

	    @Column
	    private Long receiverUserId;

	    @Column
	    private String message;

	    @Column
	    private LocalDateTime timestamp;

	    
	    
	    
	    
		public Interest() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Interest(Long id, Long propertyId, Long senderUserId, Long receiverUserId, String message,
				LocalDateTime timestamp) {
			super();
			this.id = id;
			this.propertyId = propertyId;
			this.senderUserId = senderUserId;
			this.receiverUserId = receiverUserId;
			this.message = message;
			this.timestamp = timestamp;
		}

		@Override
		public String toString() {
			return "Interest [id=" + id + ", propertyId=" + propertyId + ", senderUserId=" + senderUserId
					+ ", receiverUserId=" + receiverUserId + ", message=" + message + ", timestamp=" + timestamp + "]";
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

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

		public LocalDateTime getTimestamp() {
			return timestamp;
		}

		public void setTimestamp(LocalDateTime timestamp) {
			this.timestamp = timestamp;
		}
	   
	    
	    
}
