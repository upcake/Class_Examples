public class Variable02 {
	public static void main(String[] args) {
		// 정수형 변수 a와 b를 선언하고, a에 10, b에 20을 할당하시오.
		int a = 10, b = 20; // 변수의 선언과 동시에 값을 할당 ▶ 초기화, 나열
		
		// 변수 a와  b의 값을 출력
		System.out.println("변수 a의 값 : " + a);
		System.out.println("변수 b의 값 : " + b);
		
		// a의 값을 30으로, b의 값을 40으로 변경하여 출력하시오 ▶ 재할당
		a = 30; // a의 값이 10에서 30으로 변경 (재할당)
		b = 40; // b의 값이 20에서 40으로 변경 (재할당)
		System.out.println("변수 a의 값 : " + a);
		System.out.println("변수 b의 값 : " + b);

	} // main()
} // class
