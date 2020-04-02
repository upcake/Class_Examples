import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

import com.hanul.calc.CalcDAO;
import com.hanul.calc.CalcDTO;

public class Test01_CalcServerAnswer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			// ① ServerSocket, Socket 생성
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			socket = ss.accept();
			
			// ⑤ 클라이언트에서 전송한 객체(DTO)를 수신(입력)
			// InputStream → InputStreamReader → BufferedReader (X)
			// OutputStream ▶ ObjectInputStream : 객체 입력
			InputStream is = socket.getInputStream();
			ObjectInputStream ois = new ObjectInputStream(is);
			CalcDTO dto = (CalcDTO) ois.readObject();	// 객체의 역직렬화
			
			// ⑥ 수신받은 DTO 객체의 멤버변수를 이용하여, 사칙연산을 수행하는 메서드 호출
			CalcDAO dao = new CalcDAO();
			int result = dao.getResult(dto);
			
			// ⑦ 결과를 서버측 화면에 출력
			System.out.println("첫 번째 정수 : " + dto.getNum1());
			System.out.println("두 번째 정수 : " + dto.getNum2());
			System.out.println("연산자 : " + dto.getOpcode());
			System.out.println("결과 : " + result);
			
			// ⑧ 결과 값을 클라이언트에게 송신(출력)
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			pw.println(result);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // main()
} // class