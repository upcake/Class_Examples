import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex13 {
	// member.txt 파일에서 라인 단위(readLine())로 내용을 읽어서
	// membercopy.txt 파일에 저장(출력)
	// 파일 복사 : member.txt → membercopy.txt
	public static void main(String[] args) {
		try {
			// 파일 입력을 위한 준비 단계 : FileReader, BufferedReader
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\member.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			// 파일 출력을 위한 준비 단계 : FileWriter, BufferedWriter
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\membercopy.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			
			// 열려진 파일의 내용을 읽어서 저장할 변수(line)을 초기화
			String line = null;
			
			// 파일의 내용을 읽고 출력하는 로직
			while((line = br.readLine()) != null) {	// readLine() 메서드는 엔터 앞까지만 읽어서 엔터를 못읽는다.
				bw.write(line);
				bw.newLine();		// bw.write("\n"); 줄바꿈하는 메서드
			}
			if (line == null) {
				System.out.println("membercopy.txt 파일이 복사되었습니다.");
				
			}
			// 마지막 버퍼의 내용을 강제 전송(flush()) 후 종료(close())
			bw.flush();
			bw.close();
			br.close();
			fw.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class