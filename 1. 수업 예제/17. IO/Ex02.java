import java.io.InputStream;

public class Ex02 {
	// 키보드에서 영문자 1글자를 입력 받아 출력
	public static void main(String[] args) {
		InputStream is = System.in;
		System.out.print("영문자 1글자를 입력하세요 : ");
		
		try {
			int data = is.read();
			System.out.println(data);		// 출력 값 : 65
			System.out.println((char)data);	// 출력 값 : A
			
			data = is.read();
			System.out.println(data);		// 출력 값 : 13 
			System.out.println((char)data);	// 출력 값 : 공백 
			
			data = is.read();				
			System.out.println(data);		// 출력 값 : 10
			System.out.println((char)data);	// 출력 값 : 공백
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class

/*
 - 사용자가 영문자를 입력 → Enter 입력
 - Enter를 입력하는 것은 프로그램의 종료(Terminate : Ctrl + C, Break)가 아니다
 - CR(Carriage Return) : 커서를 줄의 맨 앞으로 이동 ▶ ASCII Code : 13
 - LF(Line Feed) : 커서를 한 줄 아래로 이동 ▶ ASCII Code : 10
 - 예) A Enter → 65 13 10
*/