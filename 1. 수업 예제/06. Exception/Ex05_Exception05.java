import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex05_Exception05 {
	public static void main(String[] args) throws FileNotFoundException {
		FileInputStream fis = new FileInputStream("abc.txt");
	} // main()
} // class

// throws : 예외를 처리하는 방법 → 예외 회피(예외 미루기) ▶ 메소드 선언부에서 사용
// 예) public void xxx() ( ~~body~~ ) ▶ public void xxx() throws XXXException ( ~~body~~ )