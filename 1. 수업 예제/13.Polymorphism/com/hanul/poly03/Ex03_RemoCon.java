package com.hanul.poly03;

public interface Ex03_RemoCon {
	public abstract void volUp();	// 추상 메소드 : abstract 키워드, 메소드(), 바디 블록 X
	public abstract void volDown();
	public void internet();	// abstract 키워드가 생략되어도 interface 내에서 선언된 메소드는 모두 추상 메소드다.
}

/*
○ Interface(인터페이스)
	- JAVA는 단일 상속만 허용 → 다중 상속의 이점을 활용할 필요성 ▶ Interface 구현
	- 모든 메소드는 추상 메소드로만 구성된다.
	- 상속 받은 하위 클래스는 반드시 재정의(Override)가 필수
	- Interface의 상속은 implements 키워드 사용
	
	public class A { ~~body~~ } ▶ 일반적인 클래스
	public class A extends B { ~~body~~ } ▶ A는 B를 상속받는다 (A → B)
	public class A extends B implements C { ~~body~~ } ▶ A(하위)는 B(상위)를 상속받고, C(인터페이스)의 기능을 구현하였다.  
	public class A extends B implements C, D, E { ~~body~~ } ▶ A(하위)는 B(상위)를 상속받고, C와 D와 E의 기능을 구현하였다.  
	



*/