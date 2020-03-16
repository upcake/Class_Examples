public class Test01_Method01 {
	public static void main(String[] args) {
/*		// 1부터 50까지의 누적합 :  a ~ b
		int a = 1, b = 50, sum = 0;
		for(int i = a; i <= b; i++) {
			sum += i;
		}
		System.out.println(a + "부터 " + b + "까지의 누적합 : " + sum);
		
		// 51부터 100까지의 누적합 : c ~ d
		int c = 51, d = 100;
		sum = 0;
		for(int i = c; i <= d; i++) {
			sum += i;
		}
		System.out.println(c + "부터 " + d + "까지의 누적합 : " + sum);*/
		
		int a = 1, b = 50, c= 51, d = 100; // 인수 값을 초기화
		getSum(a, b);	// 1 ~ 50 누적합을 구하는 메소드(getSum())를 호출 ▶ 실인수
		getSum(c, d);	// 51 ~ 100 누적합을 구하는 메소드(getSum())를 호출 ▶ 실인수
		getSum(a, d);	// 1 ~ 100 누적합을 구하는 메소드(getSum())를 호출 ▶ 실인수
		getSum(10, 30);
	} // main()
	
	// 두 개의 정수를 전달받아 누적합(sum)을 구하는 메소드(getSum())를 정의
	public static void getSum(int x, int y) {	// getSum() 메소드를 정의 ▶ 가인수
		int sum = 0;
		for(int i = x; i <= y; i++) {
			sum += i;
		}
		System.out.println(x + "부터 " + y + "까지의 누적합 : " + sum);
	} // getSum()
} // class