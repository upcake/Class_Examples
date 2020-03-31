package sec01;

public class Ex01_StudentExample {
	public static void main(String[] args) {
		Ex01_Student s1 = new Ex01_Student();
		System.out.println("s1 변수가 Student 객체를 참조합니다.");
		
		Ex01_Student s2 = new Ex01_Student();
		System.out.println("s2 변수가 또 다른 Student 객체를 참조합니다.");
	} // main()
} // class