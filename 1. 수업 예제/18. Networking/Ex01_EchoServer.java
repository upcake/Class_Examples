import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

// EchoServer : 정보를 응답(Response, 제공)
// TCP : 오류 검사 수행, 속도는 느리지만 신뢰성이 높다.
/*
Client	Socket	Server
송신		------	수신
(출력)			(입력)
Hello			Hello
 */
public class Ex01_EchoServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			// ServerSocket 생성 : Port 번호 할당
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			
			// Socket 생성 : 클라이언트의 정보가 들어있는 Socket
			// socket = new Socket(); ▶ Client용 Socket
			socket = ss.accept();	// 소켓으로부터 연결 요청을 승인
			
			// 클라이언트가 보낸 메세지를 수신(입력)받기 위한 준비 단계
			InputStream is = socket.getInputStream();	// 소켓으로부터 입력을 받는다. (노드 스트림, byte형 자료)
			InputStreamReader isr = new InputStreamReader(is);	// 문자를 받는다. (브릿지 스트림, 문자형 자료)
			BufferedReader br = new BufferedReader(isr);	// 속도 향상을 위해 버퍼를 사용하여 받는다.
			// socket을 system.in으로 바꾸면 스캐너 클래스의 역할을 한다.
			
			// 클라이언트의 접속 정보(IP주소)를 가져오자
			InetAddress addr = socket.getInetAddress();
			String ip = addr.getHostAddress();
			
			// 클라이언트가 보낸 메세지를 수신받아 화면에 출력하자
			String msg = br.readLine();
			System.out.println(ip + "> 클라이언트로부터 받은 메시지 : " + msg);
			
			// 다시 클라이언트에게 받은 메세지를 송신(출력)하자
			OutputStream os = socket.getOutputStream();		// 소켓으로 연결해서 출력 (노드 스트림)
//			OutputStreamWriter osw = new OutputStreamWriter(os); // 문자로 출력 (브릿지 스트림)
//			BufferedWriter bw = new BufferedWriter(osw);	// 속도를 위해 버퍼를 사용
			PrintWriter pw = new PrintWriter(os);			// 위의 두 스트림 기능을 동시에 담고 있음
			pw.println(msg);
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
			} // try catch
		} // try catch finally
	} // main()
} // class