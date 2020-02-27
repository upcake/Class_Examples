public class Variable05 {
	public static void main(String[] args) {
		// 문자 데이터 타입 : char(2Byte) ▶ 하나의 글자만 저장 : 유니코드
		// 값을 할당(대입)할 때는 작은따옴표를 사용한다.
		char a = 'A';
		char b = '가';
		char c = '★';
		System.out.println("변수 a의 값 : " + a);
		System.out.println("변수 b의 값 : " + b);
		System.out.println("변수 c의 값 : " + c);
		
		// String : 문자, 문자열을 저장할 수 있는 클래스 ▶ 참조형 자료(Reference Type) → 4Byte
		// 값을 할당(대입)할 때는 쌍따옴표를 사용한다.
		String str1 = "ABCD";
		String str2 = "가나다라";
		System.out.println("변수 str1의 값 : " + str1);
		System.out.println("변수 str2의 값 : " + str2);
		
		String str3 = "null"; // 참조형 타입을 초기화할땐 null을 사용한다.
	} // main()
} // class