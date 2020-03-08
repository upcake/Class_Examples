public class Test08_for03 {
	public static void main(String[] args) {
		// 1부터 100까지의 정수 중에서 3의 배수의 누적합(sum)과 3의 배수의 개수(cnt)를 출력
		int sum = 0, cnt = 0;
		
		for(int i = 1; i < 101; i++) {
			if(i % 3 == 0) {
				sum += i;
				cnt++;
			} // if
		} // for
		System.out.println("3의 배수의 누적합 : " + sum);
		System.out.println("3의 배수의 개수 : " + cnt);
		
		// 1부터 100까지의 정수 중에서 3의 배수를 출력하시오.
		// 단, 한 줄에 5개의 값을 출력하시오
		int printCnt = 0;					// 출력 횟수를 저장할 변수를 초기화
		for(int i = 1; i <= 100; i++) {
			if(i % 3 == 0) {
				printCnt++;					// 출력 횟수 증가
				if(i < 10) {				// 출력 값이 한 자리수이면
					System.out.print("0" + i + " ");
				} else {
					System.out.print(i + " ");
				} // if
				if(printCnt % 5 == 0) {		// 출력 횟수가 5번째이면
					System.out.println();	// 줄바꿈
				} // if
			} // if
		} // for
	} // main()
} // class