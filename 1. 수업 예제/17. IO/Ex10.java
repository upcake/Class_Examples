import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex10 {
	// 버퍼를 이용한 이미지 파일 복사(입출력의 효율화)
	// BufferedInputStream, BufferedOutputStream
	// FileInputStream → BufferedInputStream
	// FileOutputStream → BufferedOutputStream
	// 버퍼의 기본 크기 : 1024Byte
	// 마지막 버퍼에는 기본 크기보다 작은 용량이 버퍼에 남아 있다.
	// 마지막 버퍼에 남아 있는 내용을 강제 전송(flush())후에 종료(close())
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\pic.jpg";	// 원본 파일
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\copy2.jpg";	// 사본 파일
			
			FileInputStream fis = new FileInputStream(inputPath);				// 원본 파일
			FileOutputStream fos = new FileOutputStream(outputPath);			// 사본 파일
			
			BufferedInputStream bis = new BufferedInputStream(fis);				// 입력 버퍼
			BufferedOutputStream bos = new BufferedOutputStream(fos);			// 출력 버퍼
			
			int data, cnt = 0;
			while((data = bis.read()) != -1) {
				cnt++;
				System.out.println(data);
				bos.write(data);
			}
			bos.flush();	// 마지막 버퍼에 남아 있는 강제 전송 후 출력, 버퍼 사용할때는 필수로 해줄것
			bos.close();	// 종료는 역순으로
			bis.close();
			fos.close();
			fis.close();
			System.out.println("접근 횟수 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // main()
} // class