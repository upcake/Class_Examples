package sec02;

public class Exam03_StringEx {
	public static void main(String[] args) {
		String name = "Ja" + "va";
		String str 	= name + 8.0;
		
		System.out.println(name);
		System.out.println(str);
		System.out.println(7 + " ");
		System.out.println(" " + 7);
		System.out.println(7 + "");
		System.out.println("" + 7);
		System.out.println("" + "");
		System.out.println(7 + 7 + "");
		System.out.println("" + 7 + 7); 
		// 덧셈 연산자는 왼쪽에서 오른쪽으로 연산을 수행하는데, 빈 문자열을 먼저 더해줌으로써 7과 같은 기본형 타입의 값이 문자열로 변환
	}
}
