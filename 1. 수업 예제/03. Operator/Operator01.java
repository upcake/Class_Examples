public class Operator01 {
	public static void main(String[] args) {
		// 산술 연산자 : +, -, *, /
		// %(나머지 연산) : 짝수/홀수, 배수의 판단에 사용
		int a = 10, b= 3;
		
		int addResult = a + b;	// 덧셈
		int subResult = a - b;	// 뺄셈
		int mulResult = a * b;	// 곱셈
		int divResult = a / b;	// 나눗셈
		int modResult = a % b;	// 나머지
		
		System.out.println(addResult);	// 출력값 : 13 
		System.out.println(subResult);	// 출력값 : 7
		System.out.println(mulResult);	// 출력값 : 30
		System.out.println(divResult);	// 출력값 : 3
		System.out.println(modResult);	// 출력값 : 1
		
		int x = 3, y = 5;
		System.out.println("x + y = " + x + y);		// x + y = 35
		System.out.println("x + y = " + (x + y));	// x + y = 8
		System.out.println(x + y + " = x + y");		// 8 = x + y
//		System.out.println("x - y = " + x - y);		// 문자열 - 숫자가 되서 에러
		System.out.println("x - y = " + (x - y));	// x - y = -2
		System.out.println(x - y + " = x - y");		// -2 = x - y		
	} // main()
} // class