package com.hanul.poly01;

public class Ex01_Dog extends Ex01_Animal {		// 하위 클래스 : Animal Class 상속
	
	@Override	// 재정의 : 부모 클래스가 정의한 메소드를 수정
	public void cry() {
		System.out.println("멍멍");
	}
}
