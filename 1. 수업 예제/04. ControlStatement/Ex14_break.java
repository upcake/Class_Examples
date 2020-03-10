public class Ex14_break {
	public static void main(String[] args) {
		// break : 반복문을 탈출하는 명령어
		for(int i = 1; true; i++) {		// 무한 루프
			System.out.println("i의 값 : " + i);
			if(i == 10) {
				System.out.println("i의 값이 10이므로 반복문을 종료합니다.");
				break;
			} // if
		} // for
	} // main()
} // class