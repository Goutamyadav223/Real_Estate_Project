package com.example.StudentDemo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Student {
		
	@Id
	private int id;
	@Column
	private String name;
	@Column
	private String userName;
	@Column
	private String password;
	
	public Student() {}
	
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", userName=" + userName + ", password=" + password + "]";
	}

	public Student(int id, String name, String userName, String password) {
		super();
		this.id = id;
		this.name = name;
		this.userName = userName;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
}
