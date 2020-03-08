public class Ex01_if {
	public static void main(String[] args) {
		int a = 10;
		if(a % 2 == 0) {	// a를 2로 나눈 나머지 값이 0과 같다 ▶ 짝수
			System.out.println("입력값은 " + a + "입니다.");
			System.out.println(a + "은(는) 짝수입니다.");
		} // if
		
		int b = 9;
		if(b % 2 != 0) {	// b를 2로 나눈 나머지 값이 0과 같지 않다 ▶ 홀수
			System.out.println("입력값은 " + b + "입니다." + "\n" + b + "은(는) 홀수입니다.");	
		} // if
	} // main()
} // class

/*
★ 단순 if문 : 조건을 판단하여, 조건이 참일 경우에만 실행

if(조건식){
	실행문장;
}

※ 실행되는 문장이 1줄이면 블럭{}을 생략해도 되지만 권장하지 않는다.
   ▶ if(조건식) 실행문장;
*/