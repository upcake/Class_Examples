package com.hanul.poly02;

public class Ex02_Dog extends Ex02_Animal {	// 추상 클래스를 상속 ▶ 추상 메소드의 재정의가 필수
	
	@Override
	public void cry() {
		System.out.println("멍멍");
	}
}