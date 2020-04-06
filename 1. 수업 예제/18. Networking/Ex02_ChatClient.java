import java.net.Socket;

public class Ex02_ChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.20", 9999);
			
			// 메시지를 입력 받아 보내는 작업(송신, 출력) ▶ ChatSenderThread
			Thread st = new Ex02_ChatSenderThread(socket); // 서버의 ip와 포트를 모르면 송신할수가 없으므로 socket을 매개변수로 넣어준다.
			st.start();
			
			// 전송한 메시지를 받는 작업(수신, 입력) ▶ ChatReceiverThread
			Thread rt = new Ex02_ChatReceiverThread(socket);
			rt.start();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Chat Client Exception!!!");
		} /* finally { // 소켓을 클라이언트에서 닫아줄 필요가 없으므로 지운다.
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} */
	} // main()
} // class