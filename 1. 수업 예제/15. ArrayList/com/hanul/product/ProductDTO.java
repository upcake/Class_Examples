package com.hanul.product;

public class ProductDTO {
	private String name;
	private int cost;
	private int quantity;
	private int price;
	
	public ProductDTO(){}

	public ProductDTO(String name, int cost, int quantity) {
		super();
		this.name = name;
		this.cost = cost;
		this.quantity = quantity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}