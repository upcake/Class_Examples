package com.hanul.poly02;

public class Ex02_Cat extends Ex02_Animal {
	@Override
	public void cry() {
		System.out.println("야옹");
	}
	
	public void night() {	// Ex02_Cat 클래스만 가지고 있는 고유한 메소드 (알파 상태)
		System.out.println("고양이는 야행성이다.");
	}
}