public class Ex10_do_while {
	public static void main(String[] args) {
		// 1부터 100까지의 정수 중에서 짝수의 합(evenSum)을 구하시오 : while, if
		int evenSum = 0;
		
		int i = 1;									// int i = 1;
		while(i < 101) {							// do {
			if(i % 2 == 0) {						// 
				evenSum += i;						//
			} // if									//
			i++;									//
		} // while									//} while(i < 101);
		System.out.println("while 짝수의 합 : " + evenSum);
		
		//1부터 100까ㅣㅈ의 정수 중에서 짝수의 합(evenSum)을 구하시오 : do_while, if
		evenSum = 0;
		i = 1;
		do {
			if(i % 2 ==0) {
				evenSum += i;
			} // if
			i++;
		} while(i <= 100);
		System.out.println("do_while 짝수의 합 : " + evenSum);
	} // main()
} // class

/*
 ○ do ~~ while : 선처리 → 후조건, 자주 쓰이지는 않는다.
 	※ 조건이 처음부터 거짓이더라도 실행문을 최소 1번은 실행
 	
 	초기값;
 	do{
 		실행문;
 		증감값;
 	} while(조건식);
 
 */
 