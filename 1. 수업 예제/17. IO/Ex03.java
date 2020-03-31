import java.io.InputStream;

public class Ex03 {
	// 키보드에서 영문자 여러 글자를 입력받아 출력하시오.
	public static void main(String[] args) {
		InputStream is = System.in;
		System.out.print("영문자 여러 글자를 입력하세요 : ");
		
/*
		while(true) {	// 입력 받은 글자가 몇 글자인지 알 수 없다.
			try {
				int data = is.read();
				System.out.println("입력하신 영문자는 " + (char)data + "입니다.");
				
				if(data == -1) {	// Ctrl + C 입력 시 break 명령을 통해 종료
					System.out.println("종료되었습니다.");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		}// while
*/
		
		try {
			int data;
			while((data = is.read()) != -1) {
				System.out.println("입력하신 영문자는 " + (char)data + "입니다.");
			}
			System.out.println("종료되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class