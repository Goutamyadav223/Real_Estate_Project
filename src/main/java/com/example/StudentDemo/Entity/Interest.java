package com.example.StudentDemo.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class Interest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String message;

    @ManyToOne
    @JoinColumn(name = "sender_user_id")
    private User senderUser;

    @ManyToOne
    @JoinColumn(name = "receiver_user_id")
    private User receiverUser;

    @ManyToOne
    @JoinColumn(name = "property_id")
    private Property property;

    
    
    
    
    
    
	public Interest() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Interest [id=" + id + ", message=" + message + ", senderUser=" + senderUser + ", receiverUser="
				+ receiverUser + ", property=" + property + "]";
	}

	public Interest(Integer id, String message, User senderUser, User receiverUser, Property property) {
		super();
		this.id = id;
		this.message = message;
		this.senderUser = senderUser;
		this.receiverUser = receiverUser;
		this.property = property;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getSenderUser() {
		return senderUser;
	}

	public void setSenderUser(User senderUser) {
		this.senderUser = senderUser;
	}

	public User getReceiverUser() {
		return receiverUser;
	}

	public void setReceiverUser(User receiverUser) {
		this.receiverUser = receiverUser;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}
}
