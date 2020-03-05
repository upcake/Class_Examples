public class Operator05 {
	public static void main(String[] args) {
		// 논리 연산자 : 여러 개의 조건을 판단 ▶ 조건식에 많이 사용
		// 연산의 결과는 true, false 반환
		// 조건 A && 조건 B : 조건 A도 참이고 조건 B도 참일 경우 		→ true 출력
		// 조건 A || 조건 B : 조건 A 또는 조건 B중에서 하나라도 참일 경우 	→ true 출력
		// AND 조건(모두 만족)	: && 	▶ ~~이면서, ~~이고
		// OR 조건(하나라도 만족)	: || 	▶ ~~이거나, ~~또는
		System.out.println(10 > 5 && 20 > 5);	// true && true 	→ true
		System.out.println(10 > 5 && 5 > 20);	// true && false	→ false
		System.out.println(5 > 10 && 20 > 5);	// false && true	→ false
		System.out.println(5 > 10 && 5 > 20);	// false && false	→ false
		
		System.out.println(10 > 5 || 20 > 5);	// true || true 	→ true
		System.out.println(10 > 5 || 5 > 20);	// true || false	→ true
		System.out.println(5 > 10 || 20 > 5);	// false || true	→ true
		System.out.println(5 > 10 || 5 > 20);	// false || false	→ false
	} // main()
} // class