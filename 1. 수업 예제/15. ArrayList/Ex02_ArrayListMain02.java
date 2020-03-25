import java.util.ArrayList;

import com.hanul.array.Ex01_Test;

public class Ex02_ArrayListMain02 {
	public static void main(String[] args) {
		// ArrayList<> 객체 생성(list) → Object : 모든 객체(클래스)
		ArrayList<Object> list1 = new ArrayList<Object>();
		list1.add(new Integer(100));	// Element (요소)는 반드시 객체(클래스 타입)
		list1.add(new String("Apple"));
		list1.add(new Ex01_Test());
		
		for (int i = 0; i < list1.size(); i++) {
			Object obj = list1.get(i);				//list1의 i번째 index 값을 가져온다 ▶ Object Type
			if(obj instanceof Integer) {			// obj의 타입이 Integer 타입이면
				System.out.println((Integer)obj);	// Integer 타입으로 Casting 후 출력
			} else if(obj instanceof String) {		// obj의 타입이 String 타입이면
				System.out.println((String)obj);	// String 타입으로 Casting 후 출력
			} else if(obj instanceof Ex01_Test) {	// obj의 타입이 Ex01_Test 타입이면
				((Ex01_Test)obj).display();			// Ex01_Test 타입으로 Casting 후 출력
			} // if else if
		} // for
		
		System.out.println("===============================");
		
		// ArrayList<> 객체 생성(list2) : 특정 클래스(Ex01_Test.java)만 저장하기 위해 타입 제한
		ArrayList<Ex01_Test> list2 = new ArrayList<>();
		list2.add(new Ex01_Test());
//		list2.add(new Integer(100));	// 오류
		
		list2.get(0).display();
		
	} // main()
} // class