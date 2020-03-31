import java.io.IOException;
import java.io.InputStream;

public class Ex01 {
	// 키보드에서 영문자 1글자를 입력받아 출력
	public static void main(String[] args) {
		InputStream is = System.in;	// 노드 스트림 : 가장 먼저 연결되는 스트림
		System.out.print("영문자 1글자를 입력하세요 : ");	// 대기 상태(Blocked State)
		
		try {
			int data = is.read();
			System.out.println("입력하신 영문자는 " + (char)data + "입니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // main()
} // class