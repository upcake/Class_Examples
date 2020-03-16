public class Ex05_Method05 {
	public static void main(String[] args) {
		getSum(10, 20);			// getSum(int, int) 메소드 호출
		System.out.println("==============");
		getSum(10, 20, 30);		// getSum(int, int, int) 메소드 호출
		System.out.println("==============");
		getSum(10.5, 20.3);		// getSum(double, double) 메소드 호출
		System.out.println("==============");
		getSum(10, 10.5);		// getSum(double, double) 메소드 호출
	} // main()
	
	public static void getSum(int x, int y) {	//getSum(int, int) 메소드 정의
		System.out.println("첫 번째 인수 : " + x);
		System.out.println("두 번째 인수 : " + y);
		System.out.println("두 인수의 합 : " + (x + y));
	} // getSum()
	
	public static void getSum(int x, int y, int z) {	// getSum(int, int, int) 메소드 호출
		System.out.println("첫 번째 인수 : " + x);
		System.out.println("두 번째 인수 : " + y);
		System.out.println("세 번째 인수 : " + z);
		System.out.println("두 인수의 합 : " + (x + y + z));
	} // getSum()
	
	public static void getSum(double x, double y) {		// getSum(double, double) 메소드 정의
		System.out.println("첫 번째 인수 : " + x);
		System.out.println("두 번째 인수 : " + y);
		System.out.println("두 인수의 합 : " + (x + y));
	} // getSum()
} // class

/*
★ 메소드 오버로딩(OverLoading)
	- 클래스 안에 같은 이름을 가지고 있는 메소드를 여러 개 선언(정의)
	- 매개 변수의 개수가 달라야 한다.
	- 매개 변수가 같을 경우에는 매개 변수 데이터 타입이 달라야 한다.
*/