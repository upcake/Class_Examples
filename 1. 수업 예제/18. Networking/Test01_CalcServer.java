import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import com.hanul.calc.CalcDAO;
import com.hanul.calc.CalcDTO;

/*
○ CalcServer.java
	①
 - ServerSocket, Socket 생성
 
 	⑤
 - 클라이언트에서 전송한 객체(DTO)를 수신(입력)
 - InputStream → InputStreamReader → BufferedReader (X)
 - InputStream ▶ ObjectInputStream(역직렬화)
 
 	⑥
 - 수신받은 DTO객체의 멤버변수를 이용하여 사칙연산을 수행하는 메서드(getResult)를 호출(CalcDAO)
 
 	⑦
 - 결과를 서버측 화면에 출력
 	첫 번째 정수 : XX
 	두 번째 정수 : XX
 	연산자 : X
 	결과 : XX
 
 	⑧
 - 결과값을 클라이언트에게 송신(출력)
 */
public class Test01_CalcServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		
		try {
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			socket = ss.accept();
			
			CalcDTO dto = new CalcDTO();
			InputStream is = socket.getInputStream();
			ObjectInputStream ois = new ObjectInputStream(is);
			dto = (CalcDTO) ois.readObject();
			
			CalcDAO dao = new CalcDAO();
			dao.getResultDTO(dto);
			
			System.out.println("첫 번째 정수 : " + dto.getNum1());
			System.out.println("두 번째 정수 : " + dto.getNum2());
			System.out.println("연산자 : " + dto.getOpcode());
			System.out.println("결과 : " + dto.getResult());
			
			OutputStream os = socket.getOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(dto);
			
			ois.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally
	} // main()
} // class