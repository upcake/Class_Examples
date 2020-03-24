package com.hanul.finalanimal;

public class Ex04_Final_Tiger extends Ex04_Final_Animal {
	@Override
	public void cry() {
		super.cry();
		System.out.println("어흥");
	}
	
	public void hunter() {
		System.out.println(name + "가 사냥을 한다.");
	}
}
