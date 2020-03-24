public class Ex04_static02 {
	
	// 기본 생성자 메소드 : 객체가 생성될 때 호출되는 메소드
//	public Ex04_static02() {}	// 생략 가능 : 컴파일러(JVM)가 자동 생성
	private Ex04_static02() {}	// 접근 제어자가 private ▶ 객체를 생성할 수 없다
	
	public static void display1() {
		System.out.println("Display1");
	} // display1()
	
	public void display2() {
		System.out.println("Display2");
	} // display2()
} // class