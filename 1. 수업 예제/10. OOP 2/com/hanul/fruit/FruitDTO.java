package com.hanul.fruit;

public class FruitDTO {
	// 멤버 변수 선언
	private String name;	// 이름
	private int cost, quantity, price;	// 단가, 수량, 가격
	
	// 기본 생성자 메소드
	public FruitDTO() {}
	
	// 생성자 메소드 초기화
	public FruitDTO(String name, int cost, int quantity) {
		super();
		this.name = name;
		this.cost = cost;
		this.quantity = quantity;
	}
	
	// Getters and Setters 메소드
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

} // class
