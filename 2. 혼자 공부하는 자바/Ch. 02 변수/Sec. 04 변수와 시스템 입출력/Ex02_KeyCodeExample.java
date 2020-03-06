package sec04;

public class Ex02_KeyCodeExample {
	public static void main(String[] args) throws Exception { // 모니터에 예외 내용을 출력
		int keyCode;
		
		keyCode = System.in.read();
		System.out.println("keyCode : " + keyCode); // a의 키코드 97
		
		keyCode = System.in.read();
		System.out.println("keyCode : " + keyCode); // Enter 키의 캐리지 리턴 13
		
		keyCode = System.in.read();
		System.out.println("keyCode : " + keyCode); // Enter 키의 라인 피드 10
	} // main()
} // class