package com.example.StudentDemo.dto;

public class InterestDTO{
	
	 private Integer propertyId;
	    private Integer senderUserId;
	    private Integer receiverUserId;
	    private String message;
	    
	    
		@Override
		public String toString() {
			return "InterestDTO [propertyId=" + propertyId + ", senderUserId=" + senderUserId + ", receiverUserId="
					+ receiverUserId + ", message=" + message + "]";
		}
		public InterestDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public InterestDTO(Integer propertyId, Integer senderUserId, Integer receiverUserId, String message) {
			super();
			this.propertyId = propertyId;
			this.senderUserId = senderUserId;
			this.receiverUserId = receiverUserId;
			this.message = message;
		}
		public Integer getPropertyId() {
			return propertyId;
		}
		public void setPropertyId(Integer propertyId) {
			this.propertyId = propertyId;
		}
		public Integer getSenderUserId() {
			return senderUserId;
		}
		public void setSenderUserId(Integer senderUserId) {
			this.senderUserId = senderUserId;
		}
		public Integer getReceiverUserId() {
			return receiverUserId;
		}
		public void setReceiverUserId(Integer receiverUserId) {
			this.receiverUserId = receiverUserId;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}

		  
}