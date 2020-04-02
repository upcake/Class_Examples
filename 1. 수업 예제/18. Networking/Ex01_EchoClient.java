//import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
//import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

// EchoClient : 정보를 요청 (Request, 질의)
public class Ex01_EchoClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			// 서버에 접속을 시도하여 접속이 성공하면 Socket 생성
			// Client Socket : 서버의 IP주소 + 서버의 Port 번호
			socket = new Socket("192.168.0.20", 9999);
			
			// 클라이언트에서 송신(출력)하기 위한 준비단계
			OutputStream os = socket.getOutputStream();		// 소켓으로 연결해서 출력 (노드 스트림)
//			OutputStreamWriter osw = new OutputStreamWriter(os); // 문자로 출력 (브릿지 스트림)
//			BufferedWriter bw = new BufferedWriter(osw);	// 속도를 위해 버퍼를 사용
			PrintWriter pw = new PrintWriter(os);			// 위의 두 스트림 기능을 동시에 담고 있음
			
			// 키보드에서 메세지를 입력받아 서버로 보내자
			Scanner scanner = new Scanner(System.in);
			System.out.print("서버로 보낼 메시지를 입력하세요> ");
			String msg = scanner.nextLine();
			scanner.close();
			
			pw.println(msg);	// PrintWriter는 println() 메서드로 출력한다.
			pw.flush();			// 버퍼 기능을 갖기 때문에 flush() 해줘야한다.
			
			// 서버에서 보낸 메세지를 수신(입력)받아 화면에 출력
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String echoMsg = br.readLine();
			System.out.println("서버로부터 받은 메시지 : " + echoMsg);
			br.close();
			pw.close();
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