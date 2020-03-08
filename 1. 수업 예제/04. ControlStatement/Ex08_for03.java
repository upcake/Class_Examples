public class Ex08_for03 {
	public static void main(String[] args) {
		// 1부터 100까지의 정수 중에서 홀수의 합(oddSum)과 짝수의 합(evenSum)을 출력
		// 홀수의 개수(oddCnt)와 짝수의 개수(evenCnt)를 출력
		// for(반복), if(홀수와 짝수를 판단)
		
		int oddSum = 0, evenSum = 0;	// 결과가 저장될 변수를 초기화
		int oddCnt = 0, evenCnt = 0;
		
		for (int i = 1; i < 12346; i++ ) {	// 1부터 100까지 1씩 증가시키면서 반복
			if (i % 2 == 1) {				// 홀수이면 (i % 2 == 1)
				oddSum += i;				// 홀수 누적합 계산 (oddSum = oddSum + i;)
				oddCnt++;					// 홀수 개수를 증가 (oddCnt += 1;)
			} else {						// 짝수이면
				evenSum += i;				// 짝수 누적합 계산 (evenSum = evenSum + i;)
				evenCnt++;					// 짝수 개수를 증가 (evenCnt += 1;)
			} // if
		} // for
		
		System.out.println("홀수의 누적합 : " + oddSum + "\n" + "짝수의 누적합 : " + evenSum);
		System.out.println("홀수의 개수 : " + oddCnt + "\n" + "짝수의 개수 : " + evenCnt);
	} // main()
} // class