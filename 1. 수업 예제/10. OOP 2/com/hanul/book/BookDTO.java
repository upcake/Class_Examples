package com.hanul.book;

public class BookDTO {
	// ① 멤버 변수 선언
	private String title;	// 제목
	private String name;	// 저자
	private String company;	// 출판사
	private int	cost;		// 단가
	private int	quantity;	// 수량
	private	int price;		// 가격
	
	// ② 기본 생성자 메소드
	public BookDTO() {}
	
	// ③ 생성자 메소드 초기화 : price는 입력하는게 아니라 5개만 초기화 함
	public BookDTO(String title, String name, String company, int cost, int quantity) {
		super();
		this.title = title;
		this.name = name;
		this.company = company;
		this.cost = cost;
		this.quantity = quantity;
	}

	// ④ Getters & Setters 메소드
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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
