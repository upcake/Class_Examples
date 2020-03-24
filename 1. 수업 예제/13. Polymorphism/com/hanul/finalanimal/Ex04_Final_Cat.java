package com.hanul.finalanimal;

public class Ex04_Final_Cat extends Ex04_Final_Animal {
	@Override
	public void cry() {
		super.cry();
		System.out.println("야옹");
	}
	
	public void grooming() {
		System.out.println(name + "가 그루밍한다.:");
	}
}