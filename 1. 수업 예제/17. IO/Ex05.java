import java.io.InputStreamReader;

public class Ex05 {
	// 키보드에서 한글 여러 글자를 입력받아 출력
	public static void main(String[] args) {
		InputStreamReader isr = new InputStreamReader(System.in);	// 연쇄(연결)
		System.out.print("한글 여러 글자를 입력하세요 : ");;
		try {
			int data;
			while((data = isr.read()) != -1) {
				System.out.println("입력하신 글자는 " + (char)data + "입니다.");
			}
			System.out.println("종료 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class