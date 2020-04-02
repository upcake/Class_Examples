import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

import com.hanul.calc.CalcDTO;

/*
○ CalcClient.java
 	②
 - Socket 생성
 
 	③
 - 첫 번째 정수를 입력 : num1
 - 두 번째 정수를 입력 : num2
 - 연산자를 입력 : opcode
 - new CalcDTO(num1, num2, opcode);
 
 	④
 - 생성된 객체(DTO)를 서버로 전송(출력)
 - OutputStream ▶ [OutputStreamWriter → BufferedWriter] ▶ PrintWriter (X) : 객체를 전송하기에는 적합하지 않다.
 - OutputStream ▶ ObjectOutputStream(직렬화) 

	⑨
 - 서버에서 전달된 결과값을 수신(입력)받아 출력
  	첫 번째 정수 : XX
 	두 번째 정수 : XX
 	연산자 : X
 	결과 : XX
*/
public class Test01_CalcClient {
	public static void main(String[] args) {
		Socket socket = null;
		
		try {
			socket = new Socket("192.168.0.20", 9999);

			CalcDTO dto = new CalcDTO();
			Scanner scanner = new Scanner(System.in);
			System.out.print("첫 번째 정수를 입력하세요> ");
			int num1 = Integer.parseInt(scanner.nextLine());
			System.out.print("두 번째 정수를 입력하세요> ");
			int num2 = Integer.parseInt(scanner.nextLine());
			System.out.print("연산자를 입력하세요> ");
			String opcode = scanner.nextLine();
			dto = new CalcDTO(num1, num2, opcode);
			scanner.close();
			
			OutputStream os = socket.getOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(dto);
			
			InputStream is = socket.getInputStream();
			ObjectInputStream ois = new ObjectInputStream(is);
			dto = (CalcDTO) ois.readObject();


			System.out.println("첫 번째 정수 : " + dto.getNum1());
			System.out.println("두 번째 정수 : " + dto.getNum2());
			System.out.println("연산자 : " + dto.getOpcode());
			System.out.println("결과 : " + dto.getResult());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally 
	} // main()
} // class