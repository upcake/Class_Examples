import java.io.FileReader;

public class Ex11 {
	// 파일(텍스트 문서, 유니코드)에서 문자 단위로 입출력하는 스트림
	// FileReader, FileWriter
	// 한글이 포함된 파일(member.txt)에서 데이터를 읽어서 화면에 출력
	// member.txt 파일 생성 : IO Project > 우클릭 > New > file > 파일명.확장자
	// 내용 작성 시 항목간 구분은 반드시 TAB키를 활용한다.
	public static void main(String[] args) {
		try {
			FileReader fr = new FileReader("member.txt");	// 원본 파일
			
			int data, cnt = 0;
			while((data = fr.read()) != -1) {
				cnt++;
				System.out.println(data);		// 유니코드가 출력
				System.out.println((char)data);	// 유니코드에 해당하는 문자가 출력
			}
			fr.close();
			System.out.println("접근 횟수 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class