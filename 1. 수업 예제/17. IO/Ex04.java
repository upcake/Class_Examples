import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex04 {
	// 키보드에서 한글 1글자를 입력받아 출력
	// InputStreamReader : 문자 스트림을 입력받는 브릿지 스트림
	public static void main(String[] args) {
		InputStream is = System.in;	// 바이트 스트림 : ASCII Code, 이미지, 영상 음원 등
		InputStreamReader isr = new InputStreamReader(is);	// 문자 스트림 : UniCode
//		InputStreamReader isr = new InputStreamReader(System.in);
		
		System.out.print("한글 1글자를 입력하세요 : ");
		try {
			int data = isr.read();
			System.out.println("입력하신 글자는 " + data + "입니다.");	// UniCode
			System.out.println("입력하신 글자는 " + (char)data + "입니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class