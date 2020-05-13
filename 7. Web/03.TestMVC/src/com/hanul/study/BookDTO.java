package com.hanul.study;

import java.io.Serializable;

public class BookDTO implements Serializable {
	private String title;
	private String auth;
	private String isbn;
	private String comp;
	private int cost;
	private int su;
	private int price;
	
	public BookDTO() {}

	public BookDTO(String title, String auth, String isbn, String comp, int cost, int su, int price) {
		super();
		this.title = title;
		this.auth = auth;
		this.isbn = isbn;
		this.comp = comp;
		this.cost = cost;
		this.su = su;
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getComp() {
		return comp;
	}

	public void setComp(String comp) {
		this.comp = comp;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}