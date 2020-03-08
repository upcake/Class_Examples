public class Test02_if_else {
	public static void main(String[] args) {
		// 성별코드(code) 값이 1 또는 3이면 '남자', 그외에는 '여자'로 출력
		int code = 1;
		if(code == 1 || code == 3) {
			System.out.println("남자입니다.");
		} else {
			System.out.println("여자입니다.");
		} // if
	} // main()
} // class