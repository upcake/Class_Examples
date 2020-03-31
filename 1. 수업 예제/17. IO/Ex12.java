import java.io.BufferedReader;
import java.io.FileReader;

public class Ex12 {
	// 버퍼를 활용하여 파일에서 문자 단위로 입출력하는 스트림
	// BufferedReader, BufferedWriter
	// BufferedReader에서 readLine() 메서드를 활용하면 한 줄단위로 입력된다.
	public static void main(String[] args) {
		try {
			FileReader fr = new FileReader("member.txt");	// 원본 파일
			BufferedReader br = new BufferedReader(fr);		// 입력 버퍼
			
			String line = null;
			int cnt = 0;
			while((line = br.readLine()) != null) {
				cnt++;
				System.out.println(line);
			}
			br.close();
			fr.close();
			System.out.println("접근 횟수 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // main()
} // class