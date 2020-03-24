package com.hanul.poly02;

public abstract class Ex02_Animal {	// abstract class	▶ 추상 클래스
	public abstract void cry();		// abstract ~~~();	▶ 추상 메소드
}
/*
○ 추상 메소드
	- abstract 키워드를 사용하고 body 블록이 없는 메소드
		# public void ~~~() { ~~~ } ▶  public abstract void ~~~();
	- 메소드의 선언부(정의)만 있고, 구현부(동작)가 없는 메소드
	- 상속받은 자식 클래스에서 부모 클래스가 정의한 메소드를 반드시 재정의 하기 위해
	
○ 추상 클래스 : 다형성을 보장하기 위해서 등장
	- 추상 메소드가 하나라도 있으면 추상 클래스가 된다.
	- 부모의 역할을 수행하기 위해서 UpCasting 용도로 만들어지는 클래스
	- 추상 클래스는 객체를 생성할 수 없다
*/