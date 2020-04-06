import java.net.ServerSocket;
import java.net.Socket;

public class Ex02_ChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			socket = ss.accept();	// 서버의 socket은 미리 만들어둔 서버소켓 ss에서 가져온다.
			
			// 전송한 메시지를 받는 작업(수신, 입력) ▶ ChatReceiverThread
			Thread rt = new Ex02_ChatReceiverThread(socket);
			rt.start();
			
			// 메시지를 입력 받아 보내는 작업(송신, 출력) ▶ ChatSenderThread
			Thread st = new Ex02_ChatSenderThread(socket); // 서버의 ip와 포트를 모르면 송신할수가 없으므로 socket을 매개변수로 넣어준다.
			st.start();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Chat Server Exception!!!");
		} finally {
			try {
//				socket.close();	// 소켓을 서버에서 닫을 필요가 없으므로 지워준다.
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally
	} // main()
} // class