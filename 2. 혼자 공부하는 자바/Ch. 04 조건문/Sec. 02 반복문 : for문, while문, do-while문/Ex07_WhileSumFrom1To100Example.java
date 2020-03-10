package sec02;

public class Ex07_WhileSumFrom1To100Example {
	public static void main(String[] args) {
		// 1부터 100까지 합을 출력
		int sum = 0;	// 합계를 저장할 변수
		
		int i = 1;		// 루프 카운터 변수
		
		while(i <= 100) {
			sum += i;
			i++;
		} // while
		System.out.println("1 ~ " + (i - 1) + " 합 : " + sum);
	} // main()
} // class