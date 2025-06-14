package com.example.StudentDemo.Entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class User {

	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	private Integer id;
	
	@Column
	private String name;
	
	@Column
	private String password;
	
	@Column(unique = true) 
	private String userName;
	
	@Column
	private String mail; 
	
	@Lob
	@Column(name="image" , columnDefinition="LONGBLOB")
	private byte[] image;


	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	



	public User(Integer id, String name, String password, String userName, String mail, byte[] image) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.userName = userName;
		this.mail = mail;
		this.image = image;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", userName=" + userName + ", mail="
				+ mail + ", image=" + Arrays.toString(image) + "]";
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

		
}
