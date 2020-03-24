package com.hanul.poly03;

public class Ex03_TV implements Ex03_RemoCon { // interface의 상속은 implements 키워드 사용

	@Override
	public void volUp() {
		System.out.println("TV 소리를 올린다.");
	}

	@Override
	public void volDown() {
		System.out.println("TV 소리를 내린다.");
	}

	@Override
	public void internet() {
		System.out.println("인터넷 접속 기능이 있다.");
	}	

} // class