public class Ex01_Product {	// Class : 특성(상태 정보)과 동작(행위 정보)이 기술(구현)
	// 멤버 변수(필드) 선언 : 상태 정보 ▶ DTO Class, VO Class
	int num;
	String name;
	
	// 멤버메소드 정의 : 행위 정보 ▶ DAO Class
	public void display() {
		System.out.println("num : " + num);
		System.out.println("name : " + name);
	} // display()
} // class