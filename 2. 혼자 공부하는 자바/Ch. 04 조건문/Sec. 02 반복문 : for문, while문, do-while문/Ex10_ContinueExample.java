package sec02;

public class Ex10_ContinueExample {
	public static void main(String[] args) {
		// continue를 사용한 for문
		for(int i = 1; i <= 10; i++) {
			if(i % 2 != 0) {		// 홀수인 경우
				continue;
			} // if
			System.out.println(i);	// 홀수는 실행되지 않음
		} // for
	} // main()
} // class