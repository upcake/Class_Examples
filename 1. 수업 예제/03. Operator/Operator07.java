public class Operator07 {
	public static void main(String[] args) {
		int a = 10;
		String result = a == 10 ? "맞다" : "틀리다";
		System.out.println(result);
		System.out.println(a == 10 ? "맞다" : "틀리다");
		
		int b = 10;
		if(b == 10) {
			System.out.println("맞다");
		} else {
			System.out.println("틀리다");
		} // if
	} // main()
} // class

/*
○ 삼항연산자(조건연산자)
 - 3개의 항으로 구성된다.
 - 간단한 조건식을 작성할 경우 편리하다.
 - 조건식 ? 참값 : 거짓값;
*/