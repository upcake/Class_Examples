import java.util.ArrayList;

public class Ex03_ArrayListMain03 {
	public static void main(String[] args) {
		// ArrayList<> list에 정수 10, 20, 30, 40, 50을 저장(add())하고 출력(get())
//		ArrayList<Object> list = new ArrayList<>();		// Object : 출력시 Casting 필요
		ArrayList<Integer> list = new ArrayList<>(); 	// Integer 제한 : Casting 불필요
		
		list.add(new Integer(10));	// 정상적인 구현 방식
		list.add(new Integer(20));	// new 키워드(연산자)로 객체화(객체 생성)
		list.add(30);				// int → Integer ▶ AutoBoxing
		list.add(40);				// 컴파일러(JVM)가 자동으로 처리해줌
		list.add(50);				// 
		
		System.out.println((Integer)list.get(0));	// Casting
		System.out.println((Integer)list.get(1));
		System.out.println(list.get(2));	// 원래 타입으로 변환 ▶ AutoUnBoxing
		System.out.println(list.get(3));
		System.out.println(list.get(4));
	} // main()
} // class