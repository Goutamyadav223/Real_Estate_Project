package com.example.StudentDemo.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Property {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column
	private String city;
	@Column
	private Double price;
	@Column
	private String area;
	@Column
	private String contant;
	@Column
	private String type;
	@Lob
	@Column(name = "image", columnDefinition = "LONGBLOB")
	private byte[] image;

	@ManyToOne(targetEntity=User.class)
	private User user;
	
	public Property(Integer id) {
		super();
		this.id = id;
	}


	public Property(Integer id, String city, Double price, String area, String contant, String type, User user) {
		super();
		this.id = id;
		this.city = city;
		this.price = price;
		this.area = area;
		this.contant = contant;
		this.type = type;
		this.user = user;
	}


	@Override
	public String toString() {
		return "Property [id=" + id + ", city=" + city + ", price=" + price + ", area=" + area + ", contant=" + contant
				+ ", type=" + type + ", user=" + user + "]";
	}


	public Property() {
		super();
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public String getContant() {
		return contant;
	}


	public void setContant(String contant) {
		this.contant = contant;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}

	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}

	
}
