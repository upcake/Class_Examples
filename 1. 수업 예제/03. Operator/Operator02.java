public class Operator02 {
	public static void main(String[] args) {
		// 증감 연산자 : ++(증가), --(감소) ▶ 반복문에서 많이 사용
		// 단항 연산자 : 별도의 연산 결과를 처리하지 않은 연산자
		// 연산자의 위치가 변수의 앞인지 뒤인지에 따라 결과가 다르다.
		int a= 0;
		int b = 10;
		System.out.println(++a);	// 출력값 : 1
		System.out.println(--b);	// 출력값 : 9
		System.out.println(a);		// 출력값 : 1
		System.out.println(b);		// 출력값 : 9
		
		int c = 0;
		int d = 10;
		System.out.println(c++);	// 출력값 : 0
		System.out.println(d--);	// 출력값 : 10
		System.out.println(c);		// 출력값 : 1
		System.out.println(d);		// 출력값 : 9
		
		//문제. x = 5, y = 10일 경우 'x++ + ++x + y++'의 결과와
		//연산이 수행된 후 'x + y'의 결과는?
		int x = 5, y = 10;
		int z = x++ + ++x + y++;
		System.out.println(z);		// 출력값 : 22 (5 + 7 + 10)
		System.out.println(x + y);	// 출력값 : 18 (7 + 11)
		System.out.println(x);
		System.out.println(y);
		
		/*
		  연산		출력	메모리
		 x++	5	6
		 ++x	7	7
		 y++	10	11
		 */
		
		// Ctrl + / 해당 라인 주석
		// Ctrl + Shift + / 해당 블록 전체 주석
		// Ctrl + Shift + \ 해당 블록 전체 주석 해제
	} // main()
} // class