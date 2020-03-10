package sec02;

public class Ex09_BreakOutterExample {
	public static void main(String[] args) {
		// 바깥쪽 반복문 종료
		Outter :
		for(char upper = 'A'; upper <= 'Z'; upper++) {
			for(char lower = 'a'; lower <= 'z'; lower++) {
				System.out.println(upper + "_" + lower);
				if(lower == 'g') {
					break Outter;
				} // if
			} // for a
		} // for A
	System.out.println("프로그램 실행 종료");
	} // main()
} // class