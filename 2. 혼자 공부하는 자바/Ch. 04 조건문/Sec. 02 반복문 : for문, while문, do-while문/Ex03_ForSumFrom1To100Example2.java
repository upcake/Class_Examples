package sec02;

public class Ex03_ForSumFrom1To100Example2 {
	public static void main(String[] args) {
		// 1부터 100까지 합을 출력
		int sum = 0;	// 합계 변수
		
		int i = 0;		// 루프 카운터 변수
		for(i = 1; i <= 100; i++) {
			sum += i;
		} // for
		System.out.println("1 ~ " + (i - 1) + " 합 : " + sum);
	} // main()
} // class