public class Ex09_while {
	public static void main(String[] args) {
	// 1부터 100까지의 누적합(forSum)을 구하시오 : for
		int forSum = 0;
		for(int i = 1; i < 101; i++) {
			forSum += i;
		} // for
		System.out.println("for 누적합 : " + forSum);

	// 1부터 100까지의 누적합(whileSum)을 구하시오 : while
		int whileSum = 0;
		int i = 1;
		while(i < 101) {
			whileSum += i;
			i++;
		} // while
		System.out.println("while 누적합 : " + whileSum);
		
	// while문은 무한 loop에 빠지지 않도록 아래와 같이 작성하는 것을 권장한다.
//		whileSum = 0;
//		i = 1;
//		while(true) {			
//			whileSum += i;
//			i++;
//		} if(i > 100) {
//			break;
//		} // while
	} // main()
} // class

/*
★ while : 반복 횟수를 모를 경우 사용(선조건 → 후처리)

초기값 설정;
while(조건식){
	실행문;
	증감값;
}
*/