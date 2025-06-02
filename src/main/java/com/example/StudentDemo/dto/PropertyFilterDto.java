package com.example.StudentDemo.dto;

public class PropertyFilterDto {

	private String city;
	private String area;
	private Double price;
	private String type;
	@Override
	public String toString() {
		return "PropertyFilterDto [city=" + city + ", area=" + area + ", price=" + price + ", type=" + type + "]";
	}
	public PropertyFilterDto(String city, String area, Double price, String type) {
		super();
		this.city = city;
		this.area = area;
		this.price = price;
		this.type = type;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public PropertyFilterDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
