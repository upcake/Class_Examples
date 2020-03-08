public class Ex07_for02 {
	public static void main(String[] args) {
		// 1부터 10까지의 정수 중에서 홀수만 출력 : for(반복), if(홀수판단) ▶ 한 줄로 출력
		for(int i = 1; i < 11; i++) {
			if(i % 2 == 1) {	// (i % 2 != 0)
				System.out.print(i + "\t");
			} // if
		} // for
	} // main()
} // class