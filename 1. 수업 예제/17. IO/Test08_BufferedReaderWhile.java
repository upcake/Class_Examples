import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test08_BufferedReaderWhile {
	public static void main(String[] args) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		try {
			String msg;
			System.out.print("여러 글자를 입력하세요 : ");
			while ((msg = br.readLine()).compareToIgnoreCase("exit") != 0) {
				System.out.println("입력 하신 문자는 : " + msg + "입니다.");
			}
			System.out.println("종료 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class