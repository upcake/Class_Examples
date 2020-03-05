public class Operator06 {
	public static void main(String[] args) {
		// 대입연산자 (=) : =(equal)은 같다라는 의미가 아니라 대입(할당)을 의미
		// L-Value = R-Value : R-Value의 값(연산결과)을 L-Value에 대입(할당)
		int a = 10;	// 정수형 변수 a를 선언하고, 값(10)을 할당 → 초기화
		System.out.println("변수 a의 값 : " + a);
		
		int b = a;	// 정수형 변수 b를 선언하고, 값(변수 a의 값)을 할당 → 초기화
		System.out.println("변수 b의 값 : " + b);
		
		b = a + a;	// 재할당
		System.out.println("변수 b의 값 : " + b);
		
		a = a + a;	// 재할당
		System.out.println("변수 a의 값 : " + a);
		
		// 복합대입연산자 : R-Value에서 사용되는 변수와 L-Value에 대입(할당)되는 변수가 동일할 때 사용
		a += a;		// a = a + a;
		System.out.println("변수 a의 값 : " + a);
		
		int x = 10;
		x = x + 100;
		System.out.println("변수 x의 값 : " + x);
		
		int y = 10;
		y += 100;
		System.out.println("변수 y의 값 : " + y);
		
		int z = 100;
		z -= 50;
		System.out.println("변수 z의 값 : " + z); 
	} // main()
} // class