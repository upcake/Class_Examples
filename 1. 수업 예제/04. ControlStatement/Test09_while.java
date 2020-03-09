public class Test09_while {
	public static void main(String[] args) {
		// 1부터 100까지의 정수 중에서 짝수의 합(evenSum)을 구하시오 : for, if
		int evenSum = 0;
		for(int i = 1; i < 101; i++) {
			if(i % 2 == 0) {
				evenSum += i;
			} // if
		} // for
		System.out.println("for 짝수의 합 : " + evenSum);
		
		// 1부터 100까지의 정수 중에서 짝수의 합(evenSum)을 구하시오 : while
		evenSum = 0;
		int i = 1;
		while(true) {
//			i++;				//i++를 먼저 하면 안됨
			if(i % 2 == 0) {
				evenSum += i;
			} if(i > 100) {
				break;
			} // if
			i++;				//i++를 if문보다 나중에 쓸 것
		} // while
		System.out.println("while 짝수의 합 : " + evenSum);
		
		// 정답
		evenSum = 0;
		i = 1;
		while(i < 101) {
			if(i % 2 == 0) {
				evenSum += i;
			} // if
			i++;
		} // while
		System.out.println("while 짝수의 합 : " + evenSum);
	} // main()
} // class