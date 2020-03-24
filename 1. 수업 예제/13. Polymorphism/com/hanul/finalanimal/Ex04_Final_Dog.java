package com.hanul.finalanimal;

public class Ex04_Final_Dog extends Ex04_Final_Animal {
	@Override
	public void cry() {	// cry() 메소드를 재정의
		super.cry();	// 상위 클래스의 cry() 메소드를 동작시킨다.
		System.out.println("멍멍");
	}

	public void run() {
		System.out.println(name + "가 뛴다.");
	}
}
