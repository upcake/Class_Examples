public class Test03_if_else_if {
	public static void main(String[] args) {
		// 성별코드(code)가 1이면 '남자', 2이면 '여자', 3이면 '남자', 4이면 '여자'
		// 그외에는 오류메세지('성별코드가 잘못 입력되었습니다.') 출력
		int code = 1;
		
		if(code == 1) {
			System.out.println("남자입니다.");
		} else if(code == 2) {
			System.out.println("여자입니다.");
		} else if(code == 3) {
			System.out.println("남자입니다.");
		} else if(code == 4) {
			System.out.println("여자입니다.");
		} else {
			System.out.println("성별코드가 잘 못 입력되었습니다.");
		} // if
		
		if(code == 1 || code == 3) {
			System.out.println("남자입니다.");
		} else if(code == 2 || code == 4) {
			System.out.println("여자입니다.");
		} else {
			System.out.println("성별코드가 잘 못 입력되었습니다.");
		} // if
	} // main()
} // class