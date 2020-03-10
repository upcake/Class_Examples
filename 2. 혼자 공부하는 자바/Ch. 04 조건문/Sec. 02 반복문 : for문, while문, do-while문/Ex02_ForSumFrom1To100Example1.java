package sec02;

public class Ex02_ForSumFrom1To100Example1 {
	public static void main(String[] args) {
		// 1부터 100까지 합을 출력
		int sum = 0;	// 합계 변수
		
		for(int i = 1; i <= 100; i++) {
			sum += i;
		} // for
		System.out.println("1 ~ 100 합 : " + sum);
	} // main ()
} // class