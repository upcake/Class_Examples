public class Operator03 {
	public static void main(String[] args) {
		// 비트 연산자 : 개발자의 입장에서 비트를 직접 조작할 수 있다는 장점 → 하드웨어 제어
		// 현재는 거의 사용하지 않는다.
		// ① &	(AND)	: 모두 1일때 	→ 1 출력
		// ② |	(OR)	: 하나라도 1일때 	→ 1 출력
		// ③ ^	(XOR)	: 서로 다를때	→ 1 출력
		int x = 3; // 2진법 : 0011
		int y = 2; // 2진법 : 0010
		
		System.out.println(x & y);	// 출력값 : 2 (0010)
		System.out.println(x | y);	// 출력값 : 3 (0011)
		System.out.println(x ^ y);	// 출력값 : 1 (0001)
		
		/* AND 연산			OR 연산			XOR 연산
		 * 3 : 0011			0011			0011
		 * 2 : 0010			0010			0010
		 * --------			------			-------
		 *     0010 = 2		0011 = 3		0001 = 1
		 */
	} // main()
} // class