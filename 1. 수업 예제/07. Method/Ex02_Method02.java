public class Ex02_Method02 {
	// getSum() 메소드에 10과 20을 매개 변수로 보내는 호출문 작성
	// 단, return 하시오 ▶ getSum() 결과 값 → main() 전달
	public static void main(String[] args) {
		int a = 10, b = 20;
		int sum = getSum(a, b);	// getSum() 메소드를 호출문 ▶ 실인수
		System.out.println("첫 번째 인수 : " + a);
		System.out.println("두 번째 인수 : " + b);
		System.out.println("두 인수의 합 : " + sum);
	} // main()
	
	// 2개의 정수를 매개 변수로 받아 합(sum)을 구하여 리턴하는 메소드(getSum())를 정의
	public static int getSum(int a, int b) {	// getSum() 메소드를 정의 ▶ 가인수
		int sum = a + b;
		return sum;		// return : 리턴 타입 변경 ▶ void → int
	} // getSum()
} // class