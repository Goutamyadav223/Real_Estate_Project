package com.example.StudentDemo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {

	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	private Integer id;
	
	@Column
	private String name;
	
	@Column
	private String password;
	
	@Column
	private String userName;

	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}



	public User(Integer id, String name, String password, String userName) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.userName = userName;
	}



	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", userName=" + userName + "]";
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
		
}
